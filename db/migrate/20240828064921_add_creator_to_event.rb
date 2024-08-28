class AddCreatorToEvent < ActiveRecord::Migration[7.2]
  def change
    add_reference :events, :creator
    add_foreign_key :events, :users, column: :creator_id
  end
end
