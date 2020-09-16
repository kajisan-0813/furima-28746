class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: [:index]
  def index
    @item = Item.find(params[:item_id])
    @order = UserTransaction.new
  end

  def new
    @order = UserTransaction.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserTransaction.new(destination_params)

    if @order.valid?
      @order.save

      pay_item
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def destination_params
    params.permit(:post_code, :prefecture, :city, :adress, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: destination_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
