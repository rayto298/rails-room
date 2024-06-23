class WebAppsController < ApplicationController
  def index
    @q = WebApp.ransack(params[:q])
    # @web_apps = @q.result(distinct: true).includes(:user).page(params[:page])
    @web_apps = @q.result(distinct: true).includes(:user)
  end

  def show
    @web_app = WebApp.find_by(id: params[:id])
  end

  def new
    @web_app = WebApp.new
  end

  def create
    @web_app = WebApp.new(web_app_params)
    if @web_app.save
      flash[:success] = "アプリを投稿しました"
      redirect_to web_apps_path
    else
      flash[:danger] = "アプリの投稿に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @web_app = current_user.web_apps.find(params[:id])
  end

  def update
    @web_app = current_user.web_apps.find(params[:id])
    if @web_app.update(web_app_params)
      flash[:success] = "投稿アプリを編集しました"
      redirect_to web_app_path(@web_app)
    else
      flash[:danger] = "投稿アプリの編集に失敗しました"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    web_app = WebApp.find(params[:id])
    web_app.destroy
    flash[:success] = "投稿アプリを削除しました"
    redirect_to web_apps_path
  end

  def web_app_params
    params.require(:web_app).permit(:title, :description, :image, :url, :github_url, :user_id)
  end
end
