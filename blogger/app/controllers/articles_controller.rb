class ArticlesController < ApplicationController

  before_filter :user_is_logged_in,
    only: [ :new, :create, :edit, :update, :destroy ]

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

    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
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