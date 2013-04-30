require 'spec_helper'

  describe Section do

  before(:each) do
    @attr = {
      :section_id => "2",
      :course_id => "1",
      :number =>"1"
    }
  end

  it "should create a new instance given a valid attribute" do
    Section.create!(@attr)
  end

  it "should require a course id" do
    no_ci = Section.new(@attr.merge(:course_id => ""))
    no_ci.should_not be_valid
  end

  it "should require a number" do
    no_number = Section.new(@attr.merge(:number => ""))
    no_number.should_not be_valid
  end

  it "should not repeat numbers for a given course" do
     Section.create!(@attr)
     repeat_number = Section.new(@attr)
     repear_number.should_not be_valid
  end

end


