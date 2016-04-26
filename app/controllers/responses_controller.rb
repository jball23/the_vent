class ResponsesController < ApplicationController

  def index
    @responses = Response.all
  end

  def new
    @vent = Vent.find(params[:vent_id])
    @response = @vent.responses.new
  end

  def create
    @vent = Vent.find(params[:vent_id])
    @response = Response.new(response_params)
    if @response.save
      flash[:success] = "Thanks for your response!"
      redirect_to @vent
    else
      render 'index'
    end
  end

  def destroy
    @response = Response.find(params[:vent_id])
    @response.destroy
    flash[:success] = "Your Vent has been deleted!"
    redirect_to vents_path
  end

  private
  def response_params
    params.require(:response).permit(:name, :body)
  end

end
