require 'spec_helper'


describe "A user can't login with an incorrect password" do 
  let!(:user) { FactoryGirl.create(:user) }

  it "lets a user edit and delete their account" do 
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: "muffins"
    click_button "Log In!"
    expect(page).to have_content("Sorry, we don't have that combo")
  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"
  end
end