module Shareconomy
  class Message < ActiveRecord::Base
    belongs_to :recipient, class_name: User.name, inverse_of: :received_messages
    belongs_to :sender, class_name: User.name, inverse_of: :sent_messages

    validates :title, :body, :recipient, :sender, presence: true
  end
end
