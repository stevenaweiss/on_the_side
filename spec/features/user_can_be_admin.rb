require 'spec_helper'

describe "a user can be an admin" do 
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, :admin) }

  let!(:ingredient) { FactoryGirl.create(:ingredient) }

  it "only gives edit and delete capability to admin" do 
    login(admin)
    visit user_path(admin)
    click_link "Check Out Our Super Trendy Apps and Sides!"
    click_link ingredient.name
    expect(page).to have_button "Delete!"
    click_link "Edit"
    expect(page).to have_content ingredient.name
    click_button "Save"

    logout(admin)
    login(user)
    visit user_path(user)
    click_link "Check Out Our Super Trendy Apps and Sides!"
    click_link ingredient.name
    expect(page).to_not have_link "Edit"
    expect(page).to_not have_button "Delete!"
    #save_and_open_page
  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"
  end

  def logout(user)
    click_link "Log Out #{user.first_name}!"
  end

end
