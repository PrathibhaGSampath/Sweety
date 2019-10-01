class AddCheckedAtColumntoBloodGlucoseLevel < ActiveRecord::Migration[5.2]
  def change
  	add_column :blood_glucose_levels, :checked_at, :datetime
  end
end
