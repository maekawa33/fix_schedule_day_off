class Event < ApplicationRecord
  belongs_to :schedule

  validates :start_time, presence: true
  validates :event_title, presence: true, length: { maximum: 18 }

  has_one_attached :image do |attachable|
    attachable.variant :user_index, resize_to_limit: [100, 100]
  end

  scope :start_time_order, -> { order(start_time: :ASC) }
end
