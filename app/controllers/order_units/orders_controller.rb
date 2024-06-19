class OrderUnits::OrdersController < ApplicationController
  def create
    @order_form = OrderForm.new(current_order_unit, params[:orders])
    @order_form.create!
    redirect_to order_unit_path(current_order_unit), success: '注文しました'
  end
end
