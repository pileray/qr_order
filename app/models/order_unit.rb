class OrderUnit < ApplicationRecord
  has_one :order, dependent: :restrict_with_error
  validates :code, presence: true, uniqueness: true
end
