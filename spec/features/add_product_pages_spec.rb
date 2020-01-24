require 'rails_helper'

describe "User" do
  it "logs in as an admin" do
    user = FactoryBot.create(:admin)
    visit '/users/sign_in'
    fill_in 'user_email', :with => 'admin@user.com'
    fill_in 'user_password', :with => 'aaaaaa'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
# end
#
# describe "User" do
  it "logs in as an user" do
    user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in 'user_email', :with => 'user@user.com'
    fill_in 'user_password', :with => 'aaaaaa'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end

# it "gives an error when no name is entered" do
#   visit new_product_path
#   click_on 'Create Product'
#   expect(page).to have_content "Name can't be blank"
# end

# visit products_path
# click_link 'Add new product'
# fill_in 'Name', :with => 'Pickles'
# fill_in 'Cost', :with => '0.89'
# fill_in 'Country of origin', :with => 'USA'
# click_on 'Create Product'
# expect(page).to have_content 'Product successfully created!'
