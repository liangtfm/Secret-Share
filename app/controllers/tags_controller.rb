class TagsController < ApplicationController
  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      head :ok
    end
  end
end
