// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-1.12.4.js
//= require datatables.min.js
//= require dataTables.bootstrap.min.js
//= require_tree .

$(document).ready( function() {
			     $('#table_di').DataTable( {
			     	lengthMenu: [[5, 25, 50, -1],[5, 25, 50, "Todas"]],
			        language: {
			          search: '<i class="fa fa-search "></i>',
			          sLengthMenu:'Mostrar _MENU_ entradas',
			          sInfo:'Mostrando _START_ - _END_ de un total de _TOTAL_ entradas',
			          sInfoEmpty: 'No hay datos registrados',
			        oPaginate:{
			          	sNext: '<i class="fa fa-arrow-circle-right"></i>',
			          	sPrevious:'<i class="fa fa-arrow-circle-left"></i>'}
						
			        }
			      } );
			    });


/*$(document).ready(function(){
	$.datepicker.regional['es'] = {
		closeText: 'Cerrar',
		prevText: ' Ant<',
		nextText: 'Sig>',
		currentText: 'Hoy',
		monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
		'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
		monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
		'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
		dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
		dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié;', 'Juv', 'Vie', 'Sáb'],
		dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
		weekHeader: 'Sm',
		dateFormat: 'dd/mm/yy',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''
	};
	$.datepicker.setDefaults($.datepicker.regional["es"]);
	$('.datepicker').datepicker();
});*/