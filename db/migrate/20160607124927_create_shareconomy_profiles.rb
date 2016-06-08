class CreateShareconomyProfiles < ActiveRecord::Migration
  def change
    create_table :shareconomy_profiles do |t|
      t.integer :user_id
      t.string  :first_name
      t.string  :last_name
      t.string  :phone
      t.date    :birthday

      t.timestamps null: false
    end
  end
end
