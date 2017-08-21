class MonthRange
  attr_reader :start_date
  delegate :month, to: :start_date

  def initialize(start_date = nil)
    @start_date = parse_start_date(start_date)
  end

  def to_range
    (start_date..start_date.end_of_month)
  end

  private

  def parse_start_date(start_date)
    to_date(start_date).at_beginning_of_month
  end

  def to_date(start_date)
    Date.parse(start_date.to_s)
  rescue ArgumentError
    Time.zone.today
  end
end
