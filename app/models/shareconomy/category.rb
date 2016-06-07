module Shareconomy
  class Category < ActiveRecord::Base
    has_many :listings

    validates :title, presence: true
  end
end
