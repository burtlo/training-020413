class CommentsController < ApplicationController

  def create
    @comment = Comment.new params[:comment]
    @comment.article_id = params[:article_id]
    @comment.save

    @article = Article.find(params[:article_id])

    if @comment.invalid?
      flash[:message] = "Your comment was invalid"
      render "articles/show"
    else
      redirect_to @article
    end

  end

end