class EventForm
  EVENT_TYPE = "#event_event_type"
  START_DATE = "#event_start_date"
  END_DATE = "#event_end_date"

  HIDE_CLASS = "hide"

  EVENT_TYPE_ONCE = "once"

  constructor: (@$el) ->
    @_addCalendar(START_DATE)
    @_addCalendar(END_DATE)

    @_bindEvents()

  _bindEvents: ->
    @$el.on "change", EVENT_TYPE, @_handleEventTypeChange

  _handleEventTypeChange: =>
    event_type_input = $(EVENT_TYPE)
    end_date_input = $(END_DATE)
    end_date_parent = end_date_input.parent().parent()
    if (event_type_input.val() == EVENT_TYPE_ONCE)
      end_date_parent.hide()
      end_date_input.val('')
    else
      end_date_parent.removeClass(HIDE_CLASS)
      end_date_parent.show()

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
