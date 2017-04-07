FactoryGirl.define do
  factory :user do
    nickname 'foo'
    email { Faker::Internet.email }
    password '00000000'
    password_confirmation '00000000'
    factory :admin do
      admin true
    end
  end
end
