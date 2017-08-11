module Events
  class EventsQuery
    attr_reader :current_month

    def initialize(current_month)
      @current_month = current_month
    end

    def all
      Event.where(start_date <= current_month.last).where(end_date >= current_month.first)
    end
  end
end
