class EventsController < ApplicationController
  before_action :authenticate_user!
  expose :events { Event.all.decorate }
  expose_decorated(:event)
  before_action :authorize_event!, only: %i[edit update destroy]

  def index
  end

  def new
  end

  def show
  end

  def create
    event.user = current_user
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
    params.require(:event).permit(:title, :event_type, :date, :description)
  end

  def authorize_event!
    authorize event, :manage?
  end
end
