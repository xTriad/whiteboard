require 'spec_helper'

describe "AssignmentGrades" do
  describe "GET /assignment_grades" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get assignment_grades_path
      response.status.should be(200)
    end
  end
end
