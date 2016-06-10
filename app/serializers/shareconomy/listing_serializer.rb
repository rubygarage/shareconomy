module Shareconomy
  class ListingSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :price

    has_one :location
    has_many :ratings
    has_many :orders
  end
end
