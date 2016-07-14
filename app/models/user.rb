class User < ApplicationRecord
  validates :fullname, null: false
  validates :email, null: false
  validates :handle, null: false

  has_many :tweets
end
