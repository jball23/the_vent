class ResponsesController < ApplicationController

  def index
    @responses = Response.all
  end

  def new
    puts "*" * 50
    puts params
    puts "*" * 50
    @vent = Vent.find(params[:vent_id])
    @response = @vent.responses.new
  end

  def edit
  end

  def create
    puts "*" * 50
    puts params
    puts "*" * 50
    @vent = Vent.find(params[:vent_id])
    @response = @vent.responses.create(response_params)
    redirect_to vent_path(@vent)
  end

  def destroy
    @vent = Vent.find(params[:vent_id])
    @response = @vent.responses.find(params[:vent_id])
    @response.destroy
    flash[:success] = "Your Vent has been deleted!"
    redirect_to vent_path(@vent)
  end

  private
  def response_params
    params.require(:response).permit(:name, :body)
  end

end
