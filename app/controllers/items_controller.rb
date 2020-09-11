class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]
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
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end


  

  private

  def item_params
    params.require(:item).permit(:name, :price, :item_condition_id, :description, :category_id, :shipping_cost_id, :shipping_date_id, :shipping_origin_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
