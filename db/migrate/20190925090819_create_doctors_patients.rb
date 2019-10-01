class CreateDoctorsPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors_patients do |t|
      t.bigint :doctor_id
      t.bigint :patient_id
    end
  end
end
