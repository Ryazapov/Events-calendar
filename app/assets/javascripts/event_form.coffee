class EventForm
  DATE = "#event_date"

  constructor: (@$el) ->
    @_addCalendar(DATE)

  _addCalendar:(inputId) =>
    $(inputId).fdatepicker
      format: 'dd/mm/yyyy'
      language: 'en'
      leftArrow: '<<'
      rightArrow: '>>'

$.fn.eventForm = ->
  return $(@).each ->
    unless $.data(@, "event-form")
      $.data(@, "event-form", new EventForm($(@)))
