class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_date
  belongs_to :user 
  has_one_attached :image
  validates :category, :item_condition, :shipping_cost, :shipping_origin, :shipping_date, presence: true
  validates :category_id, :item_condition_id, :shipping_cost_id, :shipping_origin_id, :shipping_date_id, numericality: { other_than: 1 } 
end
