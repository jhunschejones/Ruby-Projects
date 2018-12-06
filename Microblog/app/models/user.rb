class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, 
            length: { maximum: 255 }, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
            # only accepts a unique value, iregardless of casing
            uniqueness: { case_sensitive: false }
end
