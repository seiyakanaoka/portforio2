class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :admin
  belongs_to :item

  validates :seat, presence: true, on: :update
end
