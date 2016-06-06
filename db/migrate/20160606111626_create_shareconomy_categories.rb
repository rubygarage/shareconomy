class CreateShareconomyCategories < ActiveRecord::Migration
  def change
    create_table :shareconomy_categories do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
