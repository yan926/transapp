require 'spec_helper'

describe "specialissues/show" do
  before(:each) do
    @specialissue = assign(:specialissue, stub_model(Specialissue,
      :body => "MyText",
      :language => "Language",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Language/)
    rendered.should match(/Title/)
  end
end
