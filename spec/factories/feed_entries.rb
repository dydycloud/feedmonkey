# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feed_entry do
    name "MyString"
    summary "MyText"
    url "MyString"
    published_at "2013-03-29 13:08:52"
    guid "MyString"
  end
end
