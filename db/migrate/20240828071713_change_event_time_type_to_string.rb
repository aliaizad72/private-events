class ChangeEventTimeTypeToString < ActiveRecord::Migration[7.2]
  def change
    change_column :events, :event_time, :text
  end
end
