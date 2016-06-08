FactoryGirl.define do
  factory :shareconomy_user, class: Shareconomy::User.name do
    provider 'email'
    uid { Faker::Internet.email }
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { Faker::Internet.password }

    after(:create) do |user, _evaluator|
      attributes = attributes_for(:shareconomy_profile)
      user.profile.update_attributes(attributes)
    end
  end
end
