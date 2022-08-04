class Contact < ApplicationRecord
  validates_presence_of :name
  validates :message, uniqueness: true, length: {minimum: 10}
end
