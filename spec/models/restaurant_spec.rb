require 'spec_helper'

describe Restaurant do 
  it { should belong_to(:user) }
  it { should belong_to(:ingredient) }
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:address)}

  let(:user_1) { FactoryGirl.create(:user) }
  let(:user_2) { FactoryGirl.create(:user) }
  let(:restaurant_1) { FactoryGirl.create(:restaurant, user: user_1) }
  let(:restaurant_2) { FactoryGirl.create(:restaurant, user: user_2) }

  it "saves a restaurant to a users favorites" do
    expect( user_1.restaurants ).to include(restaurant_1)
    expect( user_1.restaurants ).to_not include(restaurant_2)
  end  

  it "can't save the same restaurant twice to a users favorites" do
    expect( user_1.restaurants )
  end
end
