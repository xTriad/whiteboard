require 'spec_helper'

describe Assignment do

  before(:each) do
    @attr = {
      :assignment_id => "20",
      :type_id => "2",
      :section_id =>"1",
      :due_date => "2020-02-11",
      :highest_grade_value => "100"
    }
  end


  it "should create a new instance given a valid attribute" do
    Assignment.create!(@attr)
  end

  it "should require a type id" do
    no_ti = Assignment.new(@attr.merge(:type_id => ""))
    no_ti.should_not be_valid
  end

  it "should require a section id" do
    no_si = Assignment.new(@attr.merge(:section_id => ""))
    no_si.should_not be_valid
  end
  it "should require a highest grade value" do
    no_hgv = Assignment.new(@attr.merge(:highest_grade_value => ""))
    no_hgv.should_not be_valid
  end

end
  






