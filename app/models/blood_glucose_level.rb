class BloodGlucoseLevel < ApplicationRecord
	belongs_to :patient

	before_create :check_record_limit_per_day, prepend: true
	after_save :check_patient_test_time
	validates_presence_of :level, :patient_id
	validates_numericality_of :level, { only_integer: true , greater_than_or_equal_to: 10}

	scope :patients_record_per_day, -> (patient_id, date) { where(patient_id: patient_id, created_at: date.beginning_of_day..date.end_of_day).order('created_at DESC') }
	scope :patient_records, -> (patient_id) { where(patient_id: patient_id) }
	scope :get_a_record, -> (record_id) { find_by_id(record_id) }
	scope :get_patient_record_monthwise, -> (record_id) { where(patient_id: record_id).order('checked_at DESC').group_by{ |record| record.checked_at.month } }
	scope :get_patient_record_daywise, -> (record_id) { where(patient_id: record_id).group_by{ |record| record.updated_at.beginning_of_day } }

	private 
	def check_record_limit_per_day
		unless self.patient_id.blank?
			records = BloodGlucoseLevel.patients_record_per_day(self.patient_id, Date.today)
			p "record_count", records.count
			if records.count >= 4
				throw :abort
			end
		else
			throw :abort
		end
	end

	def check_patient_test_time
		p "self", self
		if self.checked_at.nil?
			self.checked_at = self.updated_at
		end
	end
end
