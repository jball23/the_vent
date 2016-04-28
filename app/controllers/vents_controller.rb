class VentsController < ApplicationController

  def index
    @vents = Vent.all
    @vent = Vent.new
    @tags = Tag.all
  end

  def show
    @vent = Vent.find(params[:id])
    @responses = Response.all
    @response = Response.new
  end

  def new
    @vent = Vent.new
    @taggings = @vent.taggings.new
    @tag = @taggings.build_tag
  end

  def create
    tags = params[:vent][:taggings][:tags]
    @vent = Vent.new(vent_params)
    if @vent.save
      flash[:success] = "Thanks for sharing!"
      tag = Tag.find_or_create_by(name: tags)
      tagging = Tagging.create(vent_id: @vent.id, tag_id: tag.id)
      redirect_to @vent
    else
      render vents_path
    end
  end

  def edit
    @vent = Vent.find(params[:id])
  end

  def update
    @vent = Vent.find(params[:id])
    @vent.update(vent_params)
    redirect_to @vent
  end

  def destroy
    @vent = Vent.find(params[:id])
    @vent.destroy
    flash[:success] = "Your Vent has been deleted!"
    redirect_to vents_path
  end

  private
  def vent_params
    params.require(:vent).permit(:name, :body, :all_tags)
  end

end
