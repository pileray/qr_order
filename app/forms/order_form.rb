class OrderForm
  include ActiveModel::Model
  attr_accessor :order, :order_details

  class OrderDetail
    include ActiveModel::Model
    attr_accessor :order, :drink_id, :count
    validates :drink_id, :count, presence: true

    def save!
      self.count.times do
        ::OrderDetail.create!(order: self.order, drink_id: self.drink_id)
      end
    end
  end

  def initialize(order_unit, order_params)
    @order = order_unit.order || order_unit.build_order
    @order_details = []
    order_params.select {|i, order_param| order_param[:count].to_i > 0 }.each do |i, order_param|
      @order_details << OrderForm::OrderDetail.new(order: @order, drink_id: order_param[:drink_id], count: order_param[:count].to_i)
    end
  end

  def create!
    ActiveRecord::Base.transaction do
      @order.save! if @order.new_record?
      @order_details.each(&:save!)
    end
  end
end
