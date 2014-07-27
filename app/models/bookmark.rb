
class Bookmark < ActiveRecord::Base
  validates :url, presence: true, url: true
  validates :name, presence: true
  belongs_to :user

  def url=(value)
    if not value.start_with?("http://")
      value = "http://" + value
    end

    write_attribute(:url, value)
  end

end
