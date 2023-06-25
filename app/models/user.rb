class User < ApplicationRecord
  before_save :default_avatar

  authenticates_with_sorcery!

  has_one_attached :avatar do |attachable|
    attachable.variant :user_index, resize_to_limit: [100, 100]
  end

  has_many :schedules, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  private

  def default_avatar
    avatar.attach(io: Rails.root.join('app/assets/images/default_avatar.png').open, filename: 'default-avatar.png', content_type: 'image/png') unless avatar.attached?
  end
end
