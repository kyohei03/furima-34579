class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @buyers_orders = BuyersOrders.new
    @Buyers_orders = Item.find(params[:item_id])
  end
  
  def create
  end
  
  private
  
    def buyers_orders_params
      params.require(:order).permit(:user_id, :item_id).merge(user_id: current_user.id)
    end
end