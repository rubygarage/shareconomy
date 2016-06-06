class CreateShareconomyRatings < ActiveRecord::Migration
  def change
    create_table :shareconomy_ratings do |t|
      t.string :title
      t.text :content
      t.integer :value
      t.integer :listing_id, index: true
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
