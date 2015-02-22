FactoryGirl.define do
  factory :address_one, class: Address do
    street "MyString"
    city "MyString"
    zip 19000
    country "CZ"
    association :user, factory: :admin, strategy: :build
  end

  # This will use the User class (Admin would have been guessed)
  factory :address_two, class: Address do
    street "MyString"
    city "MyString"
    zip 17000
    country "UK"
    association :user, factory: :admin, strategy: :build
  end

end