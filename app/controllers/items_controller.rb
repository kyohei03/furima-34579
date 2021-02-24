class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :item_find, only: [:edit, :update, :show, :destroy]
  before_action :check_user, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def check_user
    redirect_to action: :index unless current_user == @item.user
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :status_id, :judgment_id, :cost_id, :prefecture_id, :days_id,
                                 :user_id, :image).merge(user_id: current_user.id)
  end
end
