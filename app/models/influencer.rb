class Influencer < ApplicationRecord
  enum :platform, { instagram: 0, tiktok: 1, youtube: 2 }

  validates :external_id, uniqueness: { scope: :platform }, allow_nil: true
  validates :username, presence: true, uniqueness: { scope: :platform }
  validates :fullname, presence: true
  validates :platform, presence: true
  validates :picture, presence: true
  validates :followers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
