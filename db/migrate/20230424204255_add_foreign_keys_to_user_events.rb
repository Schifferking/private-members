class AddForeignKeysToUserEvents < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :user_events, :users, column: :attendee_id
    add_foreign_key :user_events, :events, column: :attended_event_id
  end
end
