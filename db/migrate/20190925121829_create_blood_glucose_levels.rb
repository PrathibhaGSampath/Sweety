class CreateBloodGlucoseLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :blood_glucose_levels do |t|
      t.integer :level
      t.integer :patient_id
      
      t.timestamps
    end
  end
end
