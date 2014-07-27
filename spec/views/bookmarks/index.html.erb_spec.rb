require 'spec_helper'

describe "bookmarks/index" do
  before(:each) do
    assign(:bookmarks, [
      stub_model(Bookmark,
        :name => "Name",
        :description => "Description",
        :url => "Url"
      ),
      stub_model(Bookmark,
        :name => "Name",
        :description => "Description",
        :url => "Url"
      )
    ])
  end

  it "renders a list of bookmarks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".bookmark a", :text => "Name".to_s, :count => 2
  end
end
