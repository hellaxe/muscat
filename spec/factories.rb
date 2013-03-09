
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

  factory :default_user, aliases:[:review_owner], class: User do
    user_name "default"
    email "default@mail.com"
    password "defaultpassword"
  end

  factory :guest_user, class: User do
    user_name "guestuser"
    email "guest@example.com"
    password "myguestuser"
    guest true
  end

  factory :artist, aliases: [:owner] do
    sequence(:name){ |n| "Artist#{n}" }
    description "some description for artist"
  end

  factory :album, aliases: [:review_album] do
    artist
    sequence(:name){ |n| "Album#{n}" }
  end

  factory :genre do
    sequence(:name) { |n| "Genre#{n}" }
  end

  factory :review do
    sequence(:name) {|n| "Review#{n}"}
    content "sadfsadf"
  end
end