class Order < ApplicationRecord
  has_many :order_details, dependent: :restrict_with_error
  has_many :drinks, through: :order_details
  belongs_to :order_unit
end
