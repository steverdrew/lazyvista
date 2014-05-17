class AddAttachmentItemToPropertyGalleries < ActiveRecord::Migration
  def self.up
    change_table :property_galleries do |t|
      t.attachment :item
    end
  end

  def self.down
    drop_attached_file :property_galleries, :item
  end
end
