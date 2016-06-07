class CreateShareconomyListings < ActiveRecord::Migration
  def change
    create_table :shareconomy_listings do |t|
      t.integer :user_id, index: true
      t.integer :category_id, index: true
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps null: false
    end
  end
end
