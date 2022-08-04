class Comment < ApplicationRecord
  belongs_to :post
  
  validates_presence_of :commenter
  validates :body, presence: true, uniqueness: true
end
