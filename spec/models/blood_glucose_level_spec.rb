require 'rails_helper'

RSpec.describe BloodGlucoseLevel, type: :model do
  context "BloodGlucoseLevel record Creation" do
    it "with missing level attribute" do
    	new_glucose_reading = BloodGlucoseLevel.new
    	new_glucose_reading.save
      	expect(new_glucose_reading).to_not be_valid
    end
    it "with level attribute less han 10" do
    	new_glucose_reading = BloodGlucoseLevel.new
    	new_glucose_reading.level = 1
    	new_glucose_reading.patient = Patient.create(email: "example@test.com", password: "password")
    	new_glucose_reading.save
      	expect(new_glucose_reading).to_not be_valid
    end

    it "with valid attribute values" do
    	new_glucose_reading = BloodGlucoseLevel.new
    	new_glucose_reading.level = 100
    	new_glucose_reading.checked_at = "2019/10/01 11:00"
    	new_glucose_reading.patient = Patient.create(email: "example@test.com", password: "password")
    	new_glucose_reading.save
      	expect(new_glucose_reading).to be_valid
    end
  end
end
