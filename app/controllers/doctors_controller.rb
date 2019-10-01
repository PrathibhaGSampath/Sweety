class DoctorsController < ApplicationController
	before_action :authenticate_doctor!
	def patients_list
		unless current_doctor.blank?
			@patients = []
			@patients = current_doctor.patients
			@patients = Patient.get_all_patients_list if @patients.blank?
		end
	end
end
