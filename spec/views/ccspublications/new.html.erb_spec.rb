require 'spec_helper'

describe "ccspublications/new" do
  before(:each) do
    assign(:ccspublication, stub_model(Ccspublication,
      :body => "MyText",
      :language => "MyString"
    ).as_new_record)
  end

  it "renders new ccspublication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ccspublications_path, "post" do
      assert_select "textarea#ccspublication_body[name=?]", "ccspublication[body]"
      assert_select "input#ccspublication_language[name=?]", "ccspublication[language]"
    end
  end
end
