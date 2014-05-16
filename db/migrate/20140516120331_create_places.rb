class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.integer :place_type_id
      t.timestamps
    end
  end
end
