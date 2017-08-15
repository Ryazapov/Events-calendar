class CalendarService
  attr_reader :current_month, :events_by_day, :event_types_by_day
  private :current_month, :events_by_day

  def initialize(current_month)
    @current_month = current_month
    @events_by_day = {}
    @event_types_by_day = {}
  end

  def events
    events = Events::EventsQuery.new(current_month).all

    group_events_by_day(events)
  end

  private

  def group_events_by_day(events)
    events.each { |event| add_event_by_type(event) }

    events_by_day
  end

  def add_event(event, date)
    events_by_day[date.day] ||= []
    events_by_day[date.day].push(event)

    add_event_type(event.event_type, date)
  end

  def add_event_by_type(event)
    case event.event_type
    when /once|monthly|yearly/
      add_event(event, event.date)
    when "daily"
      daily_event(event)
    when "weekly"
      weekly_event(event)
    end
  end

  def add_event_type(event_type, date)
    event_types_by_day[date.day] ||= Set.new
    event_types_by_day[date.day].add(event_type)
  end

  def between_date(event)
    from = [current_month.first, event.date.to_date].max

    (from..current_month.last)
  end

  def daily_event(event)
    between_date(event).each { |date| add_event(event, date) }
  end

  def weekly_event(event)
    days_by_event_weekday = between_date(event).group_by(&:wday)[event.date.wday]

    days_by_event_weekday.each { |date| add_event(event, date) }
  end
end
