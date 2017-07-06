$(document).ready(function(){
	fetch_vmsraw = function(){
				$('#vms_raw').empty();
                $.ajax({
                	url: '../utils/vms_raw.php',
                	success: function(result) {
						var raw_set = jQuery.parseJSON(result);
						for(i=raw_set.length-1; i>=0;i--){
							append = '<tr>'
							append += '<td>'+raw_set[i].SystemCodeNumber+'</td>'
							append += '<td>'+raw_set[i].slide+'</td>'
							//append += '<td>'+raw_set[i].MsgId+'</td>'
							append += '<td>'+raw_set[i].MsgTxt+'</td>'
							append += '<td>'+raw_set[i].time+'</td>'
							append += '<td>'+raw_set[i].LastUpdated +'</td>'
							append += '</tr>'
							$('#vms_raw').append(append);
						}
                	}
                });
        }
    fetch_vmsraw();
    var timeout = setTimeout("location.reload(true);",300000);
});
