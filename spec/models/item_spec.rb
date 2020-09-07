require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
 end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'neme、price、description、item_condition_id,category_id、shipping_cost_id、shipping_date_id、shipping_origin_id、user_id、imageが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
  
    context '商品出品がうまくいかないとき' do
      it '商品名が空では保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '画像が空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の説明がが空では保存できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '商品カテゴリーの説明が空では保存できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では保存できないこと' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it '配送料の負担が空では保存できないこと' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '発送元の地域が空では保存できないこと' do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end

      it '発送までの日数が空では保存できないこと' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end

      it '商品価格が空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は半角数字でないと登録できないこと' do
        @item.price = "/d"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格は300円以下だと登録できないこと' do
        @item.price = "250"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it '販売価格は10000000円以上だと登録できないこと' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end







      









      
      


      


    
    
    
    
      
      
      
    end
  end
end
