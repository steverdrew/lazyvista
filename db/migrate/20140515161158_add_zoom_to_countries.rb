class AddZoomToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :zoom, :integer
  end
end
