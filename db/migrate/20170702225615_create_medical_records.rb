class CreateMedicalRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_records do |t|
      t.text :observations
      t.string :references
      t.string :doctor
      t.string :references
      t.string :paciente
      t.string :references
      t.string :hospital
      t.string :references
      t.string :appointment

      t.timestamps
    end
  end
end
