class StaticPagesController < ApplicationController
  def home
    if current_user
      redirect_to bookmarks_path
    end
  end
end
