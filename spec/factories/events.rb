FactoryBot.define do
  factory :event do
    event_title { "title" }
    start_time { "2000-01-01 07:50:00" }
    end_time { "2000-01-01 08:50:00" }
    price { 500 }
    comment { "comment" }
    schedule
  end
end
