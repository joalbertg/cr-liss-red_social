FactoryBot.define do
  factory :user do
    password {'123456'}
    sequence(:email){|n| "liss_#{n}@factory.com"} 
    sequence(:username){|n| "liss#{n}"} 
  end
end
