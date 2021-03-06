require 'rails_helper'

describe "Products" do

  it "handles missing/removed products correctly" do
    user = FactoryBot.create(:user)
    login_as(user)
    visit '/products/9999'
    expect(page).to have_content 'The record you tried to access no longer exists.'
  end

  it "routes to New product page correctly" do
    admin = FactoryBot.create(:admin)
    login_as(admin)
    visit '/'
    click_link 'Products'
    click_link 'Add new product'
    expect(page).to have_content 'New product'
    expect(page).to have_content 'Cost'
  end

  it "creates a new product" do
    admin = FactoryBot.create(:admin)
    login_as(admin)
    visit '/products/new'
    fill_in 'product_name', :with => 'Medjool Date'
    fill_in 'product_cost', :with => 2.99
    fill_in 'product_country_of_origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully created!'
    expect(page).to have_content 'Medjool Date'
  end

  it "correctly handels an error creating a new product" do
    admin = FactoryBot.create(:admin)
    login_as(admin)
    visit '/products/new'
    # fill_in 'product_name', :with => ''
    fill_in 'product_cost', :with => 1.99
    fill_in 'product_country_of_origin', :with => 'Canada'
    click_on 'Create Product'
    expect(page).to have_content 'There was a problem creating this product!'
    expect(page).to have_content "Name can't be blank"
  end

end
