require 'spec_helper'

describe "bookmarks/show" do
  before(:each) do
    @bookmark = assign(:bookmark, stub_model(Bookmark,
      :name => "Name",
      :url => "Url",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
    rendered.should match(/Description/)
  end
end
