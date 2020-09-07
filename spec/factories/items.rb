FactoryBot.define do
  factory :item do
    name { 'test' }
    price { '500' }
    description { 'test' }
    item_condition_id { 2 }
    category_id { 3 }
    shipping_cost_id { 2 }
    shipping_date_id { 3 }
    shipping_origin_id { 2 }
    
    
    association :user

    
  end
end
