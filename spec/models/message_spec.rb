require 'spec_helper'

describe Message do

  before(:each) do
    @attr = {
      :message_id => "10",
      :sender_id=> "2",
      :receiver_id => "4",
      :date_sent => "2013-21-2"
    }

    @attr2 = {
      :message_id => "10",
      :sender_id=> "2",
      :receiver_id => "2",
      :date_sent => "2013-21-2"
    }


  end

  it "should create a new instance given a valid attribute" do
    Message.create!(@attr)
  end

  it "should require a sender_id" do
    no_si = Message.new(@attr.merge(:sender_id => ""))
    no_si.should_not be_valid
  end

  it "should require a receiver_id" do
    no_ri = Message.new(@attr.merge(:receiver_id => ""))
    no_ri.should_not be_valid
  end

  it "should reject the same sender and receiver id" do
    same_number=Message.create!(@attr2)
    same_number.should_not_be_valid

  end


end
