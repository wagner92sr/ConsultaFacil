class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.string :name, limit: 30, null: false
      t.string :address, limit: 30, null: false
      t.string :city, limit: 30, null: false
      t.string :phone, limit: 10

      t.timestamps
    end
  end
end
