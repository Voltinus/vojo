class WebsiteController < ApplicationController
  def index
    @articles = Article.where(language: I18n.locale).order(:created_at, :desc).limit(5)
    @topics = ForumTopic.where(language: I18n.locale).order(:created_at, :desc).limit(5)
  end
end
