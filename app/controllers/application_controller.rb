class ApplicationController < ActionController::Base

	protect_from_forgery with: :null_session
  	skip_before_action :verify_authenticity_token
  	
  	devise_group :user, contains: [:doctor, :patient]

	protected
	def after_sign_in_path_for(resource)
		path = current_doctor.present? ? '/Patients' : (current_patient.present? ? '/patient/blood_glucose_level' : root_path)
		stored_location_for(resource) || path
	end
end
