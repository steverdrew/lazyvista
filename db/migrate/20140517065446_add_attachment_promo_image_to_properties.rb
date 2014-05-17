class AddAttachmentPromoImageToProperties < ActiveRecord::Migration
  def self.up
    change_table :properties do |t|
      t.attachment :promo_image
    end
  end

  def self.down
    drop_attached_file :properties, :promo_image
  end
end
