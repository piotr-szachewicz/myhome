class Bookmark < ActiveRecord::Base
  VALID_URL_PATTERN = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/
  validates :url, presence: true,
            format: { with: VALID_URL_PATTERN }
  validates :name, presence: true
  belongs_to :user

  before_save {
    if not self.url.start_with?("http://")
      self.url = "http://" + self.url
    end
  }
end
