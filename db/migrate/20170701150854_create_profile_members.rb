class CreateProfileMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_members do |t|
      t.string :first_name
      t.string :second_name
      t.date :birthdate
      t.string :mother_name
      t.references :paciente, index: true, foreign_key: true 	

      t.timestamps
    end
  end
end
