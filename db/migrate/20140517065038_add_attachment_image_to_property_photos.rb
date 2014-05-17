class AddAttachmentImageToPropertyPhotos < ActiveRecord::Migration
  def self.up
    change_table :property_photos do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :property_photos, :image
  end
end
