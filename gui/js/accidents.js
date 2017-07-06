list_types =""; //defined globally
$(document).ready(function(){

	map = L.map('accident_map').setView([24.390673, 88.1157715],9);
	//gpx routing system
	var gpx = 'route.gpx'; // URL to your GPX file or the GPX itself
	new L.GPX(gpx, {async: true}).on('loaded', function(e) {
	  map.fitBounds(e.target.getBounds());
	}).addTo(map).on('click',onRouteClick);

	route_marker ="not-created";

    function use_routing_machine(latlng,route_marker){
    	routingControl = L.Routing.control({
				  createMarker: function() { return null; }, 
				  waypoints: [
				    L.latLng(24.117355, 88.29131),
				    L.latLng(latlng.lat,latlng.lng)
				  ],
				  	routeWhileDragging: true,
				    autoRoute:true,
				    useZoomParameter:false,
				    addWaypoints:false,
				    draggableWaypoints:false,
				    show:false,
				    addWaypoints:false
				}).addTo(map); 
    	
    	routingControl.on('routesfound', function(e) {
		    var routes = e.routes;
		    distance = routes[0].summary.totalDistance;
		    // Need to change for different product
		    distance = distance + 191600; // Taking MET as standard 206 km // Distance between berhampore and MET is 14.4km 
		    $('#add_northing')[0].innerHTML = latlng.lat.toString(); 
			$('#add_easting')[0].innerHTML = latlng.lng.toString();
			$('#chainage')[0].innerHTML = (distance/1000).toString().substring(0,6);
			route_marker.setLatLng(latlng);
			route_marker.bindPopup("Your chainage is "+(distance/1000).toString().substring(0,6)+". Drag to Reposition. Double click to set accident &nbsp; &nbsp; &nbsp; &nbsp; <a href='#' class='close_route'>Close Marker</a>");
			route_marker.openPopup();
			// route_marker.on('click',function(ein){
			// 	alert("MArker Clciked");
			// })
			route_marker.on('dblclick',function(ein){
				var date=new Date;
    			date=(date.toISOString().substring(0,10)).concat(" ",date.toTimeString().substring(0,8));
    			//console.log(date);
    			$(".acc_datetime").val(date);
				$("#add_modal").modal();
			})
		});
    }
	function onRouteClick(e){
		if (route_marker == "not-created") {
			dist = e.target.get_distance();
			//console.log(dist);
			var myIcon = L.icon({
			    iconUrl: '../images/accident_pin.png',
			    iconSize: [40,40],
			    iconAnchor: [20,43],
			    popupAnchor: [0,-45]
			})
			options = {
				icon: myIcon,
				draggable:false,
				title:"Accident Location"
			};
			route_marker = L.marker(e.latlng,options);

			route_marker.on('add',function(){
				use_routing_machine(e.latlng,route_marker);
			})

			route_marker.on('dragend',function(ein){
				var inmarker = ein.target;
				var latlng = inmarker.getLatLng();
				rmv_routing_machine();
				use_routing_machine(latlng,route_marker);
			})
			map.addLayer(route_marker);
		}else{
			alert("Marker already exists. Drag to Reposition");
		}
	};

	mapLink = 
    '<a href="http://openstreetmap.org">OpenStreetMap</a>';
    L.tileLayer(
            'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; ' + mapLink + ' Contributors',
            maxZoom: 16,
    }).addTo(map);

function rmv_routing_machine(){
	map.removeControl(routingControl);
}

$(document).on('click', ".close_route", function() {
	rmv_routing_machine();
	map.removeLayer(route_marker);
	route_marker ="not-created";
})

function get_vehicles(){
	vehicles=L.featureGroup();
	$.ajax({
		url:'../utils/get_vehicles.php',
		method:'POST',              
		success:function(res){
			var res = jQuery.parseJSON(res);
			var markers_array = [];
			for (var i = res.length - 1; i >= 0; i--) {
				if (res[i].VehicleType == "Ambulance") {var myIcon_cctv = L.icon({iconUrl: '../images/ambulance.png',iconSize:[60,28],iconAnchor:[30,14]});}
				if (res[i].VehicleType == "Patrol Unit") {var myIcon_cctv = L.icon({iconUrl: '../images/patrolunit.png',iconSize:[60,28],iconAnchor:[30,14]});}
				
				var table = res[i].name;
				markers_array.push(new L.marker([res[i].Northing,res[i].Easting]));
				marker = new L.marker([res[i].Northing,res[i].Easting],{icon: myIcon_cctv}).bindPopup(table);
				vehicles.addLayer(marker);
			}
		}
	});
	map.addLayer(vehicles);
}
get_vehicles();
//Define markers globally
markers=L.featureGroup();
function mapMarker(){ 
	var date=new Date;
    date=(date.toISOString().substring(0,10)).concat(" ",date.toTimeString().substring(0,8));
    //console.log(date);
	$.ajax({
		url: '../utils/current_accidents.php',
		type: 'POST',
		data:{current_time:date},
		success: function(res) {
			
			var res = jQuery.parseJSON(res);
			var markers_array = [];
			for(i=0; i<res.length;i++){
				if(res[i].isold == '1')
					continue;
				console.log("Type:"+res[i].Type);
					$.ajax({
						url:'../utils/current_accidents_relation.php',
						type: 'POST',
						res:res[i],
						data : {scn:res[i].SystemCodeNumber,MainID:res[i].Type},
						success:function(res_rel){
							//console.log(res_rel);
							var res_rel = jQuery.parseJSON(res_rel);
							var scn = this.res.SystemCodeNumber;
							var mid = this.res.Type;
							var table = '<table class="map_table" id="' + this.res.SystemCodeNumber + '">';
			                table += '<tr><th>Key</th><th>Value</th></tr>';
			                                        
			                $.each(this.res, function(k,v) {
			                	
			                	if(k =='CreationDate' || k == 'EndDate' || k == 'ShortDescription' || k == 'LongDescription' || k == ' EndDate' || k == 'CreatedBy' || k == 'isold')
			                		return true;
			                	table += "<tr><td>" + k + "</td><td>" + v + "</td></tr>"
			                });

			                if (this.res.isold == '0') {
				                for (var i = 0; i < res_rel.length; i++) {
				                	var name = res_rel[i].Checklist_type,
				                	informed = res_rel[i].Informed,
				                	arrived = res_rel[i].Arrived,
				                	resolved = res_rel[i].Resolved;
				                	//console.log(name);
				                	if (informed == "true" && name !="Camera" && name != "VMS") {
				                		table += "<tr><td>" + name+"</td>";
					                	if (arrived == "false") {
					                		table += "<td><button mid='"+mid+"' scn='"+scn+"' chk_type='"+name+"' class='set_time btn btn-danger'>Arrived</button> &nbsp; &nbsp;";
					                	}
					                	else{
					                		table += "<td><button class='btn btn-success' disabled>Arrived</button> &nbsp; &nbsp;";
					                	}
					                	if (resolved == "false") {
					                		table += "<button mid='"+mid+"' scn='"+scn+"' chk_type='"+name+"' class='set_time btn btn-danger'>Resolved</button></td>";
					                	}
					                	else{
					                		table += "<button class='btn btn-success' disabled>Resolved</button></td>";
					                	}
				                	}
				                	else if(name=="Camera" || name== "VMS"){
				                		table += "<tr><td>" + name+"</td>";
				                		table += "<td><button mid='"+mid+"' scn='"+scn+"' nor='"+nor+"' eas='"+eas+"' chk_type='"+name+"' class='do_action btn btn-danger'>View</button> &nbsp; &nbsp;";
				                	}
				                	else{
				                		table += "<tr><td>" + name+"</td>";
				                		table += "<td><button mid='"+mid+"' scn='"+scn+"' nor='"+nor+"' eas='"+eas+"' chk_type='"+name+"' class='do_action btn btn-danger'>Inform</button> &nbsp; &nbsp;";
				                	}
				                }
				             	table += '</table>';
			               		table += "<button mid='"+mid+"' scn='"+scn+"' chk_type='"+name+"' class='resolve_sit btn btn-danger'>Resolve Situation</button>";
				            }
				            else{
				            	table += "<tr><td>Report</td><td mid='"+mid+"' scn='"+scn+"' style='color:blue;'' class='view_report' >View Report</td></tr>";
				            	table += '</table>';
				            }

							var myIcon_cctv = L.icon({iconUrl: '../images/cctvOn - Copy.png',iconSize:[25,30],iconAnchor:[6,13]});
							
							markers_array.push(new L.marker([this.res.Northing,this.res.Easting]))
							marker = new L.marker([this.res.Northing,this.res.Easting],{icon: myIcon_cctv}).bindPopup(table);
							markers.addLayer(marker);

						}
					})

			}
			map.addLayer(markers);
			var markers_group = new L.featureGroup(markers_array);
			//map.fitBounds(markers_group.target.getBounds().pad(0.05));
		}
	});
}

//mapMarker();

$('#check_old').change(function(){
	change_mapmarker();
});

$('#check_curr').change(function(){
	change_mapmarker();
})////
function change_mapmarker(){
	var date=new Date;
	date=(date.toISOString().substring(0,10)).concat(" ",date.toTimeString().substring(0,8));

	map.removeLayer(markers);

	if(!$('input[name=checkgrp]:checked').length > 0){
		mapMarker();
		return;
	}
	markers=L.featureGroup();
	$.ajax({
		url: '../utils/current_accidents.php',
		type: 'POST',
		data:{current_time:date},
		success: function(res) {
			
			var res = jQuery.parseJSON(res);
			var markers_array = [];
			

			for(i=0; i<res.length;i++){
				if($('#check_old').prop('checked') && !$('#check_curr').prop('checked')){
					if(res[i].isold == '0')
						continue;
				}
				else if(!$('#check_old').prop('checked') && $('#check_curr').prop('checked')){
					if(res[i].isold == '1')
						continue;
				}
				else if($('#check_old').prop('checked') && $('#check_curr').prop('checked')){
					
				}
				else{
					if(res[i].isold == '0') continue;
					if(res[i].isold == '1') continue;
				}
				result = res[i];
				//console.log("Type:"+res[i].Type);
				$.ajax({
					url:'../utils/current_accidents_relation.php',
					type: 'POST',
					res:res[i],
					data : {scn:res[i].SystemCodeNumber,MainID:res[i].Type},
					success:function(res_rel){
						//console.log(res_rel);
						var res_rel = jQuery.parseJSON(res_rel);
						var scn = this.res.SystemCodeNumber;
						var mid = this.res.Type;
						var nor = this.res.Northing;
						var eas = this.res.Easting;
						var table = '<table class="map_table" id="' +scn+ '">';
		                table += '<tr><th>Key</th><th>Value</th></tr>';
		                                        
		                $.each(this.res, function(k,v) {
		                	
		                	if(k =='CreationDate' || k == 'EndDate' || k == 'ShortDescription' || k == 'LongDescription' || k == ' EndDate' || k == 'CreatedBy' || k == 'isold')
		                		return true;
		                	table += "<tr><td>" + k + "</td><td>" + v + "</td></tr>"
		                });
		                if (this.res.isold == '0') {
			                for (var i = 0; i < res_rel.length; i++) {
			                	var name = res_rel[i].Checklist_type,
			                	informed = res_rel[i].Informed,
			                	arrived = res_rel[i].Arrived,
			                	resolved = res_rel[i].Resolved;
			                	//console.log(name);
			                	if (informed == "true" && name !="Camera" && name != "VMS") {
			                		table += "<tr><td>" + name+"</td>";
				                	if (arrived == "false") {
				                		table += "<td><button mid='"+mid+"' scn='"+scn+"' chk_type='"+name+"' class='set_time btn btn-danger'>Arrived</button> &nbsp; &nbsp;";
				                	}
				                	else{
				                		table += "<td><button class='btn btn-success' disabled>Arrived</button> &nbsp; &nbsp;";
				                	}
				                	if (resolved == "false") {
				                		table += "<button mid='"+mid+"' scn='"+scn+"' chk_type='"+name+"' class='set_time btn btn-danger'>Resolved</button></td>";
				                	}
				                	else{
				                		table += "<button class='btn btn-success' disabled>Resolved</button></td>";
				                	}
			                	}
			                	else if(name=="Camera" || name== "VMS"){
			                		table += "<tr><td>" + name+"</td>";
			                		table += "<td><button mid='"+mid+"' scn='"+scn+"' nor='"+nor+"' eas='"+eas+"' chk_type='"+name+"' class='do_action btn btn-danger'>View</button> &nbsp; &nbsp;";
			                	}
			                	else{
			                		table += "<tr><td>" + name+"</td>";
			                		table += "<td><button mid='"+mid+"' scn='"+scn+"' nor='"+nor+"' eas='"+eas+"' chk_type='"+name+"' class='do_action btn btn-danger'>Inform</button> &nbsp; &nbsp;";
			                	}
			                }
			             	table += '</table>';
		               		table += "<button mid='"+mid+"' scn='"+scn+"' chk_type='"+name+"' class='resolve_sit btn btn-danger'>Resolve Situation</button>";
			            }
			            else{
			            	table += "<tr><td>Report</td><td mid='"+mid+"' scn='"+scn+"' style='color:blue;'' class='view_report' >View Report</td></tr>";
			            	table += '</table>';
			            }
		                
						var myIcon_cctv = L.icon({iconUrl: '../images/cctvOn - Copy.png',iconSize:[25,30],iconAnchor:[6,13]});
						
						markers_array.push(new L.marker([this.res.Northing,this.res.Easting]))
						marker = new L.marker([this.res.Northing,this.res.Easting],{icon: myIcon_cctv}).bindPopup(table);
						markers.addLayer(marker);

					}
				})
			}
			map.addLayer(markers);
			var markers_group = new L.featureGroup(markers_array);
			//console.log(markers_group);
			//map.fitBounds(markers_group.target.getBounds().pad(0.05));

		}
	});
}
$(document).on('click', ".set_time", function() {
	var val = $(this)[0].innerHTML;
	var chk = $(this).attr("chk_type");
	var scn = $(this).attr("scn");
	var mid = $(this).attr("mid");
	//console.log("CHK"+chk+"Val"+val+"SCN"+scn+"Mid"+mid);
	$.ajax({
		url:'../utils/update_accident_relation.php',
		method:'POST',
		data:{SystemCodeNumber:scn,MainID:mid,Checklist:chk,Value:val},              
		success:function(res){
			alert("Recorded Successfully");
			location.reload();
		}
	});
})
$(document).on('click', ".resolve_sit", function() {
	var scn = $(this).attr("scn");
	var mid = $(this).attr("mid");
	//console.log("CHK"+chk+"Val"+val+"SCN"+scn+"Mid"+mid);
	$.ajax({
		url:'../utils/update_accident.php',
		method:'POST',
		data:{SystemCodeNumber:scn,MainID:mid},              
		success:function(res){
			alert("Recorded Successfully");
			location.reload();
		}
	});
})
$(document).on('click', ".view_report", function() {
	var scn = $(this).attr("scn");
	var mid = $(this).attr("mid");
	$("#name_modal")[0].innerHTML = scn;
	$("#chk_modal tbody").empty();
	$.ajax({
		url:'../utils/performance_reports.php',
		method:'POST',
		data:{SystemCodeNumber:scn,MainID:mid},              
		success:function(res){
			res=jQuery.parseJSON(res);
			var table = "";
			for (var i = 0; i < res.length; i++) {
				$("#action_modal")[0].innerHTML = res[i].Action;
				if (res[i].Checklist_type != "Camera" && res[i].Checklist_type !="VMS") {
					table += "<tr><td>"+res[i].Checklist_type+"</td><td>"+res[i].Informed+"</td><td>"+res[i].Informed_time+"</td><td>"+res[i].Arrived+"</td><td>"+res[i].Arrived_time+"</td><td>"+res[i].Resolved+"</td><td>"+res[i].Resolved_time+"</td></tr>";
				}
				else{
					table += "<tr><td>"+res[i].Checklist_type+"</td><td>N/A</td><td>N/A</td><td>N/A</td><td>N/A</td><td>N/A</td><td>N/A</td></tr>";
				}
			}
			$("#chk_modal tbody").append(table);
			$("#viewReportModal").modal();
		}
	})
})	 
//
$(document).on('click', ".do_action", function() {
	var val = $(this)[0].innerHTML,
	chk = $(this).attr("chk_type"),
	scn = $(this).attr("scn"),
	mid = $(this).attr("mid"),
	nor = $(this).attr("nor"),
	eas = $(this).attr("eas");
	//console.log("CHK"+chk+"Val"+val+"SCN"+scn+"Mid"+mid);
	$.ajax({
		url:'../utils/get_accident_types.php',
		method:'POST',
		success:function(res){
			res=jQuery.parseJSON(res);
			for(var i=0;i<res.length;i++){
				if (res[i].name == chk) {
					if (chk=="Camera" && res[i].action=="cctvWindow.html") {
						var distance_vms=0,distance_cctv=0,vms_ip="",cctv_ip="",vms_scn="",cctv_scn="";
						$.ajax({
				        	url: '../utils/cctv_devices.php',
				        	success: function(result) {
								var devices_set = jQuery.parseJSON(result);
								for(i=devices_set.length-1; i>=0;i--){
									lat = devices_set[i].Northing
									lng= devices_set[i].Easting
									//console.log(getHaversineDist(lat,lng,nor,eas));
									if (distance_cctv == 0 || distance_cctv > getHaversineDist(lat,lng,nor,eas)) {
										distance_cctv = getHaversineDist(lat,lng,nor,eas);
										cctv_ip = devices_set[i].IPAddress;
										cctv_scn = devices_set[i].SystemCodeNumber;
									}
								}
								//console.log(distance_cctv+":::"+cctv_ip+":::"+cctv_scn+":::"+port);
								url = "../html/cctvWindow.html?ip="+cctv_ip;
							  	window.open(url,'_blank');
				        	}
				        });

					}
					else if (chk=="VMS" && res[i].action=="vms_display_msg.html"){
				        var distance_vms=0,distance_cctv=0,vms_ip="",cctv_ip="",vms_scn="",cctv_scn="";
						nor=$('#add_northing')[0].innerHTML;
						eas=$('#add_easting')[0].innerHTML;
						$.ajax({
				        	url: '../utils/vms_devices.php',
				        	success: function(result) {
								var devices_set = jQuery.parseJSON(result);
								for(i=devices_set.length-1; i>=0;i--){
									lat = devices_set[i].Northing;
									lng= devices_set[i].Easting;
									//console.log(getHaversineDist(lat,lng,nor,eas));
									if (distance_vms == 0 || distance_vms > getHaversineDist(lat,lng,nor,eas)) {
										distance_vms = getHaversineDist(lat,lng,nor,eas);
										vms_ip = devices_set[i].IPAddress;
										vms_scn = devices_set[i].SystemCodeNumber;
									}
								}
								//console.log(distance_vms+":::"+vms_ip+":::"+vms_scn);
								url = "../html/vms_display_msg.html?vms_scn="+vms_scn;
							  	window.open(url,'_blank');
				        	}
				        });

					}
					else{
						alert("Call "+res[i].action);
							val = "Informed";
							$.ajax({
								url:'../utils/update_accident_relation.php',
								method:'POST',
								data:{SystemCodeNumber:scn,MainID:mid,Checklist:chk,Value:val},              
								success:function(res){
									alert("Recorded Successfully");
									location.reload();
								}
							});
					}
				}
			}
		}
	});

})
//
$("#action_complete").click(function(){
	var scn=$('.scn').val(),
	tid=$('.type_id').val(),
	aid=$('.action_id').val(),
	mid=$('#main_type').val().toLowerCase(),
	data_entry_list = [];
	for (var i = list_types.length - 1; i >= 0; i--) {
		var data_objects = {};
		//console.log($("#td_list"+i)[0].innerHTML.toString()+$("#check_list"+i).is(":checked"));
		data_objects['item'] = $("#td_list"+i)[0].innerHTML.toString();
		data_objects['value'] = $("#check_list_id"+i).is(":checked");
		data_entry_list.push(data_objects);
	}
	$.ajax({
		url:'../utils/add_accident_relation.php',
		method:'POST',
		data:{SystemCodeNumber:scn,MainID:mid,TypeId:tid,Action:aid,Checklist:data_entry_list},              
		success:function(res){
			alert("Situation Recorded Successfully");
			location.reload();
		}
	});
})
//range slider
var selector = '[data-rangeslider]';
var $element = $(selector);	
var textContent = ('textContent' in document) ? 'textContent' : 'innerText';
function valueOutput(element) {
        var value = element.value;
        var output = element.parentNode.getElementsByTagName('output')[0] || element.parentNode.parentNode.getElementsByTagName('output')[0];
        output[textContent] = value;
    }
$(document).on('input', 'input[type="range"], ' + selector, function(e) {
    valueOutput(e.target);
});

$element.rangeslider();


//Date picker
var logic = function( currentDateTime ){
if (currentDateTime && currentDateTime.getDay() == 6){
    this.setOptions({
        minTime:'11:00'
    });
}else
    this.setOptions({
        minTime:'8:00'
    });
};
$('.datepicker').datetimepicker({
    onChangeDateTime:logic,
    onShow:logic
});

//Adding accident
$.ajax({
        url: '../utils/get_username.php',
        success: function(result) {
        	    if(result.length > 30){
                        window.location = "../index.html"
                }
        uname=result.trim();
        }  
        
})


$('#add-form').on("submit",function(formdata){
		formdata.preventDefault();
		var form_add = $('#add-form');
		nor=$('#add_northing')[0].innerHTML;
		eas=$('#add_easting')[0].innerHTML;
		if (form_add.parsley().isValid()){
			console.log ('valid');
			var scn=$('.scn').val(),
			sdesc=$('.sdesc').val(),
			ldesc=$('.ldesc').val(),
			nor=$('#add_northing')[0].innerHTML.substring(0,8),
			eas=$('#add_easting')[0].innerHTML.substring(0,8),
			mid=$('#main_type').val().toLowerCase(),
			tid=$('.type_id').val(),
			aid=$('.action_id').val(),
			accDT=$('.acc_datetime').val(),
			edate=$('.end_datetime').val(),
			sev=$('#severity').val(),
			rep=$('.reported').val();
			//console.log($('.type_id'));
			//alert("TID"+$('.type_id'));
			if(sev == "0"){
				alert("please enter severity");	
			}
			else{
				
				$.ajax({
					url:'../utils/add_accident.php',
					method:'POST',
					data:{SystemCodeNumber:scn,ShortDescription:sdesc,LongDescription:ldesc,MainID:mid,Northing:nor,Easting:eas,Action:aid,TypeID:tid,AccidentTime:accDT,CreatedBy:uname,EndDate:edate,Severity:sev,ReportedBy:rep,isedit:0},
					success:function(res){
						$('#add_modal').modal('toggle');
						checklist_popup(scn,tid,aid)
						//location.reload();
					}
				});
			}
		} 
		else{
		console.log ('invalid');
		}
})

$('#main_type').change(function(){
	var selected_option= $('#main_type').val();
	selected_option = selected_option.toLowerCase();
	$('.scn').val(selected_option.substring(0,1).toUpperCase())
	//console.log(selected_option);
	if (selected_option != "") {

		$.ajax({
			url:'../utils/get_utmc_types.php',
			method:'POST',
			data:{type:selected_option},
			success:function(res){
				res=jQuery.parseJSON(res);
				$('.type_id').empty();
				for(var i=0;i<res.length;i++){
					$('.type_id').append('<option value='+res[i].accident_type_id+'>'+res[i].accident_type.toLowerCase().capitalize()+'</option>');
					//$('.up_type_id').append('<option value='+res[i].TypeID+'>'+res[i].name+'</option>');
				}
			}
		});
	}
	else{
	 $('.type_id').empty();
	};
})

$.ajax({
	url:'../utils/get_accident_actions.php',
	method:'POST',
	success:function(res){
		res=jQuery.parseJSON(res);
		for(var i=0;i<res.length;i++){
			$('.action_id').append('<option>'+res[i].name+'</option>');
		}
	}
});

//checklist
function checklist_popup(scn,tid,aid){
	var list ="";
	$.ajax({
		url:'../utils/get_accident_actions.php',
		method:'POST',
		success:function(res){
			res=jQuery.parseJSON(res);
			for(var i=0;i<res.length;i++){
				if (res[i].name == aid) {
					list = res[i].list;
					list_types = list;
					add_chk_list(list);
				}
			}
		}
	});

	$("#scn_modal")[0].innerHTML = scn;
	$("#name_modal")[0].innerHTML = aid;
	function add_chk_list(list){
		for(i=list.length-1; i>=0;i--){
			append = '<tr>'
			append += '<td id="td_list'+i+'">'+list[i]+'</td><td><input type="checkbox" id="check_list_id'+i+'"></td>'
			append += '<td><button class="btn btn-success" value="'+list[i]+'"id="chk_list_solve'+i+'">Inform</button>'
			append += '</tr>'
			$('#chk_list').append(append);
			$('#chk_list_solve'+i).click(function(e){
				e.preventDefault();
				var value = $(this).val();
				$.ajax({
					url:'../utils/get_accident_types.php',
					method:'POST',
					success:function(res){
						res=jQuery.parseJSON(res);
						for(var i=0;i<res.length;i++){
							if (res[i].name == value) {
								if (value=="Camera" && res[i].action=="cctvWindow.html") {
									var distance_vms=0,distance_cctv=0,vms_ip="",cctv_ip="",vms_scn="",cctv_scn="";
									nor=$('#add_northing')[0].innerHTML;
									eas=$('#add_easting')[0].innerHTML;
									$.ajax({
							        	url: '../utils/cctv_devices.php',
							        	success: function(result) {
											var devices_set = jQuery.parseJSON(result);
											for(i=devices_set.length-1; i>=0;i--){
												lat = devices_set[i].Northing
												lng= devices_set[i].Easting
												//console.log(getHaversineDist(lat,lng,nor,eas));
												if (distance_cctv == 0 || distance_cctv > getHaversineDist(lat,lng,nor,eas)) {
													distance_cctv = getHaversineDist(lat,lng,nor,eas);
													cctv_ip = devices_set[i].IPAddress;
													cctv_scn = devices_set[i].SystemCodeNumber;
												}
											}
											//console.log(distance_cctv+":::"+cctv_ip+":::"+cctv_scn+":::"+port);
											url = "../html/cctvWindow.html?ip="+cctv_ip;
										  	window.open(url,'_blank');
							        	}
							        });

								}
								else if (value=="VMS" && res[i].action=="vms_display_msg.html"){
							        var distance_vms=0,distance_cctv=0,vms_ip="",cctv_ip="",vms_scn="",cctv_scn="";
									nor=$('#add_northing')[0].innerHTML;
									eas=$('#add_easting')[0].innerHTML;
									$.ajax({
							        	url: '../utils/vms_devices.php',
							        	success: function(result) {
											var devices_set = jQuery.parseJSON(result);
											for(i=devices_set.length-1; i>=0;i--){
												lat = devices_set[i].Northing;
												lng= devices_set[i].Easting;
												//console.log(getHaversineDist(lat,lng,nor,eas));
												if (distance_vms == 0 || distance_vms > getHaversineDist(lat,lng,nor,eas)) {
													distance_vms = getHaversineDist(lat,lng,nor,eas);
													vms_ip = devices_set[i].IPAddress;
													vms_scn = devices_set[i].SystemCodeNumber;
												}
											}
											//console.log(distance_vms+":::"+vms_ip+":::"+vms_scn);
											url = "../html/vms_display_msg.html?vms_scn="+vms_scn;
										  	window.open(url,'_blank');
							        	}
							        });

								}
								else{
									alert("Call "+res[i].action);
								}
							}
						}
					}
				});
			});
		}
		//
		function solve(name){
			console.log(name);
		}

	}
	//
	$('#chklistModal').modal({
	    backdrop: 'static',
	    keyboard: false
	})
	$("#chklistModal").modal();

}

//Capitalize
String.prototype.capitalize = function() {
    return this.replace(/(?:^|\s)\S/g, function(a) { return a.toUpperCase(); });
};
//
//Haversine Distance
function getHaversineDist(lat1,lon1,lat2,lon2) {
  var R = 6371; // Radius of the earth in km
  var dLat = deg2rad(lat2-lat1);  // deg2rad below
  var dLon = deg2rad(lon2-lon1); 
  var a = 
    Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
    Math.sin(dLon/2) * Math.sin(dLon/2)
    ; 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
  var d = R * c; // Distance in km
  return d;
}
//Degree to Radian Conversion // Haversine
function deg2rad(deg) {
  return deg * (Math.PI/180)
}


})