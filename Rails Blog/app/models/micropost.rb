class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, length: { maximum: 1000 },
                      presence: true
  validates :user_id, presence: true
end
