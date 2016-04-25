class VentsController < ApplicationController

  def index
    @vents = Vent.all
    @vent = Vent.new
  end

  def show
    @vent = Vent.find(params[:id])
    @responses = Response.all
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
  end

  def update
  end

  def destroy
  end

  private
  def vent_params
    params.require(:vent).permit(:name, :body, :mood)
  end

end
