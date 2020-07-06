class ArticlesController < ApplicationController
  before_action :select_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(strong_params)
    if @article.save
      redirect_to @article,notice: 'Article was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(strong_params)
      redirect_to @article, notice: 'Article successfully updated'
    else
      render :new
    end
  end

  def destory
    @article.destroy
    redirect_to articles_url, notice: 'Article successfully deleted'
  end

  private

  def select_article
    @article = Article.find(params[:id])
  end

  def strong_params
    params.require(:article).permit(:title, :content)
  end
end
