class AddAttachmentAssetToPropertyAssets < ActiveRecord::Migration
  def self.up
    change_table :property_assets do |t|
      t.attachment :asset
    end
  end

  def self.down
    drop_attached_file :property_assets, :asset
  end
end
