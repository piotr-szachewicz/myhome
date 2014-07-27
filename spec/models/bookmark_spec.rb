require 'spec_helper'

describe Bookmark do
  before do
    @bookmark = Bookmark.new(name: "Example Bookmark", url: "http://www.wp.pl",
                     description: "Description for this bookmark")
  end

  subject { @bookmark }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:description) }
  it { should be_valid }

  describe "without a name" do
    before { @bookmark.name = "" }
    it { should be_invalid }
  end

  #describe "bad url" do
  #  before { @bookmark.url = "ble" }
  #  it { should be_invalid }
  #end

  describe "good url but without http" do
    before { @bookmark.url = "www.google.com" }
    it { should be_valid }
  end

  describe "when url format is valid" do
    it "should be valid" do
      urls = %w[www.google.com google.com http://www.railstutorial.org/book/modeling_users https://drive.google.com/?tab=mo&authuser=0 https://docs.google.com/document/d/13rJVez9LeHtjHB3QqqsJIBZSdUBhOHraScaZUI_VlKw/edit drive.google.com/?tab=mo&authuser=0#folders/0B3PbOVjRS4bWNW1VYXc1UVBKSUE ]
      urls.each do |valid_url|
        @bookmark.url = valid_url
        expect(@bookmark).to be_valid
        expect(@bookmark.url).to start_with "http://"
      end
    end
  end

end

