class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    orders = Order.all
    render json: OrderBlueprint.render(orders, view: :normal)
  end

  def create
    order = Order.create(order_params)
    if order.save
      render json: order, status: :created
    else 
      render json: order.errors, status: :unprocessable_entity
  end

  def show
    render json: OrderBlueprint.render(set_order, view: :normal), status: :ok
  end

  def update
    if set_user.update(order_params)
      render json: OrderBlueprint.render(set_order, view: :extended), status: :ok
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if set_order.destroy
      render json: { message: 'Successfully deleted user.' }
    else
      render json: { error: 'Unable to delete user.' }, status: :unprocessable_entity
    end
  end

  private

  def set_order
    order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :car_id, 
      :requested_date, 
      :received_date, 
      :extraction_start, 
      :extraction_end, 
      :release_date, 
      :user_id, 
      :raw_material_id, 
      :weight)
    end
  end
end