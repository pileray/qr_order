class Admin::OrderUnitsController < Admin::BaseController
  def index
    @order_units = OrderUnit.all.includes(:order).order(created_at: :desc)
  end

  def create
    code = SecureRandom.hex
    OrderUnit.create!(code: code)
    redirect_to admin_order_units_path, success: 'QRを発行しました'
  end
end
