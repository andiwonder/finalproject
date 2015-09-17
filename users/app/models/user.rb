class User < ActiveRecord::Base
  validates :password, presence: true
  validates :user_name, uniqueness: true, presence: true
end