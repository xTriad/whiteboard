# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    type_id 1
    section_id 1
    due_date "2013-02-11"
    highest_grade_value 1
    weight ""
  end
end
