module Shareconomy
  class OrderSerializer < ActiveModel::Serializer
    attributes :id, :aasm_state, :total_price
  end
end
