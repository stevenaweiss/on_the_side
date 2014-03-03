require 'spec_helper'


describe "A user can search for restaurants in a neighborhood" do 
  let!(:user) { FactoryGirl.create(:user) }
  let!(:ingredient) { FactoryGirl.create(:ingredient) }

  it "lets a user search for restaurants by neighborhood" do 
    login(user)
    visit user_path(user)
    click_link "Check Out Our Super Trendy Apps and Sides!"
    click_link ingredient.name
    fill_in :neighborhood, with: "Park Slope"
    click_button "submit!"
    expect(page).to have_button "Save Restaurant"
    save_and_open_page
    first(:button, "Save Restaurant").click


    


  end


  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In!"
  end

end