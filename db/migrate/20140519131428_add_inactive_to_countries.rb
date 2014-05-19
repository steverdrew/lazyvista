class AddInactiveToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :inactive, :boolean, :default => true
  end
end
