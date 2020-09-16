class UserTransaction

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :adress, :building_name, :phone_number, :item_transaction_id,:user_id,:item_id,:token

  with_options presence: true do
    validates :post_code, :prefecture, :city, :adress, :phone_number,:token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  end
  validates :prefecture, numericality: { other_than: 0 }

  def save
    item_transaction = ItemTransaction.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture: prefecture, city: city, adress: adress, building_name: building_name, phone_number: phone_number, item_transaction_id: item_transaction.id)
  end
end 