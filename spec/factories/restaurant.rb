FactoryGirl.define do 
  factory :restaurant do 
    name { Faker::Lorem.words(2).join(" ") }
    address { Faker::Lorem.words(3).join(" ") }
    url { Faker::Internet.http_url }
    association :user
    association :ingredient
    
  end
end









