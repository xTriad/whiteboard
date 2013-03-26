# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :permission do
    role_id 1
    perm_name "MyText"
  end
end
