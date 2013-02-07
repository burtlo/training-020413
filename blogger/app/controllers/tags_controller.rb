class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by_name(params[:id]) || Tag.find(params[:id])
  end
end
