class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  has_many :comments
end
