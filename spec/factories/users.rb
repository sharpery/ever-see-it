FactoryGirl.define do
  pw = RandomData.random_sentence
  factory :user do
    name RandomData.random_name
    sequence(:email){|n| "user#{n}@factory.co"}
    password pw
    password_confirmation pw
    rold :member
  end
end
