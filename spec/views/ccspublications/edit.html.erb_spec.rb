require 'spec_helper'

describe "ccspublications/edit" do
  before(:each) do
    @ccspublication = assign(:ccspublication, stub_model(Ccspublication,
      :body => "MyText",
      :language => "MyString"
    ))
  end

  it "renders the edit ccspublication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ccspublication_path(@ccspublication), "post" do
      assert_select "textarea#ccspublication_body[name=?]", "ccspublication[body]"
      assert_select "input#ccspublication_language[name=?]", "ccspublication[language]"
    end
  end
end
