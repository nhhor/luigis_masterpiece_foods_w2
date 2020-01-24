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

end
