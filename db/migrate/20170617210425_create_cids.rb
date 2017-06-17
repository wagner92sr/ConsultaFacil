class CreateCids < ActiveRecord::Migration[5.1]
  def change
    create_table :cids do |t|
      t.string :cid
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
