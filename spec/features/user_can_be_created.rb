require 'spec_helper'

describe "A user can create an account" do 
  let(:user) { FactoryGirl.create(:user) }

  it "lets a user create an account and login" do 
    visit root_path
    click_link "Sign Up"
    fill_in :user_email, with: user.email
    fill_in :user_first_name, with: user.first_name
    fill_in :user_last_name, with: user.last_name
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password_confirmation
    click_button "Join!"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"
    expect(page).to have_content user.first_name
    logout(user)
  end


  def logout(user)
    click_link "Log Out #{user.first_name}!"
  end
end