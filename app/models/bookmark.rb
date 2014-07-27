class Bookmark < ActiveRecord::Base
  validates :url, presence: true, url: true
  validates :name, presence: true, length: {maximum: 25}
  belongs_to :user
  FAVICON_MINIMUM_SIZE = 1000

  def url=(value)
    if not value.start_with?("http://")
      value = "http://" + value
    end

    infer_favicon_url(value)
    write_attribute(:url, value)
  end

  def infer_favicon_url(bookmark_url)
    response = HTTParty.get(bookmark_url)
    if response.code == 200
      url = "http://#{response.request.last_uri.host}"

      favicon_url = url + '/favicon.ico'
      favicon_response = HTTParty.get(favicon_url)
      if favicon_response.code == 200 && favicon_response.body.length > FAVICON_MINIMUM_SIZE
        write_attribute(:favicon_url, favicon_url)
      end
    end
  rescue
  end

end
