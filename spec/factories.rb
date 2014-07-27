FactoryGirl.define do
  factory :user do
    email    "szasza@wp.pl"
    password "123412344"
    password_confirmation "123412344"
  end

  factory :bookmark do |b|
    b.sequence(:name) { |n| "Bookmark #{n}" }
    b.sequence(:url) { |n| "www.bla#{n}.com" }
    #user: :user
  end
end
