module Shareconomy
  class Profile < ActiveRecord::Base
    belongs_to :user

    validates :first_name, :last_name, presence: true
  end
end
