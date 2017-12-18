FactoryBot.define do
  factory :day do
    title "MyString"
    description "MyText"
    date "MyString"
    start_location "MyString"
    start_latitude 1.5
    start_longitude 1.5
    end_location "MyString"
    end_latitude 1.5
    end_longitude 1.5
    user nil
    trip nil
  end
end
