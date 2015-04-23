$.datepicker.regional['es'] = {
  closeText: 'Cerrar',
  prevText: 'Ant',
  nextText: 'Sig',
  currentText: 'Hoy',
  monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
  monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
  dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
  dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
  dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
  weekHeader: 'Sm',
  dateFormat: 'dd/mm/yy',
  firstDay: 1,
  isRTL: false,
  showMonthAfterYear: false,
  yearSuffix: ''
};
$.datepicker.setDefaults($.datepicker.regional['es']);

$(function(){
  $(".fecha").datepicker();
  // Defines Main Height
  var WndwHght = $( window ).height();
  var NvtnHght = $("nav").outerHeight();
  var HdrHght = $("header").outerHeight();
  var FtrHght = $("footer").outerHeight();
  $(".main").css("min-height", WndwHght - NvtnHght - HdrHght - FtrHght);
  // Defines Dashboard Items Height
  if ($(".dashboard").length > 0){
    $("ul.da-thumbs li").each(function(){
      $(this).addClass("thumb");
      var ovlyHght = $(".thumb .overlay").height();
      var strngHght = $(".thumb .overlay strong").height();
      var difHghts = eval(ovlyHght - strngHght);
      $(".thumb .overlay strong").css("margin-top", difHghts/2);
      $(this).removeClass("thumb");
    });
  }
  // Set Profile Height
  if( $(".profileHdr").length > 0){
    var WndwWdth = $( window ).width();
    if( WndwWdth > 640){
      var btnsHght = $(".prflActns").outerHeight();
      $(".profileHdr figure img").load(function(){
        var colHghst = $(".profileHdr .fixHght:first-child").outerHeight();
        $(".profileHdr .fixHght").css("height", colHghst);
        $(".prflActns").css("padding-top", colHghst-btnsHght);
      });
    }
  }
  if( $(".signUp").length > 0){
    $("body").addClass("sessions");
  }
});