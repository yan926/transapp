require 'spec_helper'

describe "ccspublications/show" do
  before(:each) do
    @ccspublication = assign(:ccspublication, stub_model(Ccspublication,
      :body => "MyText",
      :language => "Language"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Language/)
  end
end
