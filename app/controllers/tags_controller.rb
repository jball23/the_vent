class TagsController < ApplicationController

  def show
    @vent = Vent.find(params[:id])
    @tags = Tag.all
  end

end
