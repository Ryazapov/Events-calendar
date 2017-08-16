module Events
  class EventsQuery
    attr_reader :month_range
    private :month_range

    def initialize(month_range)
      @month_range = month_range
    end

    def all
      once_events.or(daily_weekly_monthly_events).or(yearly_events)
    end

    private

    def once_events
      Event.once.by_date(month_range)
    end

    def daily_weekly_monthly_events
      Event.where(event_type: %i[daily weekly monthly]).before_date(last_day_in_month)
    end

    def yearly_events
      Event.yearly
        .by_month(first_day_in_month.month)
        .before_date(last_day_in_month)
    end

    def first_day_in_month
      month_range.first
    end

    def last_day_in_month
      month_range.last
    end
  end
end
