class EventDecorator < ApplicationDecorator
  delegate_all

  def date
    object.date.strftime("%d/%m/%Y") if object.date
  end

  def day_of_date
    object.date.day if object.date
  end
end
