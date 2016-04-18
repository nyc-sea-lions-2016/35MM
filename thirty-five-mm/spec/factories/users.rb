FactoryGirl.define do
  factory :user do
    trusted false
    email "MyString"
    password_digest "MyString"
  end
end
