require 'spec_helper'

describe "specialissues/edit" do
  before(:each) do
    @specialissue = assign(:specialissue, stub_model(Specialissue,
      :body => "MyText",
      :language => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit specialissue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", specialissue_path(@specialissue), "post" do
      assert_select "textarea#specialissue_body[name=?]", "specialissue[body]"
      assert_select "input#specialissue_language[name=?]", "specialissue[language]"
      assert_select "input#specialissue_title[name=?]", "specialissue[title]"
    end
  end
end
