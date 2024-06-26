class VideosController < ApplicationController
  def import
    importer = YoutubeVideoImporter.new(ENV['YOUTUBE_API_KEY'])
    importer.import('Ruby on Rails プログラミング エンジニア')
    flash[:success] = "動画をインポートしました"
    redirect_to videos_path
  end

  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).page(params[:page]).per(12)
  end

end