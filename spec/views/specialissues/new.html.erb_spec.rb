require 'spec_helper'

describe "specialissues/new" do
  before(:each) do
    assign(:specialissue, stub_model(Specialissue,
      :body => "MyText",
      :language => "MyString",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new specialissue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", specialissues_path, "post" do
      assert_select "textarea#specialissue_body[name=?]", "specialissue[body]"
      assert_select "input#specialissue_language[name=?]", "specialissue[language]"
      assert_select "input#specialissue_title[name=?]", "specialissue[title]"
    end
  end
end
