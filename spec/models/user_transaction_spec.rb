require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  describe '購入者情報の保存' do
    before do
      @user_transaction = FactoryBot.build(:user_transaction)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_transaction).to be_valid
    end
    it 'post_codeが空だと保存できないこと' do
      @user_transaction.post_code = nil
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeがハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_transaction.post_code = '1234567'
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @user_transaction.prefecture = 0
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityは空だと保存できないこと' do
      @user_transaction.city = nil
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("City can't be blank")
    end
    it 'adressは空だと保存できないこと' do
      @user_transaction.adress = nil
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Adress can't be blank")
    end
    it 'phone_numberは空だと保存できないこと' do
      @user_transaction.phone_number = nil
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Phone number can't be blank")

    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @user_transaction.phone_number = '090-1111-1111'
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Phone number is invalid")
    end
    
    it 'tokenは空だと保存できないこと' do
      @user_transaction.token = nil
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Token can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @user_transaction.building_name = nil
      expect(@user_transaction).to be_valid
    end
  end
end
