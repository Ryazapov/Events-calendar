class EventDecorator < ApplicationDecorator
  delegate_all

  def date
    object.date&.strftime("%d/%m/%Y")
  end
end
