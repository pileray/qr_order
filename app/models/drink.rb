class Drink < ApplicationRecord
  has_many :order_details
  validates :name, presence: true
  validates :price, presence: true
end
