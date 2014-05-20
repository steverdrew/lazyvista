class AddAttachmentPromoVideoToProperties < ActiveRecord::Migration
  def self.up
    change_table :properties do |t|
      t.attachment :promo_video
    end
  end

  def self.down
    drop_attached_file :properties, :promo_video
  end
end
