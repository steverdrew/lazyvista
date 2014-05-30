class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.integer :feature_type_id
      t.timestamps
    end
    add_index :features, :feature_type_id    
  end
end
