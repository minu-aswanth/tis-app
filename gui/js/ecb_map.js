$(document).ready(function(){
	var map = L.map('ecb_map').setView([24.379311, 88.041001], 13);
    $.ajax({
		url: '../utils/ecb_map.php',
		success: function(result_ecb){
			var devices_set_ecb = jQuery.parseJSON(result_ecb);
			markers_array = []
			for(i=0; i<devices_set_ecb.length;i++){
				var fault = devices_set_ecb[i].mst_online_offline;
				if(fault === "1"){
					var myIcon_ecb = L.icon({iconUrl: '../images/ecbOn.png',iconSize:[25,30],iconAnchor:[12.5,30]});
				} else if(fault === "0"){
					var myIcon_ecb = L.icon({iconUrl: '../images/ecbOff.png',iconSize:[25,30],iconAnchor:[12.5,30]});
				}
				markers_array.push(new L.marker([devices_set_ecb[i].mst_latitude,devices_set_ecb[i].mst_longitude]))
				marker = new L.marker([devices_set_ecb[i].mst_latitude,devices_set_ecb[i].mst_longitude],{icon: myIcon_ecb}).bindPopup(devices_set_ecb[i].mst_chainage).addTo(map);
				//if you want you can edit the bindPopup() to show what ever data you want on popup.
			}
			var markers_group_ecb = new L.featureGroup(markers_array);
			map.fitBounds(markers_group_ecb.getBounds().pad(0.05));
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
