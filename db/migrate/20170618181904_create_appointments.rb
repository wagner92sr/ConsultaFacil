class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.date :date
      t.text :observations
      t.integer :status
      t.references :hospital
      t.references :doctor
      t.references :paciente

      t.timestamps
    end
  end
end
