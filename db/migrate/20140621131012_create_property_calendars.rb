class CreatePropertyCalendars < ActiveRecord::Migration
  def change
    create_table :property_calendars do |t|
      t.string :name
      t.integer :property_id
      t.timestamps
    end
    add_index :property_calendars, :property_id
  end
end
