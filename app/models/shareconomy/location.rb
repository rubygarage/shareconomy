module Shareconomy
  class Location < ActiveRecord::Base
    belongs_to :listing

    validates :state, :city, :district, :street, :zip_code, :listing, presence: true
  end
end
