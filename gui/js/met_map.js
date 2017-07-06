$(document).ready(function(){
	var map = L.map('met_map').setView([24.379311, 88.041001], 13);
    $.ajax({
		url: '../utils/met_map.php',
		success: function(result_met){
			var devices_set_met = jQuery.parseJSON(result_met);
			markers_array = []
			for(i=0; i<devices_set_met.length;i++){
				var fault = devices_set_met[i].online;
				if(fault === "1"){
					var myIcon_met = L.icon({iconUrl: '../images/metOn.png',iconSize:[50,33],iconAnchor:[25,16]});
				} else if(fault === "0"){
					var myIcon_met = L.icon({iconUrl: '../images/metOff.png',iconSize:[50,33],iconAnchor:[25,16]});
				}
				markers_array.push(new L.marker([devices_set_met[i].Northing,devices_set_met[i].Easting]))
				marker = new L.marker([devices_set_met[i].Northing,devices_set_met[i].Easting],{icon: myIcon_met}).bindPopup('<a href="../html/met_live.html">'+devices_set_met[i].SystemCodeNumber+'</a>').addTo(map);
				//if you want you can edit the bindPopup() to show what ever data you want on popup.
			}
			var markers_group_met = new L.featureGroup(markers_array);
			map.fitBounds(markers_group_met.getBounds().pad(0.05));
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
