class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_date
      t.text :location

      t.timestamps
    end
  end
end
