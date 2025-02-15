class Influencer < ApplicationRecord
  enum :platform, { instagram: 0, tiktok: 1, youtube: 2 }

  validates :external_id, uniqueness: { scope: :platform }, allow_nil: true
  validates :username, presence: true
  validates :platform, presence: true
  validates :followers, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
