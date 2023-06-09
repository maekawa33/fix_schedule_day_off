class Schedule < ApplicationRecord
  before_save :check_day_sleep_time
  
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :schedule_title, presence: true, length: { maximum: 13 }
  validates :assumed_number_people, presence: true
  validates :get_up_time, presence: true
  validates :sleep_time, presence: true

  enum assumed_number_people: { one_person: 0, two_people: 1, three_people: 2, four_or_more_people: 3 }

  def total_price
    total_price = 0
    events.each do |event|
      total_price += event.price if event.price
    end
    total_price
  end

  def check_day_sleep_time
    sleep_time + 1.day if get_up_time > sleep_time
  end
end
