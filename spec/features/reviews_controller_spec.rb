require 'rails_helper'

describe "Products" do

  it "routes to product show page correctly" do
    admin = FactoryBot.create(:admin)
    login_as(admin)
    product_blahnana = FactoryBot.create(:product_blahnana)
    visit "/products/#{product_blahnana.id}"
    expect(page).to have_content 'Product name: Blahnana'
  end

  it "handles missing/removed reviews correctly" do
    product_blahnana = FactoryBot.create(:product_blahnana)
    user = FactoryBot.create(:user)
    login_as(user)
    visit "/products/#{product_blahnana.id}/reviews/9999"
    expect(page).to have_content 'The record you tried to access no longer exists.'
  end

  it "creates a new review" do
    product_blahnana = FactoryBot.create(:product_blahnana)
    user = FactoryBot.create(:user)
    login_as(user)
    visit "/products/#{product_blahnana.id}"
    click_on 'Add a review'

    fill_in 'review_author', :with => 'Blahnana Bob'
    fill_in 'review_content_body', :with => 'This is that a fifty character review looks like!!'
    fill_in 'review_rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully created!'
    expect(page).to have_content 'Blahnana Bob rated this product a 5'
  end

  # it "correctly handels an error creating a new product" do
  #   admin = FactoryBot.create(:admin)
  #   login_as(admin)
  #   visit '/products/new'
  #   # fill_in 'product_name', :with => ''
  #   fill_in 'product_cost', :with => 1.99
  #   fill_in 'product_country_of_origin', :with => 'Canada'
  #   click_on 'Create Product'
  #   expect(page).to have_content 'There was a problem creating this product!'
  #   expect(page).to have_content "Name can't be blank"
  # end

end

# review_good

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
