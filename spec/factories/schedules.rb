FactoryBot.define do
  factory :schedule do
    schedule_title { "スケジュール" }
    assumed_number_people { 1 }
    get_up_time { "2000-01-01 07:00:00" }
    sleep_time { "2000-01-01 21:00:00" }
    user
  end
end
