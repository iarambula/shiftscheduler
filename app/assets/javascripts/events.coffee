$(document).on 'turbolinks:load', ->
  $('#events_calendar').fullCalendar(
    events: '/events.json'
    header:
      left:   'title',
      right:  'month,agendaWeek,listMonth today prev,next'
  )

  $('.input-daterange').datepicker(
    format: 'yyyy-mm-dd'
    autoclose: true
    todayHighlight: true
  )

  $('#event_volunteer_id.select2, #event_shift_id.select2').select2(
    allowClear: true
    todayHighlight: true
  )

  $('#event_shift_date').datepicker(
    format: 'yyyy-mm-dd'
    autoclose: true
    todayHighlight: true
  ).on 'change', ->
    $('#event_shift_id').prop('disabled', false)
    $.ajax(
      url: "/shifts.json?date=#{$(this).val()}"
      success: (data) ->
        $('#event_shift_id').find('option').remove()
        $('#event_shift_id').select2({ data: data })
    )
