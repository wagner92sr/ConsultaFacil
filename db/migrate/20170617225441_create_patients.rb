class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.integer :cpf
      t.string :name
      t.string :address
      t.string :city
      t.string :phone

      t.timestamps
    end
  end
end
