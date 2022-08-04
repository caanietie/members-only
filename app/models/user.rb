class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, format: /\A\w{5,}\z/
end
