class AddSummaryToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :summary, :text
  end
end
