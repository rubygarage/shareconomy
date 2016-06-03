FactoryGirl.define do
  factory :shareconomy_category, class: Shareconomy::Category.name do
    title { Faker::Name.name }
  end
end
