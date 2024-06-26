class TopPagesController < ApplicationController
  def home
    @videos = Video.order(publish_datetime: :desc).limit(3)
    @web_apps = WebApp.order(created_at: :desc).limit(3)
    @articles = Article.order(post_datetime: :desc).limit(3)
  end
end
