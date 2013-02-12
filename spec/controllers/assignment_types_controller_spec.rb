require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AssignmentTypesController do

  # This should return the minimal set of attributes required to create a valid
  # AssignmentType. As you add validations to AssignmentType, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyText" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AssignmentTypesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all assignment_types as @assignment_types" do
      assignment_type = AssignmentType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:assignment_types).should eq([assignment_type])
    end
  end

  describe "GET show" do
    it "assigns the requested assignment_type as @assignment_type" do
      assignment_type = AssignmentType.create! valid_attributes
      get :show, {:id => assignment_type.to_param}, valid_session
      assigns(:assignment_type).should eq(assignment_type)
    end
  end

  describe "GET new" do
    it "assigns a new assignment_type as @assignment_type" do
      get :new, {}, valid_session
      assigns(:assignment_type).should be_a_new(AssignmentType)
    end
  end

  describe "GET edit" do
    it "assigns the requested assignment_type as @assignment_type" do
      assignment_type = AssignmentType.create! valid_attributes
      get :edit, {:id => assignment_type.to_param}, valid_session
      assigns(:assignment_type).should eq(assignment_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AssignmentType" do
        expect {
          post :create, {:assignment_type => valid_attributes}, valid_session
        }.to change(AssignmentType, :count).by(1)
      end

      it "assigns a newly created assignment_type as @assignment_type" do
        post :create, {:assignment_type => valid_attributes}, valid_session
        assigns(:assignment_type).should be_a(AssignmentType)
        assigns(:assignment_type).should be_persisted
      end

      it "redirects to the created assignment_type" do
        post :create, {:assignment_type => valid_attributes}, valid_session
        response.should redirect_to(AssignmentType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved assignment_type as @assignment_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        AssignmentType.any_instance.stub(:save).and_return(false)
        post :create, {:assignment_type => { "name" => "invalid value" }}, valid_session
        assigns(:assignment_type).should be_a_new(AssignmentType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AssignmentType.any_instance.stub(:save).and_return(false)
        post :create, {:assignment_type => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested assignment_type" do
        assignment_type = AssignmentType.create! valid_attributes
        # Assuming there are no other assignment_types in the database, this
        # specifies that the AssignmentType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AssignmentType.any_instance.should_receive(:update_attributes).with({ "name" => "MyText" })
        put :update, {:id => assignment_type.to_param, :assignment_type => { "name" => "MyText" }}, valid_session
      end

      it "assigns the requested assignment_type as @assignment_type" do
        assignment_type = AssignmentType.create! valid_attributes
        put :update, {:id => assignment_type.to_param, :assignment_type => valid_attributes}, valid_session
        assigns(:assignment_type).should eq(assignment_type)
      end

      it "redirects to the assignment_type" do
        assignment_type = AssignmentType.create! valid_attributes
        put :update, {:id => assignment_type.to_param, :assignment_type => valid_attributes}, valid_session
        response.should redirect_to(assignment_type)
      end
    end

    describe "with invalid params" do
      it "assigns the assignment_type as @assignment_type" do
        assignment_type = AssignmentType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AssignmentType.any_instance.stub(:save).and_return(false)
        put :update, {:id => assignment_type.to_param, :assignment_type => { "name" => "invalid value" }}, valid_session
        assigns(:assignment_type).should eq(assignment_type)
      end

      it "re-renders the 'edit' template" do
        assignment_type = AssignmentType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AssignmentType.any_instance.stub(:save).and_return(false)
        put :update, {:id => assignment_type.to_param, :assignment_type => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested assignment_type" do
      assignment_type = AssignmentType.create! valid_attributes
      expect {
        delete :destroy, {:id => assignment_type.to_param}, valid_session
      }.to change(AssignmentType, :count).by(-1)
    end

    it "redirects to the assignment_types list" do
      assignment_type = AssignmentType.create! valid_attributes
      delete :destroy, {:id => assignment_type.to_param}, valid_session
      response.should redirect_to(assignment_types_url)
    end
  end

end
