class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @vents = Vent.all
  end

  def show
    @tag = Tag.find(params[:id])
    @vent = @tag.vents
  end

end
