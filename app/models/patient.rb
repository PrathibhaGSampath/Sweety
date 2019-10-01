class Patient < User
	has_and_belongs_to_many :doctors, join_table: 'doctors_patients'
	has_many :blood_glucose_levels


	scope :get_all_patients_list, -> { all }
end
