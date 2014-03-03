FactoryGirl.define do 
  factory :ingredient do 
    #name { Faker::Lorem.words(2).join(" ") }
    name "Brussel Sprouts"
    photo_url "http://placekitten.com/g/200/300"
    description { Faker::Lorem.words(3).join(" ") }
    
  end
end
