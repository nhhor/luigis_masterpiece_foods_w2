require 'rails_helper'

describe "application_controller.rb" do

  it "denies adding products if ADMIN is NOT logged in." do
    user = FactoryBot.create(:user)
    login_as(user)
    visit '/products'
    click_link 'Add new product'
    expect(page).to have_content "You aren't authorized to visit that page."
  end

end
