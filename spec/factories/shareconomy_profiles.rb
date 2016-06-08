FactoryGirl.define do
  factory :shareconomy_profile, class: 'Shareconomy::Profile' do
    shareconomy_user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.phone_number }
  end
end
