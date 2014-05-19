class AddInactiveToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :inactive, :boolean, :default => true, :required => true
  end
end
