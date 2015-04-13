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
$(function () {
  $(".fecha").datepicker();
});

$(function(){
  // Defines Main Height
  var WndwHght = $( window ).height();
  var NvtnHght = $("nav").outerHeight();
  var HdrHght = $("header").outerHeight();
  var FtrHght = $("footer").outerHeight();
  $("main").css("min-height", WndwHght - NvtnHght - HdrHght - FtrHght);
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
  // Show/Hide Filters Options
  var FltrHght = $(".filter").outerHeight();
  var AvncdHght = $(".avanced").outerHeight();
  $(".avanced").css("height", "0px");
  $("#avncd").click(function(){
    $(".filter").css("height",FltrHght);
    setTimeout(function(){
      $(".avanced").css("height", AvncdHght);
      $(".filter").css("height","0px");
    }, 100);
  });
  $("#Quit").click(function(){
    setTimeout(function(){
      $(".avanced").css("height","0px");
      $(".filter").css("height", FltrHght);
    },100);
  });
  // Show Hide File Downloads
  // var dwnldToggle = 0;
  // var dwnldHght = $(".filesPnl").outerHeight();
  // $(".filesPnl").css("height", "0px");
  // $("#downloads").click(function(){
  //   if (dwnldToggle == 0){
  //     $(".filesPnl").css("height", dwnldHght);
  //     dwnldToggle = 1;
  //   }
  //   else if (dwnldToggle == 1){
  //     $(".filesPnl").css("height", "0px");
  //     dwnldToggle = 0;
  //   }
  // });
  if( $(".profileHdr").length > 0){
    var btnsHght = $(".prflActns").outerHeight();
    $(".profileHdr figure img").load(function(){
      var colHghst = $(".profileHdr .fixHght:first-child").outerHeight();
      $(".profileHdr .fixHght").css("height", colHghst);
      $(".prflActns").css("padding-top", colHghst-btnsHght);
    });

    // colHghst = new Array;
    // $(".profileHdr>.columns").each(function(){
    //   colHghst.push($(this).outerHeight());
    // });
    // colHghst.sort();
    // colHghst.reverse()
    //$(".profileHdr>.columns").css("height", colHghst[0]);
  }
  //  Waiting for a custom body class views
  if ($(".user-view").length > 0){
    $("body").addClass("user-form")
  }


});