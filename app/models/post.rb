class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :body, presence: true,
                   length: { minimum: 2, maximum: 240 }

  validates :user_id, presence: true
end
