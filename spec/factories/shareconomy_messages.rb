FactoryGirl.define do
  factory :shareconomy_message, class: Shareconomy::Message.name do
    title { Faker::Name.name }
    body { Faker::Lorem.paragraph }
  end
end
