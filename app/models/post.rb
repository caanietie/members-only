class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy

  validates :title, length: {minimum: 5}
  validates :body, uniqueness: true, length: {minimum: 50}
end
