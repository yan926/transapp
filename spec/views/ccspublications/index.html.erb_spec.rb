require 'spec_helper'

describe "ccspublications/index" do
  before(:each) do
    assign(:ccspublications, [
      stub_model(Ccspublication,
        :body => "MyText",
        :language => "Language"
      ),
      stub_model(Ccspublication,
        :body => "MyText",
        :language => "Language"
      )
    ])
  end

  it "renders a list of ccspublications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
  end
end
