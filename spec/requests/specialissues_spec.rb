require 'spec_helper'

describe "Specialissues" do
  describe "GET /specialissues" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get specialissues_path
      response.status.should be(200)
    end
  end
end
