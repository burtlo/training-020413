class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    id = params[:id]
    @article = Article.find(id)

    @comment = Comment.new
    @comment.article = @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create params[:article]
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    flash[:message] = t("article.update.success")
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end