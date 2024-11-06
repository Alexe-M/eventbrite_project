class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save 
      redirect_to root_path, notice: "Ton évènement a été créé avec succès !"
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end
  
end
