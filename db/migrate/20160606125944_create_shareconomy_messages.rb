class CreateShareconomyMessages < ActiveRecord::Migration
  def change
    create_table :shareconomy_messages do |t|
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true
      t.text :body
      t.string :title

      t.timestamps null: false
    end
  end
end
