class AuthorSessionsController < ApplicationController

  before_filter :user_is_logged_in, only: [ :destroy ]


  def new
    @author = Author.new
  end

  def create
    @author = login(params[:username],params[:password])
    if @author
      redirect_back_or_to(articles_path, message: "Logged in Successfuly")
    else
      flash[:message] = "Login Failed"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to articles_path, message: "Logged out!"
  end
end