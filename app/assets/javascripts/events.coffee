$(document).on 'turbolinks:load', ->
  $('#events_calendar').fullCalendar(
    events: '/events.json'
    header:
      left:   'title',
      center: '',
      right:  'listWeek,listMonth today prev,next'
  )