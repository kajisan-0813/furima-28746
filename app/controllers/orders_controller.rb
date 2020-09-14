class OrdersController < ApplicationController
  def index
    @item =Item.find(params[:item_id])
  end
  
  def new
    @order = Destination.new
  end

  def create
    @order = Destination.create(dastination_params)
  end

  private

  def orders_params
    params.require(:destination).permit(:post_code,:prefecture,:city,:adress,:building_name,:phone_number,:item_transaction_id).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  


end

