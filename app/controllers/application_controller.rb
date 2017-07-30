class ApplicationController < ActionController::Base
  include Authorization

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html
end
