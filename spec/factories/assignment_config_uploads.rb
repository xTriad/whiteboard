# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment_config_upload do
    file_name "MyString"
    content_type "MyString"
    file_size 1
    assignment_id 1
  end
end
