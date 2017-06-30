class AddAttachmentPictureToDoctors < ActiveRecord::Migration[5.0]
  def self.up
    change_table :doctors do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :doctors, :picture
  end
end
