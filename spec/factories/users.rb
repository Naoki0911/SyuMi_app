FactoryBot.define do
  factory :user do
    name { "Test User" }
    email { "user@example.com" }
    password { "password" }
    password_confirmation { "password" }
    admin { "false" }
  end

  factory :second_user, class: User do
    name { "Test Admin" }
    email { "admin@example.com" }
    password { "password2" }
    password_confirmation { "password2" }
    admin { "true" }
  end
end