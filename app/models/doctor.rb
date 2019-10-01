class Doctor < User
	has_and_belongs_to_many :patients, join_table: 'doctors_patients'

	scope :get_a_doctor_record, -> (doctor_id) { find_by_id(id: doctor_id) }
end
