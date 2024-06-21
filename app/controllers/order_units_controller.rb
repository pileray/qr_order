class OrderUnitsController < ApplicationController
  def show
    redirect_to order_unit_order_histories_path(current_order_unit), error: '会計済みです' if current_order&.paid_at.present?
  end
end
