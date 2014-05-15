class CreatePropertyTypes< ActiveRecord::Migration
  def change
    create_table :property_types do |t|
      t.string :name
      t.timestamps
      
      #add_index :property_types, :id, :unique => true
    end
  end
end
