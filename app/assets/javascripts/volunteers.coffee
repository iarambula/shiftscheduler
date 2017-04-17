class Shift
  WEEKEND: ['saturday', 'sunday']
  WEEKDAY: ['monday', 'tuesday', 'wednesday', 'thursday', 'friday']
  EVENING: moment '0001-01-01T17:00:00Z'
  
  constructor: (@day, starts_at, ends_at) ->
    @starts_at = moment starts_at
    @ends_at = moment ends_at
    return
    
  is_weekend: ->
    @day in @WEEKEND or @is_friday_evening()

  is_weekday: ->
    @day in @WEEKDAY
    
  is_friday_evening: ->
    @day == 'friday' and @starts_at.isSameOrAfter(@EVENING)


$(document).on 'turbolinks:load', ->
  $('#clear_shifts').click (e) ->
    $('.shift').prop('checked', false)
    e.preventDefault()

  $('#all_shifts').click (e) ->
    $('.shift').prop('checked', true)
    e.preventDefault()

  $('#weekend_shifts').click (e) ->
    $('.shift').each ->
      { day, startsAt, endsAt } = this.dataset
      shift = new Shift(day, startsAt, endsAt)
      if shift.is_weekend()
        $(this).prop('checked', true)
    e.preventDefault()

  $('#weekday_shifts').click (e) ->
    $('.shift').each ->
      { day, startsAt, endsAt } = this.dataset
      shift = new Shift(day, startsAt, endsAt)
      if shift.is_weekday()
        $(this).prop('checked', true)
    e.preventDefault()