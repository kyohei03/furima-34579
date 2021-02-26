class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :order_find, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  
  def index
    @buyers_orders = BuyersOrders.new
  end
  
  def create
    @buyers_orders = BuyersOrders.new(buyers_orders_params)
    if @buyers_orders.valid?
      @buyers_orders.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_find
    @Buyers_orders = Item.find(params[:item_id])
  end

  def sold_out_item
    redirect_to root_path if @item.present?
  end

  def buyers_orders_params
    params.require(:buyers_orders).permit(:address, :city, :post_code, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end