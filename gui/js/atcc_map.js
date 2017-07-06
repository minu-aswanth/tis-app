$(document).ready(function(){
	var map = L.map('atcc_map').setView([24.379311, 88.041001], 13);
    $.ajax({
		url: '../utils/atcc_map.php',
		success: function(result_atcc){
			var devices_set_atcc = jQuery.parseJSON(result_atcc);
			markers_array = []
			for(i=0; i<devices_set_atcc.length;i++){
				var fault = devices_set_atcc[i].online;
				if(fault === "1"){
					var myIcon_atcc = L.icon({iconUrl: '../images/atccOn.png',iconSize:[50,40],iconAnchor:[12.5,30]});
				} else if(fault === "0"){
					var myIcon_atcc = L.icon({iconUrl: '../images/atccOff.png',iconSize:[50,40],iconAnchor:[12.5,30]});
				}
				markers_array.push(new L.marker([devices_set_atcc[i].Northing,devices_set_atcc[i].Easting]))
				marker = new L.marker([devices_set_atcc[i].Northing,devices_set_atcc[i].Easting],{icon: myIcon_atcc}).bindPopup('<a href="../html/atcc_live.html">'+devices_set_atcc[i].SystemCodeNumber+'</a>').addTo(map);
				//if you want you can edit the bindPopup() to show what ever data you want on popup.
			}
			var markers_group_atcc = new L.featureGroup(markers_array);
			map.fitBounds(markers_group_atcc.getBounds().pad(0.05));
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
