class EventDecorator < ApplicationDecorator
  delegate :id, :title, :event_type, :date, :description, :user, :user_id, :persisted?

  def date
    object.date&.strftime("%d/%m/%Y")
  end
end
