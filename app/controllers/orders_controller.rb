class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item =Item.find(params[:item_id])
  end

  def new
    
    @order = UserTransaction.new
  end
    
  def create
    @item =Item.find(params[:item_id])
    @order = UserTransaction.new(destination_params)
    
    if  @order.save  
      redirect_to root_path
    else
      redirect_to item_orders_path   
    end
  end

  private

  def destination_params
    params.permit(:post_code,:prefecture,:city,:adress,:building_name,:phone_number,:item_transaction_id).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_3b684ef7ee0b124d154af35f"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
 

  


end

