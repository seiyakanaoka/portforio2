class Item < ApplicationRecord
  belongs_to :admin
  belongs_to :genre

  mount_uploader :image, ImageUploader
end
