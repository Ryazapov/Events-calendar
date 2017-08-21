class UserEventsController < ApplicationController
  before_action :authenticate_user!
  expose_decorated :user
  expose_decorated :events, -> { user.events }

  def index
  end
end
