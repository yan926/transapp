require "spec_helper"

describe SpecialissuesController do
  describe "routing" do

    it "routes to #index" do
      get("/specialissues").should route_to("specialissues#index")
    end

    it "routes to #new" do
      get("/specialissues/new").should route_to("specialissues#new")
    end

    it "routes to #show" do
      get("/specialissues/1").should route_to("specialissues#show", :id => "1")
    end

    it "routes to #edit" do
      get("/specialissues/1/edit").should route_to("specialissues#edit", :id => "1")
    end

    it "routes to #create" do
      post("/specialissues").should route_to("specialissues#create")
    end

    it "routes to #update" do
      put("/specialissues/1").should route_to("specialissues#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/specialissues/1").should route_to("specialissues#destroy", :id => "1")
    end

  end
end
