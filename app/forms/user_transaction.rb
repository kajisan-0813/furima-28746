class UserTransaction
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :adress, :building_name, :phone_number, :item_transaction_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :adress, :phone_number, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. ' }
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  end

  def save
    item_transaction = ItemTransaction.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture: prefecture, city: city, adress: adress, building_name: building_name, phone_number: phone_number, item_transaction_id: item_transaction.id)
  end
end
