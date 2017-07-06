$(document).ready(function(){
	fetch_devices = function(){
				$('#vms_devices').empty();
                $.ajax({
                	url: '../utils/vms_devices.php',
                	success: function(result) {
						var devices_set = jQuery.parseJSON(result);
						for(i=devices_set.length-1; i>=0;i--){
							append = '<tr>'
							append += '<td><input type="radio" name="mds"></td>'
							append += '<td>'+(devices_set.length - i)+'</td>'
							append += '<td>'+devices_set[i].SystemCodeNumber+'</td>'
							append += '<td>'+devices_set[i].ShortDescription+'</td>'
							//append += '<td>'+devices_set[i].LongDescription+'</td>'
							//append += '<td>'+devices_set[i].DataSourceTypeID+'</td>'
							append += '<td>'+devices_set[i].Northing+'</td>'
							append += '<td>'+devices_set[i].Easting+'</td>'
							append += '<td>'+devices_set[i].Place+'</td>'
							append += '<td>'+devices_set[i].IPAddress+'</td>'
							append += '<td>'+devices_set[i].Port+'</td>'
							append += '<td>'+devices_set[i].CreationDate+'</td>'
							//append += '<td>'+devices_set[i].DeletionDate+'</td>'
							//append += '<td>'+devices_set[i].QualityStatementID+'</td>'
							append += '<td>'+devices_set[i].LastUpdated+'</td>'
							append += '</tr>'
							$('#vms_devices').append(append);
						}
                	}
                });
        }
    fetch_devices();
});


$(document).ready(function(){
	fetch_messages = function(){
				$('#vms_messages').empty();
                $.ajax({
                	url: '../utils/vms_messages.php',
                	success: function(result) {
						var devices_set = jQuery.parseJSON(result);
						for(i=devices_set.length-1; i>=0;i--){
							append = '<tr>'
							append += '<td><input type="radio" name="mds"></td>'
							append += '<td>'+devices_set[i].SystemCodeNumber+'</td>'
							append += '<td>'+devices_set[i].slide+'</td>'
							append += '<td>'+devices_set[i].topLineText+' '
							append += devices_set[i].midLineText+' '
							append += devices_set[i].botLineText+'</td>'
							append += '<td>'+devices_set[i].time+'</td>'
							append += '</tr>'
							$('#vms_messages').append(append);
						}
                	}
                });
        }
    fetch_messages();
});