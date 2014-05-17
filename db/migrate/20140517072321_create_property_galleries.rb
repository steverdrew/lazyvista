class CreatePropertyGalleries < ActiveRecord::Migration
  def change
    create_table :property_galleries do |t|
      t.integer :property_id
      t.string :description 
      t.timestamps
    end
    add_index :property_galleries, :property_id
  end
end
