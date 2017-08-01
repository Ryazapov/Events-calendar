class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: %i[show edit update destroy]
  before_action :authorize_event!, only: %i[edit update destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
    respond_with(current_user, @event)
  end

  def edit
  end

  def update
    @event.update_attributes(event_params)
    respond_with(current_user, @event)
  end

  def destroy
    @event.destroy
    respond_with(current_user, @event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :event_type, :start_date, :end_date, :description)
  end

  def find_event
    @event = Event.find params[:id]
  end

  def authorize_event!
    authorize @event, :manage?
  end
end
