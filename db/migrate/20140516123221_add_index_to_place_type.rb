class AddIndexToPlaceType < ActiveRecord::Migration
  def change
    add_index :place_types, :name, :unique => true
  end
end
