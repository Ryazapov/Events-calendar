class PagesController < ApplicationController
  def index
    return unless current_user
    @start_date = start_date
    calendar_service = CalendarService.new(current_month)
    @events = calendar_service.events
    @event_types_by_day = calendar_service.event_types_by_day
  end

  private

  def start_date
    if params[:start_date]
      date = parse_start_date
      return date.at_beginning_of_month if date
    end

    date = Time.zone.today.at_beginning_of_month
    params[:start_date] = date
  end

  def parse_start_date
    Date.parse(params[:start_date])
  rescue ArgumentError
    nil
  end

  def current_month
    @start_date..@start_date.end_of_month
  end
end
