module Shareconomy
  class Listing < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_one :location
    has_many :ratings
    has_many :orders

    validates :title, :description, :price, :user, :category, presence: true
  end
end
