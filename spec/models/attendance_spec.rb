require 'spec_helper'

describe Attendance do

  before(:each) do
    @attr = {
      :section_id => "2",
      :class_date => "2013-2-2",
      :user_id => "2",
      :attendance => "1",
      :attendance_id=>"2"
    }
  end

  it "should create a new instance given a valid attribute" do
    Attendance.create!(@attr)
  end


  it "should require an section id" do
    no_si = Attendance.new(@attr.merge(:section_id => ""))
    no_si.should_not be_valid
  end

  it "should require a attendance id" do
    no_ai = Attendance.new(@attr.merge(:attendance_id => ""))
    no_ai.should_not be_valid
  end

  it "should require a user id" do
    no_ui = Attendance.new(@attr.merge(:user_id => ""))
    no_ui.should_not be_valid
  end

  it "should require an attendance value" do
    no_av = Attendance.new(@attr.merge(:attendance => ""))
    no_av.should_not be_valid
  end

  it "should require a date" do
    no_date = Attendance.new(@attr.merge(:class_date => ""))
    no_date.should_not be_valid
  end

  it "should repeat an attendance for a user" do
    Attendance.create!(@attr)
    no_repeat_att = Attendance.new(@attr)
    no_repeat_att.should_not be_valid
  end

end


