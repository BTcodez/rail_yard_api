class OrdersController < ApplicationController
  
  def index
    orders = Order.all
    render json: orders
  end

  def create
    order = Order.create(order_params)
    render json: order
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    render json: order
  end

  def delete
    order = Order.find(params[:id])
    order.destroy
  end

  private

  def order_params
    params.require(:order).permit(:car_id, :requested_date, :received_date, :extraction_start, :extraction_end, :release_date, :user_id, :raw_material_id, :weight)
  end
end
