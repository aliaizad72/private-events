class ChangeEventTimeFormat < ActiveRecord::Migration[7.2]
  def change
    change_column :events, :event_time, :datetime
    rename_column :events, :event_time, :time
  end
end
