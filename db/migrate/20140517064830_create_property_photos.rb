class CreatePropertyPhotos < ActiveRecord::Migration
  def change
    create_table :property_photos do |t|
      t.integer :property_id
    end
    add_index :property_photos, :property_id
  end
end
