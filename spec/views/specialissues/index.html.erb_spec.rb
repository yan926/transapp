require 'spec_helper'

describe "specialissues/index" do
  before(:each) do
    assign(:specialissues, [
      stub_model(Specialissue,
        :body => "MyText",
        :language => "Language",
        :title => "Title"
      ),
      stub_model(Specialissue,
        :body => "MyText",
        :language => "Language",
        :title => "Title"
      )
    ])
  end

  it "renders a list of specialissues" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
