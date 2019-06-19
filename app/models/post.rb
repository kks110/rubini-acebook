class Post < ApplicationRecord

  validates :body, presence: true,
                   length: { minimum: 2, maximum: 240 }

end
