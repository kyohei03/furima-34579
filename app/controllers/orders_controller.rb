class OrdersController < ApplicationController
  before_action :authenticate_user!, , only: [:new, :create]
  
  def index
    @buyers_orders = Buyers_orders.new
  end
  
  def create
  end
  
  private
  
    def order_params
      params.require(:order).permit(:user_id, :item_id).merge(user_id: current_user.id)
    end
end

# @Buyers_orders = Buyers_orders.find(params[:id])