
FactoryGirl.define do
  factory :song do
    name 'Song name'
    durability 175
  end

  factory :user do
    sequence(:user_name) {|n| "mynameis#{n}"}
    sequence(:email) {|n| "#{user_name}#{n}@example.com"}
    password 'mypassword123'
  end

  factory :default_user, class: User do
    user_name "default"
    email "default@mail.com"
    password "defaultpassword"
  end
end