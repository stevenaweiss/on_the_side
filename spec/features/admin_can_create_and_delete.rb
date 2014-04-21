require 'spec_helper'

describe "an admin can create and delete ingredients" do 
  let!(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:ingredient) { FactoryGirl.create(:ingredient) }

  it "lets an admin create an ingredient" do 
    login(admin)
    visit user_path(admin)
    click_link "Check Out Our Super Trendy Apps and Sides!"
    click_link "Add A New Dish!"
    fill_in :ingredient_name, with: ingredient.name
    fill_in :ingredient_photo_url, with: ingredient.photo_url
    fill_in :ingredient_description, with: ingredient.description
    click_button "Add!"
    expect(page).to have_content ingredient.name
    expect(page).to have_content ingredient.description
    first(:link, ingredient.name).click
    click_link "Edit"
    fill_in :ingredient_description, with: "totally awesome"
    click_button "Save Changes"
    expect(page).to have_content("totally awesome")
  end  



  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"
  end

end