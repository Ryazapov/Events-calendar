module Events
  class EventsQuery
    attr_reader :current_month

    def initialize(current_month)
      @current_month = current_month
    end

    def all
      Event.where(event_type: :once).where(date: current_month).or(Event.where(event_type: %i[daily weekly monthly])
           .or(Event.where(event_type: :yearly)
           .where("extract(month from date) = :date_month", date_month: current_month.first.month))
           .where("date <= :date", date: current_month.last))
    end
  end
end
