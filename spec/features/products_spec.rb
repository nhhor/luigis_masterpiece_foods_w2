require 'rails_helper'

describe "Products" do

  it "handles missing/removed products correctly" do
    user = FactoryBot.create(:user)
    login_as(user)
    visit '/products/999'
    expect(page).to have_content 'The record you tried to access no longer exists.'
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
