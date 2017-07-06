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
		var port = $("input[type='radio'][name='mds']:checked").parent().parent().children()[8].innerHTML
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
	var port=$('#port_modal').val();
	//var deletionDate=$('#deletionDate_modal').val();
	//var qualityStatementID=$('#qualityStatementID_modal').val();
	$.ajax({
		url: '../utils/edit_vms_device.php',
		data :{scn:scn,shortDescription:shortDescription,latitude:latitude,longitude:longitude,place:place,ipAddress:ipAddress,port:port},
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
				url: '../utils/del_vms_device.php',
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

function deleteMessage() {
	try{
		var scn = $("input[type='radio'][name='mds']:checked").parent().parent().children()[1].innerHTML
		var slide = $("input[type='radio'][name='mds']:checked").parent().parent().children()[2].innerHTML
		
		$.ajax({
            url: '../utils/get_username.php',
            success: function(result_username) {
				var username = result_username;
				$.ajax({
					url: '../utils/del_vms_message.php',
					data :{scn:scn,slide:slide.trim(),username:username},
					type: 'POST',
					success: function(result) {
						if(result.length == 2){
							alert("Connection Error please try again");
						}
						else{
							alert("Deleted the Message Entry Succesfully");
							fetch_messages();
						}
					}
		        });
			}
        });
	}
	catch(e){
		alert("Please select a message to delete")
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
			var port=$('#port').val();
			//var deletionDate=$('#deletionDate').val();
			//var qualityStatementID=$('#qualityStatementID').val();
			$.ajax({
				url: '../utils/add_vms_device.php',
				data :{scn:scn,shortDescription:shortDescription,latitude:latitude,longitude:longitude,place:place,ipAddress:ipAddress,port:port},
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
				$.ajax({
					url: '../utils/createreport_vms.php',
					data :{fromDate:formatted_fromDate,toDate:formatted_toDate,timerange:timerange},
					type: 'POST',
					success: function(result) {
						if(result.length == 2){
							alert("Connection Error please try again");
						}
						else{
							json_to_csv(result, "VMS Report", true,fromDate,toDate,timerange);
						}
					}
            	});
			}
        }
        $("#createReport").click(function() {
                create_report();
        });
		
});

function json_to_csv(json_data, title, label, fromDate, toDate, timerange) {
    //Json  Parser
    var arr_data = JSON.parse(json_data);
    var csv = '';    
    
    //Title of the csv file, utilize it if needed 
    //csv += title + '\r\n\n';
    
    // column labels extraction
    if (label) {
        var row = "";
        for (var index in arr_data[0]) {
            row += index + ',';
        }
        row = row.slice(0, -1);
        //new line
        csv += row + '\r\n';
    }

    //Traffic data extraction
    for (var i = 0; i < arr_data.length; i++) {
        var row = "";        
        for (var index in arr_data[i]) {
            row += '"' + arr_data[i][index] + '",';
        }
        row.slice(0, row.length - 1);
        //add a line break after each row
        csv += row + '\r\n';
    }

    if (csv == '') {        
        alert("No data found");
        return;
    }   
    
    // file name declaration change accordingly
    var file_name = "vms_report_"+fromDate+"_"+toDate+"_"+timerange;  
    var uri = 'data:text/csv;charset=utf-8,' + escape(csv);    
    var link = document.createElement("a");    
    link.href = uri;
    link.style = "visibility:hidden";
    link.download = file_name + ".csv";    
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}