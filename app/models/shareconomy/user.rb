module Shareconomy
  class User < ActiveRecord::Base
    has_many :sent_messages, class_name: Message.name, foreign_key: "sender_id"
    has_many :received_messages, class_name: Message.name, foreign_key: "recipient_id"

    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
      :validatable
  end
end
