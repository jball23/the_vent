class VentsController < ApplicationController

  def index
    @vents = Vent.all
    @vent = Vent.new
  end

  def show
    @vent = Vent.find(params[:id])
    @responses = Response.all
    @response = Response.new
  end

  def new
    @vent = Vent.new
  end

  def create
    @vent = Vent.new(vent_params)
      if @vent.save
        flash[:success] = "Thanks for sharing!"
        redirect_to @vent
      else
        render 'index'
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
    params.require(:vent).permit(:name, :body, :mood)
  end

end
