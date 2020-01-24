require 'rails_helper'

describe "the add a product process" do
  it "adds a new album" do
    visit products_path
    click_link 'Add new product'
    fill_in 'Name', :with => 'Pickles'
    fill_in 'Cost', :with => '0.89'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully created!'
    expect(page).to have_content 'Pickles'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end

end
