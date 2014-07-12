class CreateCalendarEvents < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      
      t.integer :calendar_id
      t.timestamps
    end
    add_index :calendar_events, :calendar_id
  end
end
