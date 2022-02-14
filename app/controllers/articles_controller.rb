class ArticlesController < ApplicationController
  def index
    @articles = Article.where(language: I18n.locale.to_s)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    #@article.language = params[:language]

    if @article.save
      redirect_to action: 'show', id: @article.id
    else
      render :new
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :language)
    end
end
