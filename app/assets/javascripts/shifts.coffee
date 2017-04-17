$(document).on 'turbolinks:load', ->
  $('#new_shift.form-inline').on('ajax:success', ->
    toastr.success('Shift was created successfully.')
  ).on('ajax:error', ->
    toastr.error('All fields are required.')
  )