class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  def index
    @article = Article.new
    @articles = current_admin.articles
  end

  def create
    @article = Article.new(article_params)
    @article.admin_id = current_admin.id
    @article.save
    redirect_back(fallback_location: root_path)
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @article.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:article_image, :title, :body)
  end
end
