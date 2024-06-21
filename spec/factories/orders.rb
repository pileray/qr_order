FactoryBot.define do
  factory :order do
    order_unit { nil }
    total_without_tax { 1 }
    total_with_tax { 1 }
    paid_at { "2024-06-17 17:38:50" }
  end
end
