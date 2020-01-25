FactoryBot.define do

  factory :admin, class: User do
    email { 'admin@user.com' }
    password { 'aaaaaa' }
    admin { true }
  end

  factory :user, class: User do
    email { 'user@user.com' }
    password { 'aaaaaa' }
    admin { false }
  end

  factory :product_blahnana, class: Product do
    name { 'Blahnana' }
    cost { 1.00 }
    country_of_origin { 'Mexico' }
  end

  factory :review_good, class: Review do
    author { 'Blahnana Bob' }
    content_body { 'This is that a fifty character review looks like!!' }
    rating { 5 }
  end

end
