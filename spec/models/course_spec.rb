

  require 'spec_helper'

describe Course do

  before(:each) do
    @attr = {
      :course_id => "12",
      :number => "1430",
      :name => "Introduction I",
      :university_id => "2"
    }
  end

  it "should create a new instance given a valid attribute" do
    Course.create!(@attr)
  end

  it "should require a name" do
    no_name = Course.new(@attr.merge(:name => ""))
    no_name.should_not be_valid
  end

  it "should reject duplicate numbers" do
    Course.create!(@attr)
    course_same_num = Course.new(@attr)
    course_same_num.should_not be_valid
  end


end



