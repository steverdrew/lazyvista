class AddCoordinatesToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :lat, :decimal
    add_column :countries, :lng, :decimal
  end
end
