class ApplicationController < ActionController::Base
  add_flash_types :info, :success, :warning, :error

  private
  def current_order_unit
    OrderUnit.find_by!(code: params[:code] || params[:order_unit_code])
  end

  def current_order
    current_order_unit.order || Order.new(order_unit: current_order_unit)
  end

  helper_method :current_order_unit, :current_order

end
