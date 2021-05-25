class Genre < ApplicationRecord
  belongs_to :admin
  has_many :items, dependent: :destroy
end
