require 'spec_helper'

describe "Courses" do
  describe "GET /courses" do
    it "works! (now write some real specs)" do
      # http://www.youtube.com/watch?v=cMcEgOPza8A @ 20:00
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get courses_path
      response.status.should be(200)
    end
  end
end
