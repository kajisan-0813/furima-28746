class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save

      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :item_condition_id, :description, :category_id, :shipping_cost_id, :shipping_date_id, :shipping_origin_id, :image).merge(user_id: current_user.id)
  end
end
