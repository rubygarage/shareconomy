class CreateShareconomyOrders < ActiveRecord::Migration
  def change
    create_table :shareconomy_orders do |t|
      t.integer :buyer_id, index: true
      t.integer :seller_id, index: true
      t.integer :listing_id, index: true
      t.string :aasm_state
      t.decimal :total_price

      t.timestamps null: false
    end
  end
end
