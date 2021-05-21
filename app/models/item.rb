class Item < ApplicationRecord
  belongs_to :admin
  belongs_to :genre

  attachment :item_image
end
