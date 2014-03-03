require 'spec_helper'


describe "a user can save a favorite restaurant" do 
  let!(:user) { FactoryGirl.create(:user) }

  let!(:ingredient) { FactoryGirl.create(:ingredient) }

  it "lets a user save and delete a favorite restaurant" do 
    login(user)
    click_link "Check Out Our Super Trendy Apps and Sides!"
    click_link ingredient.name
    fill_in :neighborhood, with: "Carroll Gardens"
    click_button "submit!"
    expect(page).to have_content "Carroll Gardens"
    expect(page).to have_button "Save Restaurant"
    first(:button, "Save Restaurant").click
    
    within "#favorites" do 
      expect(page).to have_button "delete"
      click_button "delete"
      #save_and_open_page 
      #todo - get restaurant info???
    end

    expect(page).to_not have_button "delete"
    
    



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