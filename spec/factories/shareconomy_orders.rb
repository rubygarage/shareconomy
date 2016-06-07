FactoryGirl.define do
  factory :shareconomy_order, class: Shareconomy::Order.name do
    association :buyer, factory: :shareconomy_user
    association :seller, factory: :shareconomy_user
    association :listing, factory: :shareconomy_listing
  end
end
