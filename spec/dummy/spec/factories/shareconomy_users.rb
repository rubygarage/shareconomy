FactoryGirl.define do
  factory :shareconomy_user, class: Shareconomy::User.name do
    provider 'email'
    uid { Faker::Internet.email }
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { Faker::Internet.password }
  end
end
