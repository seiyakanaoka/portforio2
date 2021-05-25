class Item < ApplicationRecord
  belongs_to :admin
  belongs_to :genre
  has_many :reservations, dependent: :destroy

  attachment :item_image
end
