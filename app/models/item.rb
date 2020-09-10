class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_date
  belongs_to :user
  has_one_attached :image
  has_one :transaction
  with_options presence: true do
    validates :price
    validates :category, :item_condition, :shipping_cost, :shipping_origin, :shipping_date, :name, :description, :image, :user_id, :price
    validates :category_id, :item_condition_id, :shipping_cost_id, :shipping_origin_id, :shipping_date_id, numericality: { other_than: 1 }
  end
  validates :price, numericality: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }
end
