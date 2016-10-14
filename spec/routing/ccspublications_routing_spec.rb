require "spec_helper"

describe CcspublicationsController do
  describe "routing" do

    it "routes to #index" do
      get("/ccspublications").should route_to("ccspublications#index")
    end

    it "routes to #new" do
      get("/ccspublications/new").should route_to("ccspublications#new")
    end

    it "routes to #show" do
      get("/ccspublications/1").should route_to("ccspublications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ccspublications/1/edit").should route_to("ccspublications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ccspublications").should route_to("ccspublications#create")
    end

    it "routes to #update" do
      put("/ccspublications/1").should route_to("ccspublications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ccspublications/1").should route_to("ccspublications#destroy", :id => "1")
    end

  end
end
