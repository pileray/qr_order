class OrderUnits::OrderHistoriesController < ApplicationController
  def index
    @order_histories = if current_order.present?
                          select = <<~SQL.squish
                            drinks.name AS drink_name,
                            SUM(drinks.price) AS total,
                            COUNT(order_details.id) AS order_count
                          SQL
                          current_order.order_details.joins(:drink).group(:drink_id).select(select)
                        else
                          []
                        end
    # @order_details = current_order.order_details.joins(:drink).group_by(&:drink)
    # @drink_totals = @order_details.map do |drink, details|
    #   total_count = details.size
    #   total_price_without_tax = total_count * drink.price
    #   total_price_with_tax = total_price_without_tax * 1.1

    #   {
    #     drink_name: drink.name,
    #     total_count: total_count,
    #     total_price_without_tax: total_price_without_tax,
    #     total_price_with_tax: total_price_with_tax
    #   }
    # end

    # @total_price_without_tax = @drink_totals.sum {|v| v[:total_price_without_tax] }
    # @total_price_with_tax = @drink_totals.sum {|v| v[:total_price_with_tax] }
  end
end
