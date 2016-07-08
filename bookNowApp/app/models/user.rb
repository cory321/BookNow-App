class User < ActiveRecord::Base
	has_secure_password
	has_many :events
	has_many :couples

  validates :email, uniqueness: {case_sensitive: false}, presence: true
  # validates :avatar_url, presence: true
end
