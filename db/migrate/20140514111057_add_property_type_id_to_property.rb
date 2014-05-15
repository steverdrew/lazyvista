class AddPropertyTypeIdToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :property_type_id, :integer
    add_index :properties, :property_type_id
  end
end
