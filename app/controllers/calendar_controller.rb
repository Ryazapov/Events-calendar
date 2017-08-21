class CalendarController < ApplicationController
  def index
    render :welcome and return unless current_user

    @current_month = current_month
    calendar = CalendarService.new(@current_month.to_range)
    @events = calendar.events
    @event_types_by_day = calendar.event_types_by_day
  end

  private

  def current_month
    MonthRange.new(params[:start_date])
  end
end
