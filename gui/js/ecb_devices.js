$(document).ready(function(){
	fetch_devices = function(){
				$('#ecb_devices').empty();
                $.ajax({
                	url: '../utils/ecb_devices.php',
                	success: function(result) {
						var devices_set = jQuery.parseJSON(result);
						for(i=devices_set.length-1; i>=0;i--){
							append = '<tr>'
							append += '<td><input type="radio" name="mds"></td>'
							append += '<td>'+devices_set[i].SystemCodeNumber+'</td>'
							append += '<td>'+devices_set[i].Northing+'</td>'
							append += '<td>'+devices_set[i].Easting+'</td>'
							append += '<td>'+devices_set[i].Place+'</td>'
							append += '<td>'+devices_set[i].IPAddress+'</td>'
							append += '</tr>'
							$('#ecb_devices').append(append);
						}
                	}
                });
        }
    fetch_devices();
});
