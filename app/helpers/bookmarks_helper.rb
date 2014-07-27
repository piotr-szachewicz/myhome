module BookmarksHelper
  def get_bookmark_icon(bookmark)
    url = bookmark.favicon_url

    if url.blank?
      return "<span class='glyphicon glyphicon-globe'></span>"
    else
      return "<img src='#{url}' %>"
    end
  end
end
