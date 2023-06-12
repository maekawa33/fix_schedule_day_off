class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_title, null: false
      t.time :start_time,    null: false
      t.time :end_time
      t.integer :price
      t.string :comment
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
