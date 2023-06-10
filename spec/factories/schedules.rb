FactoryBot.define do
  factory :schedule do
    schedule_title { "スケジュール" }
    assumed_number_people { 1 }
    get_up_time { "1970-01-01 05:22:24" }
    sleep_time { "1970-01-01 05:22:24" }
    user
  end
end
