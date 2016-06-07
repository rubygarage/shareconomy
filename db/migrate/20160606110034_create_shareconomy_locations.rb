class CreateShareconomyLocations < ActiveRecord::Migration
  def change
    create_table :shareconomy_locations do |t|
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :zip_code
      t.integer :listing_id, index: true

      t.timestamps null: false
    end
  end
end
