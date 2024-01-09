class ArticlesController < ApplicationController
  before_action :authenticate_user

  def index
    @articles = current_user.articles
    render :index
  end

  def show
    @article = Article.find_by(id: params[:id])
    render :show
  end

  def create
    @article = Article.new({

      user_id: current_user.id,
      title: params[:title],
      image_url: params[:image_url],
      link: params[:link],

    })
    if @article.valid?
      @article.save
      render :show
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    render json: { message: "Article was removed." }
  end
end
