class Patient
	class BloodGlucoseLevelController < ApplicationController
		before_action :authenticate_patient!, except: [:index]

		def index
			@records = []
			patient_id = current_patient.blank? ? params[:patient_id] : current_patient.id 
			@records = BloodGlucoseLevel.get_patient_record_monthwise(patient_id) unless patient_id.blank?
			p "Records", @records
			p "Patient id", patient_id
		end

		def show
			record_id = params[:id]
			unless record_id.blank?
				record = BloodGlucoseLevel.get_a_record(record_id)
				unless record.blank?
					@record = record 
				else
					p "Record not found"
				end
			else
				p "Flash error message"
			end
			redirect_to '/patient/blood_glucose_level'
		end

		def new
			@new_glucose_reading = BloodGlucoseLevel.new
		end

		def create
			unless current_patient.blank?
				glucose_level = params[:blood_glucose][:level]
				date = params[:blood_glucose]["checked_at(1i)"] + "/" + params[:blood_glucose]["checked_at(2i)"]+ "/" + params[:blood_glucose]["checked_at(3i)"]+ " " + params[:blood_glucose]["checked_at(4i)"] + ":" + params[:blood_glucose]["checked_at(5i)"]
				new_record = BloodGlucoseLevel.new
				new_record[:patient_id] = current_patient.id
				new_record[:level] = glucose_level
				new_record[:checked_at] = date

				if new_record.save
					p "Success Flash message"
				else
					p "Error Flash message"
				end
			else
				p "Internal Error"
			end
			redirect_to '/patient/blood_glucose_level'
		end

		def edit
			id = params[:id]
			@blood_glucose_reading = BloodGlucoseLevel.get_a_record(id)
		end

		def update
			id = params[:id]
			date = params[:blood_glucose]["checked_at(1i)"] + "/" + params[:blood_glucose]["checked_at(2i)"]+ "/" + params[:blood_glucose]["checked_at(3i)"]+ " " + params[:blood_glucose]["checked_at(4i)"] + ":" + params[:blood_glucose]["checked_at(5i)"]
			p "Checked at", date.to_datetime
			blood_glucose_level = params[:blood_glucose][:level].to_i
			blood_glucose_reading = BloodGlucoseLevel.get_a_record(id)
			unless blood_glucose_reading.blank? || blood_glucose_level.blank?
				blood_glucose_reading[:level] = blood_glucose_level 
				blood_glucose_reading[:checked_at] = date
				if blood_glucose_reading.save 
					p "Success Flash message"
				else
					p "Error Flash message"
				end
			else
				p "Internal Error"
			end
			redirect_to '/patient/blood_glucose_level'
		end
	end
end
