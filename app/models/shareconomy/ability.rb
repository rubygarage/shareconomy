module Shareconomy
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new

      can [:read], Listing
      can [:sales], Order, buyer_id: user.id
      can [:purchases], Order, seller_id: user.id
      can [:show, :create], Order, buyer_id: user.id
      cannot [:create], Order, seller_id: user.id
    end
  end
end
