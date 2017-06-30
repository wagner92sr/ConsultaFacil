class AddAttachmentPictureToHospitals < ActiveRecord::Migration[5.0]
  def self.up
    change_table :hospitals do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :hospitals, :picture
  end
end
