class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null:false
      t.integer :price,              null:false
      t.text :description,           null:false
      t.integer :item_condition_id,  null:false
      t.integer :category_id,      null:false
      t.integer :shipping_cost_id,   null:false
      t.integer :shipping_date_id,   null:false
      t.integer :shipping_origin_id, null:false
    end
  end
end
