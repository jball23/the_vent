class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @vents = Vent.all
  end

  def show
    @vent = Vent.find(params[:id])
    @tags = Tag.all
  end

end
