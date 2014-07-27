require 'spec_helper'

describe "Bookmarks" do
  describe "GET /bookmarks" do
    it "should return 302 for unlogged user" do
      get bookmarks_path
      @response.status.should be(302)
    end
  end
end
