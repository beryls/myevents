class EventsController < ApplicationController
  def index

    @events = if params[:keywords]
                Event.where('UPPER(name) like ?', "%#{params[:keywords].upcase}%")
              else
                []
              end
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params.require(:event).permit(:name, :year, :location))
    @event.save
    render 'show', status: 201
  end

  def update
    event = Event.find(params[:id])
    event.update_attributes(params.require(:event).permit(:name, :year, :location))
    head :no_content
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    head :no_content
  end
end
