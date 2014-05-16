class AddCapacityToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :capacity, :integer
  end
end
