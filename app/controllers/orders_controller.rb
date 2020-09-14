class OrdersController < ApplicationController
  
  def index
  end
  
  def new
    @order = Destination.new
  end

  def create
    @order = Destination.create(dastination_params)
  end

  private

  def orders_params
    params.require(:destination).permit(:post_code,:prefecture,:city,:adress,:building_name,:phone_number,:item_transaction_id)
  end


end

