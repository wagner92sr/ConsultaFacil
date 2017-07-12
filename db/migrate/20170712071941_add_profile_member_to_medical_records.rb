class AddProfileMemberToMedicalRecords < ActiveRecord::Migration[5.1]
  def change
    add_reference :medical_records, :profile_member, foreign_key: true
  end
end
