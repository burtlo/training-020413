class CommentsController < ApplicationController

  def create
    @comment = Comment.new params[:comment]
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to article_path(params[:article_id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create params[:comment]
    redirect_to @article
  end

end