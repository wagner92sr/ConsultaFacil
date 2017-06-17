class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.integer :crm
      t.string  :name
      t.string  :address
      t.string  :city
      t.string  :phone
      t.integer :skill
      t.references :hospital, foreign_key: true

      t.timestamps
    end
  end
end
