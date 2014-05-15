class AddIndexToPropertyType < ActiveRecord::Migration
  def change
    add_index :property_types, :name, :unique => true
  end
end
