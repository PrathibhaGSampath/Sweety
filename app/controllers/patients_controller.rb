class PatientsController < ApplicationController
	before_action :authenticate_patient!
end
