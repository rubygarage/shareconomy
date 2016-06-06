module Shareconomy
  class Rating < ActiveRecord::Base
    belongs_to :listing

    validates :title, :content, :value, :listing, presence: true
  end
end
