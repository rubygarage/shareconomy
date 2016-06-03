module Shareconomy
  class Order < ActiveRecord::Base
    include AASM

    before_save :update_total_price

    belongs_to :listing
    belongs_to :buyer, class_name: User.name
    belongs_to :seller, class_name: User.name

    validates_presence_of :buyer
    validates_presence_of :seller
    validates_presence_of :listing

    aasm do
      state :pending, initial: true
      state :declined
      state :confirmed
      state :cancelled
      state :completed

      event :confirm do
        transitions from: :pending, to: :confirmed
      end

      event :decline do
        transitions from: :pending, to: :declined
      end

      event :cancel do
        transitions from: :confirmed, to: :cancelled
      end

      event :complete do
        transitions from: :confirmed, to: :completed
      end
    end

    def count_total_price
      listing.price
    end

    private

      def update_total_price
        self.total_price = count_total_price
      end
  end
end
