class AddBedroomsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :bedrooms, :integer
  end
end
