// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap
//= require jquery.inputmask.bundle.min
//= require moment.min
//= require fullcalendar.min
//= require_tree .

$(document).on('turbolinks:load', function() {
  $('#calendar').fullCalendar({
    events: [
      {
        title: 'All Day Event',
        start: '2017-04-01'
      },
      {
        title: 'Long Event',
        start: '2017-04-07',
        end: '2017-04-10'
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2017-04-09T16:00:00'
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2017-04-16T16:00:00'
      },
      {
        title: 'Conference',
        start: '2017-04-11',
        end: '2017-04-13'
      },
      {
        title: 'Meeting',
        start: '2017-04-12T10:30:00',
        end: '2017-04-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2017-04-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2017-04-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2017-04-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2017-04-12T20:00:00'
      },
      {
        title: 'Birthday Party',
        start: '2017-04-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2017-04-28'
      }
    ]
  });
});