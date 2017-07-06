function openModal(){
	$("#myModal").modal();
}
function openEditModal() {
	try{
		var scn = $("input[type='radio'][name='mds']:checked").parent().parent().children()[1].innerHTML
		var lat = $("input[type='radio'][name='mds']:checked").parent().parent().children()[2].innerHTML
		var lng = $("input[type='radio'][name='mds']:checked").parent().parent().children()[3].innerHTML
		var place = $("input[type='radio'][name='mds']:checked").parent().parent().children()[4].innerHTML
		var ip = $("input[type='radio'][name='mds']:checked").parent().parent().children()[5].innerHTML
		$("#editModal").modal();
		$(".modal-body #scn_modal")[0].innerHTML = scn
		$(".modal-body #latitude_modal").val(lat)
		$(".modal-body #longitude_modal").val(lng)
		$(".modal-body #place_modal").val(place)
		$(".modal-body #ipAddress_modal").val(ip)
	}
	catch(e){
		alert("Please select a device to edit")
	}
}

function editRow(){
	var scn=$('#scn_modal')[0].innerHTML;
	var latitude=$('#latitude_modal').val();
	var longitude=$('#longitude_modal').val();
	var place=$('#place_modal').val();
	var ipAddress=$('#ipAddress_modal').val();
	$.ajax({
		url: '../utils/edit_ecb_device.php',
		data :{scn:scn,latitude:latitude,longitude:longitude,place:place,ipAddress:ipAddress},
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
		var scn = $("input[type='radio'][name='mds']:checked").parent().parent().children()[1].innerHTML
		$.ajax({
				url: '../utils/del_ecb_device.php',
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

		$.ajax({
	        url: '../utils/nms_ecb_devices.php',
	        success: function(result) {
	            if(result.length == 2){
	                alert("Connection Error please try again");
	            }
	            else{
	                var scns = JSON.parse(result);
	                $("#ecb_device_chainage").append('<option>All</option>');
	                for(i=0;i<scns.length;i++){
	                    $("#ecb_device_chainage").append('<option>'+scns[i].mst_chainage+'</option>');
	                }
	            }
	        }
	    });


        fetchdata = function(){
            var scn=$('#scn').val();
			var latitude=$('#latitude').val();
			var longitude=$('#longitude').val();
			var place=$('#place').val();
			var ipAddress=$('#ipAddress').val();
			$.ajax({
				url: '../utils/add_ecb_device.php',
				data :{scn:scn,latitude:latitude,longitude:longitude,place:place,ipAddress:ipAddress},
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

	pagenation = function(page_number){
        
        $('#searchResult').empty();
		var header = '<tr><td bgcolor="#993232"><font color="white">Call ID</td><td bgcolor="#993232"><font color="white">Start Time</td><td bgcolor="#993232"><font color="white">End Time</td><td bgcolor="#993232"><font color="white">Caller ID</td><td bgcolor="#993232"><font color="white">Call Type</td><td bgcolor="#993232"><font color="white">Dial Number</td><td bgcolor="#993232"><font color="white">ECB Device</td><td bgcolor="#993232"><font color="white">Call Status</td><td bgcolor="#993232"><font color="white">Call Duration</td><td bgcolor="#993232"><font color="white">Call Recording</td><td bgcolor="#993232"><font color="white">Ticket Subject</td><td bgcolor="#993232"><font color="white">Ticket Status</td><td bgcolor="#993232"><font color="white">Ticket Reason</td><td bgcolor="#993232"><font color="white">Ticket Closed Date</td></tr>';
		$('#searchResult').append(header);
		if(document.getElementById("des").checked == true){
	        initial_value = Math.min(page_number*10, data_queried.length-1);
            for(i=(page_number-1)*10; i<=initial_value;i++){
	            
	        	if(!(data_queried[data_queried.length-1-i].call_recording == "no record" || data_queried[data_queried.length-1-i].call_recording === null)){
					var recording = data_queried[data_queried.length-1-i].call_recording;//.substring(44);
					var path = "/callrecord/"
					var url_path = path.concat(recording);
				}
				append = '<tr>'
				append += '<td>'+data_queried[data_queried.length-1-i].call_id+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].start_time+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].end_time+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].callerid+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].calltype+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].dial_number+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].mst_chainage+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].call_status+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].Call_duration+'</td>'
				append += '<td><a href="'+url_path+'" target="_blank"><img src="../images/play.png"></a></td>'
				append += '<td>'+data_queried[data_queried.length-1-i].tkt_subject+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].tkt_status+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].tkt_reason+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].tkt_closed_date+'</td>'
				append += '</tr>'
				
				$('#searchResult').append(append);
				
	        }
	    }
	    else{
	    	initial_value = Math.min(page_number*10, data_queried.length-1);
            for(i=(page_number-1)*10; i<=initial_value;i++){
	            
	        	if(!(data_queried[i].call_recording == "no record" || data_queried[i].call_recording === null)){
					var recording = data_queried[i].call_recording;//.substring(44);
					var path = "/callrecord/"
					var url_path = path.concat(recording);
				}
				append = '<tr>'
				append += '<td>'+data_queried[i].call_id+'</td>'
				append += '<td>'+data_queried[i].start_time+'</td>'
				append += '<td>'+data_queried[i].end_time+'</td>'
				append += '<td>'+data_queried[i].callerid+'</td>'
				append += '<td>'+data_queried[i].calltype+'</td>'
				append += '<td>'+data_queried[i].dial_number+'</td>'
				append += '<td>'+data_queried[i].mst_chainage+'</td>'
				append += '<td>'+data_queried[i].call_status+'</td>'
				append += '<td>'+data_queried[i].Call_duration+'</td>'
				append += '<td><a href="'+url_path+'" target="_blank"><img src="../images/play.png"></a></td>'
				append += '<td>'+data_queried[i].tkt_subject+'</td>'
				append += '<td>'+data_queried[i].tkt_status+'</td>'
				append += '<td>'+data_queried[i].tkt_reason+'</td>'
				append += '<td>'+data_queried[i].tkt_closed_date+'</td>'
				append += '</tr>'
				
				$('#searchResult').append(append);
				
	        }
	    }
        append = '<tr>'
        append += '<td colspan"12">&nbsp</td>';
        append += '</tr>'
        var max_value = Math.min(page_number+9, Math.ceil(data_queried.length/10));
        max_value = Math.min(page_number+5, max_value);
        if(page_number-4>0){
            var min_value = page_number-4;
        }else{
            var min_value = 1;
        }
        if(max_value-min_value<10){
            max_value = min_value+9;
        }
        if(max_value>Math.ceil(data_queried.length/10)){
            max_value=Math.ceil(data_queried.length/10);
            min_value = max_value-9;
            if (min_value < 1) min_value = 1;
        }
        $('#searchResult').append(append);
        var buttons_numbers = [];
        for(i=min_value;i<=max_value;i++){
            buttons_numbers.push(i);
        }
        add_buttons(buttons_numbers, page_number);
    }
    add_buttons = function(buttons_number, page_number){
        append = '<tr>'
        append += '<td colspan="12">';
        append += '<ul id="data_nav" class="pagination pagination-md">'
        if(page_number==1){
            append +=  '<li class="disabled"><a style="cursor: pointer" onclick=pagenation(1)>First</a></li>';
            append +=  '<li class="disabled"><a style="cursor: pointer" onclick=pagenation(1)><<</a></li>';
            append +=  '<li class="disabled"><a style="cursor: pointer" onclick=pagenation(1)><</a></li>';
        }
        else{
            append +=  '<li><a onclick=pagenation(1)>First</a></li>';
            if(page_number-10 < 1){
            	append +=  '<li><a onclick=pagenation(1)><<</a></li>';
            }else{
            	append +=  '<li><a style="cursor: pointer" onclick=pagenation('+(page_number-10)+')><<</a></li>';	
            }
            append +=  '<li><a style="cursor: pointer" onclick=pagenation('+(page_number-1)+')><</a></li>';
        }
        for(i=0; i<buttons_number.length;i++){
            if(buttons_number[i] == page_number){
                append +=  '<li class="active"><a onclick=pagenation('+buttons_number[i]+')>'+buttons_number[i]+'</a></li>';
            }
            else{
                append +=  '<li><a style="cursor: pointer" onclick=pagenation('+buttons_number[i]+')>'+buttons_number[i]+'</a></li>';
            }
        }
        if(page_number==Math.ceil(data_queried.length/10)){
            append +=  '<li class="disabled"><a style="cursor: pointer" onclick=pagenation('+(page_number)+')>></a></li>';
            append +=  '<li class="disabled"><a style="cursor: pointer" onclick=pagenation('+(page_number)+')>>></a></li>';
            append +=  '<li class="disabled"><a style="cursor: pointer" onclick=pagenation('+Math.ceil(data_queried.length/10)+')>Last</a></li>';
        }
        else{
            append +=  '<li><a style="cursor: pointer" onclick=pagenation('+(page_number+1)+')>></a></li>';
            if(page_number+10 > Math.ceil(data_queried.length/10)){
            	append +=  '<li><a style="cursor: pointer" onclick=pagenation('+Math.ceil(data_queried.length/10)+')>>></a></li>';	
            }else{
            	append +=  '<li><a style="cursor: pointer" onclick=pagenation('+(page_number+10)+')>>></a></li>';	
            }
            append +=  '<li><a style="cursor: pointer" onclick=pagenation('+Math.ceil(data_queried.length/10)+')>Last</a></li>';
        }
        append += '</ul></td></tr>'
        $('#searchResult').append(append);
        
    }

    create_report = function(){
        var startDate=$('#startDate').val();
        var endDate=$('#endDate').val();
        var fromTime=$('#fromTime').val();
        var toTime=$('#toTime').val();
        if(startDate == ""){
			alert("Please Enter Start Date");
			return;
		}
		if(endDate == ""){
			alert("Please Enter End Date");
			return;
		}
		 if(fromTime == ""){
            fromTime = "00:00:00"
        }
        if(toTime == ""){
            toTime = "23:59:59"
        }
		var callType=$("#callType :selected").val();
		var dialNumber=$('#dialNumber').val();
		var callerID=$('#callerID').val();
		var device = document.getElementById("ecb_device_chainage").options[document.getElementById("ecb_device_chainage").selectedIndex].text;
		var callStatus=$("#callStatus :selected").val();
		var tktSubject=$('#tktSubject').val();
		var tktStatus=$("#tktStatus :selected").val();
		
		formatted_startDate = startDate.substr(startDate.lastIndexOf("-")+1,startDate.length) + "-" + startDate.substr(startDate.indexOf("-")+1,startDate.lastIndexOf("-")-3)+ "-" + startDate.substr(0,startDate.indexOf("-")) + " " + fromTime;
		formatted_endDate = endDate.substr(endDate.lastIndexOf("-")+1,endDate.length) + "-" + endDate.substr(endDate.indexOf("-")+1,endDate.lastIndexOf("-")-3)+ "-" + endDate.substr(0,endDate.indexOf("-")) + " " + toTime;	

		if(formatted_startDate > formatted_endDate){
			alert("From Date should be less than To Date");
			return;
		}
		else{
			$.ajax({
				url: '../utils/createreport_ecb.php',
				data :{formatted_startDate:formatted_startDate,formatted_endDate:formatted_endDate,callType:callType,dialNumber:dialNumber,callerID:callerID,device:device,callStatus:callStatus,tktSubject:tktSubject,tktStatus:tktStatus},
				type: 'POST',
				success: function(result) {
					if(result.length == 2){
						alert("Connection Error please try again");
					}
					else{
						var devices_set = jQuery.parseJSON(result);
						
						data_queried = jQuery.parseJSON(result);
						pagenation(1);
						
					}
				}
        	});
		}
	}
    $("#createReport").click(function() {
            create_report();
    });
});



$(document).ready(function(){
    download_report = function(){
    	var startDate=$('#startDate').val();
        var endDate=$('#endDate').val();
        var fromTime=$('#fromTime').val();
        var toTime=$('#toTime').val();
        if(startDate == ""){
			alert("Please Enter Start Date");
			return;
		}
		if(endDate == ""){
			alert("Please Enter End Date");
			return;
		}
		if(fromTime == ""){
            fromTime = "00:00:00"
        }
        if(toTime == ""){
            toTime = "23:59:59"
        }
		var callType=$("#callType :selected").val();
		var dialNumber=$('#dialNumber').val();
		var callerID=$('#callerID').val();
		var device = document.getElementById("ecb_device_chainage").options[document.getElementById("ecb_device_chainage").selectedIndex].text;
		var callStatus=$("#callStatus :selected").val();
		var tktSubject=$('#tktSubject').val();
		var tktStatus=$("#tktStatus :selected").val();

		formatted_startDate = startDate.substr(startDate.lastIndexOf("-")+1,startDate.length) + "-" + startDate.substr(startDate.indexOf("-")+1,startDate.lastIndexOf("-")-3)+ "-" + startDate.substr(0,startDate.indexOf("-")) + " " + fromTime;
		formatted_endDate = endDate.substr(endDate.lastIndexOf("-")+1,endDate.length) + "-" + endDate.substr(endDate.indexOf("-")+1,endDate.lastIndexOf("-")-3)+ "-" + endDate.substr(0,endDate.indexOf("-")) + " " + toTime;
		
		if(formatted_startDate > formatted_endDate){
			alert("From Date should be less than To Date");
			return;
		}
		else{
			$.ajax({
				url: '../utils/createreport_ecb.php',
				data :{formatted_startDate:formatted_startDate,formatted_endDate:formatted_endDate,callType:callType,dialNumber:dialNumber,callerID:callerID,device:device,callStatus:callStatus,tktSubject:tktSubject,tktStatus:tktStatus},
				type: 'POST',
				success: function(result) {
					if(result.length == 2){
						alert("Connection Error please try again");
					}
					else{
						json_to_csv(result, "ECB Report", true,startDate,endDate);
					}
				}
        	});
		}
	}
    $("#downloadReport").click(function() {
            download_report();
    });
});




$(document).ready(function(){
        download_pdf = function(){
            var startDate=$('#startDate').val();
	        var endDate=$('#endDate').val();
	        var fromTime=$('#fromTime').val();
        	var toTime=$('#toTime').val();
	        if(startDate == ""){
				alert("Please Enter Start Date");
				return;
			}
			if(endDate == ""){
				alert("Please Enter End Date");
				return;
			}
			if(fromTime == ""){
            	fromTime = "00:00:00"
	        }
	        if(toTime == ""){
	            toTime = "23:59:59"
	        }
			var callType=$("#callType :selected").val();
			var dialNumber=$('#dialNumber').val();
			var callerID=$('#callerID').val();
			var device = document.getElementById("ecb_device_chainage").options[document.getElementById("ecb_device_chainage").selectedIndex].text;
			var callStatus=$("#callStatus :selected").val();
			var tktSubject=$('#tktSubject').val();
			var tktStatus=$("#tktStatus :selected").val();

			formatted_startDate = startDate.substr(startDate.lastIndexOf("-")+1,startDate.length) + "-" + startDate.substr(startDate.indexOf("-")+1,startDate.lastIndexOf("-")-3)+ "-" + startDate.substr(0,startDate.indexOf("-")) + " " + fromTime;
			formatted_endDate = endDate.substr(endDate.lastIndexOf("-")+1,endDate.length) + "-" + endDate.substr(endDate.indexOf("-")+1,endDate.lastIndexOf("-")-3)+ "-" + endDate.substr(0,endDate.indexOf("-")) + " " + toTime;
			
			if(formatted_startDate > formatted_endDate){
				alert("From Date should be less than To Date");
				return;
			}
			else{
				$.ajax({
		               url: '../utils/get_username.php',
		               success: function(result_username) {
							var username = result_username;
							//window.location = "../utils/createreport_ecb_pdf.php?fromDate=" + formatted_startDate +"&toDate=" + formatted_endDate + "&username="+username + "&callType="+callType + "&dialNumber="+dialNumber + "&callerID="+callerID + "&device="+device + "&callStatus="+callStatus + "&tktSubject="+tktSubject + "&tktStatus="+tktStatus
							window.open("../utils/createreport_ecb_pdf.php?fromDate=" + formatted_startDate +"&toDate=" + formatted_endDate + "&username="+username + "&callType="+callType + "&dialNumber="+dialNumber + "&callerID="+callerID + "&device="+device + "&callStatus="+callStatus + "&tktSubject="+tktSubject + "&tktStatus="+tktStatus,'_blank');
						}
	            });
			}
		}
       $("#downloadPDF").click(function() {
               download_pdf();
       });
});





function json_to_csv(json_data, title, label, fromDate, toDate) {
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
    if(document.getElementById("des").checked == true){
	    for (var i = arr_data.length; i >= 0; i--) {
	        var row = "";        
	        for (var index in arr_data[i]) {
	            row += '"' + arr_data[i][index] + '",';
	        }
	        row.slice(0, row.length - 1);
	        //add a line break after each row
	        csv += row + '\r\n';
	    }
	}
	else{
		for (var i = 0; i < arr_data.length; i++) {
	        var row = "";        
	        for (var index in arr_data[i]) {
	            row += '"' + arr_data[i][index] + '",';
	        }
	        row.slice(0, row.length - 1);
	        //add a line break after each row
	        csv += row + '\r\n';
	    }
	}

    if (csv == '') {        
        alert("No data found");
        return;
    }   
    
    // file name declaration change accordingly
    var file_name = "ecb_report_"+fromDate+"_"+toDate;  
    var uri = 'data:text/csv;charset=utf-8,' + escape(csv);    
    var link = document.createElement("a");    
    link.href = uri;
    link.style = "visibility:hidden";
    link.download = file_name + ".csv";    
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}