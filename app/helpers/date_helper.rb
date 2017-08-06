module DateHelper
  def full_date(date)
    date.strftime("%d/%m/%Y")
  end

  def day_of_date(date)
    date.day
  end
end
