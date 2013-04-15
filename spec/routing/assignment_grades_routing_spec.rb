require "spec_helper"

describe AssignmentGradesController do
  describe "routing" do

    it "routes to #index" do
      get("/assignment_grades").should route_to("assignment_grades#index")
    end

    it "routes to #new" do
      get("/assignment_grades/new").should route_to("assignment_grades#new")
    end

    it "routes to #show" do
      get("/assignment_grades/1").should route_to("assignment_grades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/assignment_grades/1/edit").should route_to("assignment_grades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/assignment_grades").should route_to("assignment_grades#create")
    end

    it "routes to #update" do
      put("/assignment_grades/1").should route_to("assignment_grades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/assignment_grades/1").should route_to("assignment_grades#destroy", :id => "1")
    end

  end
end
