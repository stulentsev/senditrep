# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spsr_location do
    city_id 1
    city_number 1
    city_owner_number 1
    city_name "MyString"
    region_name "MyString"
    region_number 1
    region_owner_number 1
    country_number 1
    country_owner_number 1
  end
end
