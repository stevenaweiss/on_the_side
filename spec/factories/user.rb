FactoryGirl.define do 
  factory :user do 
    email { Faker::Internet.email }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    password "password"
    password_confirmation "password"
    admin false
  end
  trait :admin do
    admin true
  end
end



