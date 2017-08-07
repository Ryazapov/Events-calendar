class EventsController < ApplicationController
  before_action :authenticate_user!
  expose :events, ->{ Event.all }
  expose :event, build: ->(params){
    result = CreateEvent.call(user: current_user, params: params)
    result.event
  }
  before_action :authorize_event!, only: %i[edit update destroy]

  def index
  end

  def new
  end

  def show
  end

  def create
    event.save
    respond_with(event)
  end

  def edit
  end

  def update
    event.update_attributes(event_params)
    respond_with(event)
  end

  def destroy
    event.destroy
    respond_with(event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :event_type, :start_date, :end_date, :description)
  end

  def authorize_event!
    authorize event, :manage?
  end
end
