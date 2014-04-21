require 'spec_helper'


describe "A user can edit and delete their account" do 
  let(:user) { FactoryGirl.create(:user) }

  it "lets a user edit and delete their account" do 
    login(user)
    click_link "Edit My Info"
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password_confirmation
    fill_in :user_first_name, with: "Billbo"
    fill_in :user_last_name, with: "Baggins"
    click_button "Save Changes"
    expect(page).to have_content "Billbo"
    click_button "Rid My Life Of This Account"
    expect(page).not_to have_content "Billbo"
  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"
  end
end