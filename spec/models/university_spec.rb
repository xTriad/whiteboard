require 'spec_helper'

 describe University do

  before(:each) do
    @attr = {
      :university_id => "5",
      :university_name => "LSU",
    }
  end

  it "should create a new instance given a valid attribute" do
    Univesity.create!(@attr)
  end

  it "should require a university name" do
    no_name = University.new(@attr.merge(:university_name => ""))
    no_name.should_not be_valid
  end

  it "should require a number" do
    no_number = University.new(@attr.merge(:university_id => ""))
    no_number.should_not be_valid
  end

end



