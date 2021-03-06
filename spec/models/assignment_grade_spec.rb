require 'spec_helper'

describe AssignmentGrade do

  before(:each) do
    @attr = {
      :grade_id => "6",
      :assignment_id => "4",
      :user_id => "2",
      :grade_value => "100"
    }
  end

  it "should create a new instance given a valid attribute" do
    AssignmentGrade.create!(@attr)
  end


  it "should require an assignment id" do
    no_ai = AssignmentGrade.new(@attr.merge(:assignment_id => ""))
    no_ai.should_not be_valid
  end

  it "should require a user id" do
    no_ui = AssignmentGrade.new(@attr.merge(:user_id => ""))
    no_ui.should_not be_valid
  end

  it "should repeat a grade for a user" do
    AssignmentGrade.create!(@attr)
    no_repeat_grade = Assignment.new(@attr)
    no_repeat_grade.should_not be_valid
  end

end



