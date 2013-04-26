# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    message_id 1
    sender_id 1
    receiver_id 1
    sent false
    subject "MyText"
    message "MyText"
    receiver_read false
    sender_deleted false
    receiver_deleted false
  end
end
