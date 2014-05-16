class AddPlaceIdToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :place_id, :integer
  end
end
