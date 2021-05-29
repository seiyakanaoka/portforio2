class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :genres, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :seat, presence: true, on: :update
end
