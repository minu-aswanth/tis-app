$(document).ready(function(){
	var map = L.map('vms_map').setView([24.379311, 88.041001], 13);
    $.ajax({
		url: '../utils/vms_map.php',
		success: function(result_vms){
			var devices_set_vms = jQuery.parseJSON(result_vms);
			markers_array = []
			for(i=0; i<devices_set_vms.length;i++){
				var fault = devices_set_vms[i].online;
				if(fault === "1"){
					var myIcon_vms = L.icon({iconUrl: '../images/vmsOn.png',iconSize:[37,11],iconAnchor:[18,5]});
				} else if(fault === "0"){
					var myIcon_vms = L.icon({iconUrl: '../images/vmsOff.png',iconSize:[37,11],iconAnchor:[18,5]});
				}
				markers_array.push(new L.marker([devices_set_vms[i].Northing,devices_set_vms[i].Easting]))
				marker = new L.marker([devices_set_vms[i].Northing,devices_set_vms[i].Easting],{icon:myIcon_vms}).bindPopup('<a href="../html/vms_live.html">'+devices_set_vms[i].SystemCodeNumber+'</a>').addTo(map);
				marker.on('dblclick', function(evt) {
				  alert('Dont Double click!!!');
				});
				//if you want you can edit the bindPopup() to show what ever data you want on popup.
			}
			var markers_group_vms = new L.featureGroup(markers_array);
			map.fitBounds(markers_group_vms.getBounds().pad(0.05));

		}
	});
		
	mapLink = 
    '<a href="http://openstreetmap.org">OpenStreetMap</a>';
    L.tileLayer(
            'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; ' + mapLink + ' Contributors',
            maxZoom: 18,
    }).addTo(map);

    var routingControl = L.Routing.control({
	  waypoints: [
	    L.latLng(24.117355, 88.29131),
	    L.latLng(24.663991, 87.940233)
	  ],
	  	routeWhileDragging: false,
	    autoRoute:true,
	    useZoomParameter:false,
	    draggableWaypoints:false,
	    show:false,
	    addWaypoints:false
	}).addTo(map);

	routingControl.hide();

});
