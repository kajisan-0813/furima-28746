class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_condition, :shipping_cost, :shipping_origin, :shipping_date,

  validates :category, :item_condition, :shipping_cost, :shipping_origin, :shipping_date, presence: true
  validates :category_id, :item_condition_id, :shipping_cost_id, :shipping_origin_id, :shipping_date_id, numericality: { other_than: 1 } 
end
