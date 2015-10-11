#= require active_admin/base
#= require chosen-jquery
$ ->
  $('.datepicker').datepicker
    changeMonth: true
    changeYear: true
    dateFormat: "yy-mm-dd"
  return
$ ->
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No hay resultados'
    width: '78%'
