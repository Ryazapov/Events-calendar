class CreateEvent
  include Interactor

  delegate :user, :params, to: :context

  def call
    context.event = build_event
    context.fail! unless context.event.save
  end

  private

  def build_event
    event = user.events.build(params)
    event.end_date = event.start_date if event.once?
    event
  end
end
