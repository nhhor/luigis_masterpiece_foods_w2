require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
end

# TEST FOR: All fields should be filled out, including rating.
describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
end



describe Product do
  it("titleizes the name of a product") do
    product = Product.create({name: "taco salad", cost: 1.99, country_of_origin: "USA"})
    expect(product.name()).to(eq("Taco Salad"))
  end
end
