class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :schedule_title,         null: false   
      t.integer :assumed_number_people, null: false   
      t.time :get_up_time,              null: false   
      t.time :sleep_time,               null: false   
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
