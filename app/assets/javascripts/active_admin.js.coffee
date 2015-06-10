#= require active_admin/base
$ ->
  $('.datepicker').datepicker
    changeMonth: true
    changeYear: true
    dateFormat: "dd/mm/yy"
  return