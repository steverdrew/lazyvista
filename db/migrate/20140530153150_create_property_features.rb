class CreatePropertyFeatures < ActiveRecord::Migration
  def change
    create_table :property_features do |t|

      t.integer :property_id
      t.integer :feature_id  
      t.timestamps
    end
    
    add_index :property_features, :property_id
    add_index :property_features, :feature_id 
   
  end
end
