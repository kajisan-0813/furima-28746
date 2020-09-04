class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_condition

  validates :category, :item_condition, presence: true
  validates :category_id, :item_condition_id, numericality: { other_than: 1 } 
end