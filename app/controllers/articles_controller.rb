class ArticlesController < ApplicationController
  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).page(params[:page]).per(12)
  end

  def new
  end

  def import
    ArticleImporter.new(ENV['QIITA_API_TOKEN']).import('Rails')
    redirect_to articles_path, notice: 'Articles imported successfully.'
  end
end