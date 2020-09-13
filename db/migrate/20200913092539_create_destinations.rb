class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string  :post_code,           null: false 
      t.integer :prefecture,          null: false
      t.string  :city,                null: false 
      t.string  :adress,              null: false
      t.string  :building_name, default: ""
      t.string  :phone_number,        null: false
      t.integer :item_transaction_id, null: false, foreign_key:true 
      t.timestamps
    end
  end
end
