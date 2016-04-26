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
    @vent = Vent.find(params[:vent_id])
    @response = @vent.responses.find(params[:id])
  end

  def update
    @vent = Vent.find(params[:vent_id])
    @response = @vent.responses.find(params[:id])
    @response.update(response_params)
    redirect_to @vent
  end

  def create
    @vent = Vent.find(params[:vent_id])
    @response = @vent.responses.new(response_params)
    @response.save
    if @response.save
      flash[:success] = "You vented! We hope you feel better now!"
    redirect_to vent_path(@vent)
    end
  end

  def destroy
    @vent = Vent.find(params[:vent_id])
    @response = @vent.responses.find(params[:id])
    @response.destroy
    flash[:success] = "Your response went bye bye!"
    redirect_to vent_path(@vent)
  end

  private
  def response_params
    params.require(:response).permit(:name, :body)
  end

end
