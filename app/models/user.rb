class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false
  validates :introduction, length: {maximum: 50}
  validates :name, presence: true, length: {maximum: 20, minimum: 2}, uniqueness: true
end
