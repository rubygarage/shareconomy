FactoryGirl.define do
  factory :shareconomy_listing, class: Shareconomy::Listing.name do
    title { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
    association :category, factory: :shareconomy_category
    association :user, factory: :shareconomy_user
  end
end
