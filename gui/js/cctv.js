var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

function loadIframe(iframeName, url) {
    var $iframe = $('#' + iframeName);
    if ( $iframe.length ) {
        $iframe.attr('src',url);   
        return false;
    }
    return true;
}





var camera_ip = getUrlParameter("ip");
var source = "http://"+getUrlParameter('ip')+"/video2.mjpg"

loadIframe("controlVideo",source)

var base_url = "http://" + camera_ip;
// config defaults
var defaults = {
    ip: camera_ip,
};
var config = defaults;
config.ip = camera_ip;

function get_config () {
	var result = localStorage.getItem('configStorage');
  if (!result) {
    return config;
  } else {
  	return JSON.parse(result);
  }
}

function save_config () {
	localStorage.setItem('configStorage', JSON.stringify(config));
}

function run_action (action_url) {
	// $.get(url);
	$.ajax({
		url: action_url,
		type: 'GET',
	})
	.done(function() {
		// console.log("success");
	})
	.fail(function(jqXHR, responseText, errorThrown) {
		// console.log("error");
	})
	.always(function() {
		// console.log("complete");
	});
}

// setup all the initial configuration and standard settings
function config_init () {

  config = get_config();

	// set the initial IP value for the camera ip input
	$("#cam_ip").val(config.ip);
	base_url = "http://" + config.ip;// + "/video2.mjpg";

}

config_init();


function cam_pantilt (camera, action) {

	switch (action) {

		case 'left':

			var loc = base_url + "/cgi-bin/camctrl/camctrl.cgi?vx=-1&vy=0";
			break;

		case 'right':

			var loc = base_url + "/cgi-bin/camctrl/camctrl.cgi?vx=1&vy=0";
			break;

		case 'up':

			var loc = base_url + "/cgi-bin/camctrl/camctrl.cgi?vx=0&vy=1";
			break;

		case 'down':

			var loc = base_url + "/cgi-bin/camctrl/camctrl.cgi?vx=0&vy=-1";
			break;

		case 'home':

			var loc = base_url + "/cgi-bin/camctrl/camctrl.cgi?move=home";
			break;

		case 'ptzstop':

			var loc = base_url + "/cgi-bin/camctrl/camctrl.cgi?vx=0&vy=0";
			break;
	}

	run_action(loc);
}

function cam_zoom (camera, action) {

	var loc = base_url + "/cgi-bin/camctrl/camctrl.cgi?" + action;
	run_action(loc);

}

function cam_focus (camera, action) {

	var loc = base_url + "/cgi-bin/camctrl/camctrl.cgi?focusing=" + action;
    run_action(loc);

}

var panning;

function pan (direction) {

	panInterval = setInterval(function() {

		if (direction == 'left') {

			panning = 'left';

			var loc = base_url + "/cgi-bin/camctrl/camctrl.cgi?vx=-1&vy=0";
			
		} else if (direction == 'right') {

			panning = 'right';

			var loc = base_url + "cgi-bin/camctrl/camctrl.cgi?vx=1&vy=0";
			
		}
		run_action(loc);

	}, 1000);
}


function clear_active_preset () {
	$('.preset_image').removeClass("active");
}


$('body').on('mousedown', '.adjust_pantilt', function(e) {
	e.preventDefault();
	var action = $(this).data('action');
	cam_pantilt(1, action);
	clear_active_preset();
	return false;
});
$('body').on('mouseup mouseout', '.adjust_pantilt', function(e) {
	e.preventDefault();
	cam_pantilt(1, 'ptzstop');
	return false;
});

$('body').on('mousedown', '.adjust_zoom', function(e) {
	e.preventDefault();
	var action = $(this).data('action');
	cam_zoom(1, action);
	clear_active_preset();
	return false;
});
$('body').on('mouseup mouseout', '.adjust_zoom', function(e) {
	e.preventDefault();
	cam_zoom(1, 'zoomstop');
	return false;
});

$('body').on('mousedown', '.adjust_focus', function(e) {
	e.preventDefault();
	var action = $(this).data('action');
	cam_focus(1, action);
	clear_active_preset();
	return false;
});
$('body').on('mouseup mouseout', '.adjust_focus', function(e) {
	e.preventDefault();
	cam_focus(1, 'focusstop');
	return false;
});

// visual only toggle rocker buttons
$('body').on('mousedown', '.toggle-up', function(e) {
	e.preventDefault();
	$(this).parents('.rocker').addClass('rocker-up');
});
$('body').on('mouseup mouseout', '.toggle-up', function(e) {
	e.preventDefault();
	$(this).parents('.rocker').removeClass('rocker-up');
});

$('body').on('mousedown', '.toggle-down', function(e) {
	e.preventDefault();
	$(this).parents('.rocker').addClass('rocker-down');
});
$('body').on('mouseup mouseout', '.toggle-down', function(e) {
	e.preventDefault();
	$(this).parents('.rocker').removeClass('rocker-down');
});


/* ------------------------------------ Keyboard Events
 */

// UP
/*Mousetrap.bind('up', function(e) {
	cam_pantilt(1, 'up');
	$('.pantilt-up').addClass('active');
	return false;
}, 'keydown');

Mousetrap.bind('up', function(e) {
	cam_pantilt(1, 'ptzstop');
	$('.pantilt-up').removeClass('active');
	return false;
}, 'keyup');

// DOWN
Mousetrap.bind('down', function(e) {
	cam_pantilt(1, 'down');
	$('.pantilt-down').addClass('active');
	return false;
}, 'keydown');

Mousetrap.bind('down', function(e) {
	cam_pantilt(1, 'ptzstop');
	$('.pantilt-down').removeClass('active');
	return false;
}, 'keyup');

// LEFT
Mousetrap.bind('left', function(e) {
	cam_pantilt(1, 'left');
	$('.pantilt-left').addClass('active');
	return false;
}, 'keydown');

Mousetrap.bind('left', function(e) {
	cam_pantilt(1, 'ptzstop');
	$('.pantilt-left').removeClass('active');
	return false;
}, 'keyup');

// RIGHT
Mousetrap.bind('right', function(e) {
	cam_pantilt(1, 'right');
	$('.pantilt-right').addClass('active');
	return false;
}, 'keydown');

Mousetrap.bind('right', function(e) {
	cam_pantilt(1, 'ptzstop');
	$('.pantilt-right').removeClass('active');
	return false;
}, 'keyup');*/









function openModal(){
	$("#myModal").modal();
}
function openEditModal() {
	try{
		var scn = $("input[type='radio'][name='mds']:checked").parent().parent().children()[2].innerHTML
		var sh_des = $("input[type='radio'][name='mds']:checked").parent().parent().children()[3].innerHTML
		//var ln_des = $("input[type='radio'][name='mds']:checked").parent().parent().children()[4].innerHTML
		//var dt_id = $("input[type='radio'][name='mds']:checked").parent().parent().children()[5].innerHTML
		var lat = $("input[type='radio'][name='mds']:checked").parent().parent().children()[4].innerHTML
		var lng = $("input[type='radio'][name='mds']:checked").parent().parent().children()[5].innerHTML
		var place = $("input[type='radio'][name='mds']:checked").parent().parent().children()[6].innerHTML
		var ip = $("input[type='radio'][name='mds']:checked").parent().parent().children()[7].innerHTML
		var pip = $("input[type='radio'][name='mds']:checked").parent().parent().children()[8].innerHTML
		var port = $("input[type='radio'][name='mds']:checked").parent().parent().children()[9].innerHTML
		//var del_date = $("input[type='radio'][name='mds']:checked").parent().parent().children()[12].innerHTML
		//var qs_id = $("input[type='radio'][name='mds']:checked").parent().parent().children()[13].innerHTML
		$("#editModal").modal();
		$(".modal-body #scn_modal")[0].innerHTML = scn
		$(".modal-body #shortDescription_modal").val(sh_des)
		//$(".modal-body #longDescription_modal").val(ln_des)
		//$(".modal-body #dataSourceTypeID_modal").val(dt_id)
		$(".modal-body #latitude_modal").val(lat)
		$(".modal-body #longitude_modal").val(lng)
		$(".modal-body #place_modal").val(place)
		$(".modal-body #ipAddress_modal").val(ip)
		$(".modal-body #publicIpAddress_modal").val(pip)
		$(".modal-body #port_modal").val(port)
		//$(".modal-body #deletionDate_modal").val(del_date)
		//$(".modal-body #qualityStatementID_modal").val(qs_id)
	}
	catch(e){
		alert("Please select a device to edit")
	}
}

function editRow(){
	var scn=$('#scn_modal')[0].innerHTML;
	var shortDescription=$('#shortDescription_modal').val();
	//var longDescription=$('#longDescription_modal').val();
	//var dataSourceTypeID=$('#dataSourceTypeID_modal').val();
	var latitude=$('#latitude_modal').val();
	var longitude=$('#longitude_modal').val();
	var place=$('#place_modal').val();
	var ipAddress=$('#ipAddress_modal').val();
	var pipAddress=$('#publicIpAddress_modal').val();
	var port=$('#port_modal').val();
	//var deletionDate=$('#deletionDate_modal').val();
	//var qualityStatementID=$('#qualityStatementID_modal').val();
	$.ajax({
		url: '../utils/edit_cctv_device.php',
		data :{scn:scn,shortDescription:shortDescription,latitude:latitude,longitude:longitude,place:place,ipAddress:ipAddress,pipAddress:pipAddress,port:port},
		type: 'POST',
		success: function(result) {
			$("#cancelModal_edit").click();
			alert("Selected Device has been edited")
			fetch_devices();
		}
	});
}
function deleteRow() {
	try{
		var scn = $("input[type='radio'][name='mds']:checked").parent().parent().children()[2].innerHTML
		$.ajax({
				url: '../utils/del_cctv_device.php',
				data :{scn:scn},
				type: 'POST',
				success: function(result) {
					if(result.length == 2){
						alert("Connection Error please try again");
					}
					else{
						alert("Deleted the Device Entry Succesfully");
						fetch_devices();
					}
				}
            });
	}
	catch(e){
		alert("Please select a device to delete")
	}
}
		
$(document).ready(function(){
        fetchdata = function(){
            var scn=$('#scn').val();
			var shortDescription=$('#shortDescription').val();
			//var longDescription=$('#longDescription').val();
			//var dataSourceTypeID=$('#dataSourceTypeID').val();
			var latitude=$('#latitude').val();
			var longitude=$('#longitude').val();
			var place=$('#place').val();
			var ipAddress=$('#ipAddress').val();
			var pipAddress=$('#publicIpAddress').val();
			var port=$('#port').val();
			//var deletionDate=$('#deletionDate').val();
			//var qualityStatementID=$('#qualityStatementID').val();
			$.ajax({
				url: '../utils/add_cctv_device.php',
				data :{scn:scn,shortDescription:shortDescription,latitude:latitude,longitude:longitude,place:place,ipAddress:ipAddress,pipAddress:pipAddress,port:port},
				type: 'POST',
				success: function(result) {
					$("#cancelModal").click();
					alert("New Device has been added")
					fetch_devices();
				}
            });
        }
        $("#addDevice").click(function() {
                fetchdata();
        });
        $("#edit").click(function() {
                fetchdata();
        });

});

$(document).ready(function(){
        create_report = function(){
            var fromDate=$('#from').val();
            var toDate=$('#to').val();
            if(fromDate == ""){
				alert("Please Enter From Date");
				return;
			}
			if(toDate == ""){
				alert("Please Enter To Date");
				return;
			}
			var timerange=$("#timerange :selected").val();
			formatted_fromDate = fromDate.substr(fromDate.lastIndexOf("-")+1,fromDate.length) + "-" + fromDate.substr(fromDate.indexOf("-")+1,fromDate.lastIndexOf("-")-3)+ "-" + fromDate.substr(0,fromDate.indexOf("-"))
			formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-"))
			if(formatted_fromDate > formatted_toDate){
				alert("From Date should be less than To Date");
				return;
			}
			else{
				//window.location = "../utils/createreport_cctv.php?fromDate=" + formatted_fromDate +"&toDate=" + formatted_toDate + "&timerange=" + timerange	
				window.open("../utils/createreport_cctv.php?fromDate=" + formatted_fromDate +"&toDate=" + formatted_toDate + "&timerange=" + timerange	,'_blank');
			}
        }
        $("#createReport").click(function() {
                create_report();
        });
		
});