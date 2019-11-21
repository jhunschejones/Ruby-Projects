class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  after_destroy :ensure_not_last_admin
  has_secure_password

  class AdminUserError < StandardError; end

  private
    def ensure_not_last_admin
      if User.count.zero?
        raise AdminUserError.new "You can't delete the last admin user!"
      end
    end
end
