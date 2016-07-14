class Tweet < ApplicationRecord
  validates :body, length: { maximum: 140 }

  belongs_to :user
end
