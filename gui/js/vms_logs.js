$(document).ready(function(){
	$.ajax({
		url: '../utils/get_vms_scns.php',
		success: function(result) {
			if(result.length == 2){
				alert("Connection Error please try again");
			}
			else{
				var scns = JSON.parse(result);
				$("#vms_devices").append('<option value="All">All Devices</option>');
				for(i=0;i<scns.length;i++){
					$("#vms_devices").append('<option value="'+scns[i].SystemCodeNumber+'">'+scns[i].SystemCodeNumber+'</option>');
				}
			}
		}
    });
});


function disableInput(){

	var param = document.getElementById("createdBy").options[document.getElementById("createdBy").selectedIndex].text;

	if(param == "Manual"){
		document.getElementById("username").removeAttribute("disabled");
	} else {
		document.getElementById("username").setAttribute("disabled", true);
	}

}


$(document).ready(function(){

	pagenation = function(page_number){
        $('#searchResult').empty();
        var header = '<tr><td bgcolor="#993232"><font color="white">Status</td><td bgcolor="#993232"><font color="white">SCN</td><td bgcolor="#993232" align="center"><font color="white">Slide</td><td bgcolor="#993232" align="center"><font color="white">Message Text</td><td bgcolor="#993232" align="center"><font color="white">Time</td><td bgcolor="#993232"><font color="white">Created By</td><td bgcolor="#993232"><font color="white">Deleted By</td><td bgcolor="#993232"><font color="white">Created On</td><td bgcolor="#993232"><font color="white">Updated On</td><td bgcolor="#993232"><font color="white">Deleted On</td></tr>';
        $('#searchResult').append(header);
        if(document.getElementById("des").checked == true){
	        initial_value = Math.min(page_number*10, data_queried.length-1);
            for(i=(page_number-1)*10; i<=initial_value;i++){
	            
	        	var status=null;
				if(data_queried[data_queried.length-1-i].active == 1){
					status = "Active";
				} else status = "Removed";

				var deletionUser=data_queried[data_queried.length-1-i].deletionUser;
				if(deletionUser == null){
					deletionUser = '-';
				}

				var deletionTime=data_queried[data_queried.length-1-i].DeletionTime;
				if(deletionTime == null){
					deletionTime = '-';
				}

				append = '<tr>'
				append += '<td>'+status+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].SystemCodeNumber+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].slide+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].MessageText+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].time+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].creationUser+'</td>'
				append += '<td>'+deletionUser+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].CreationTime+'</td>'
				append += '<td>'+data_queried[data_queried.length-1-i].UpdationTime+'</td>'
				append += '<td>'+deletionTime+'</td>'
				append += '</tr>'
				
				$('#searchResult').append(append);
	        }
	    }
	    else{
	    	initial_value = Math.min(page_number*10, data_queried.length-1);
            for(i=(page_number-1)*10; i<=initial_value;i++){
	            
	        	var status=null;
				if(data_queried[i].active == 1){
					status = "Active";
				} else status = "Removed";

				var deletionUser=data_queried[i].deletionUser;
				if(deletionUser == null){
					deletionUser = '-';
				}

				var deletionTime=data_queried[i].DeletionTime;
				if(deletionTime == null){
					deletionTime = '-';
				}

				append = '<tr>'
				append += '<td>'+status+'</td>'
				append += '<td>'+data_queried[i].SystemCodeNumber+'</td>'
				append += '<td>'+data_queried[i].slide+'</td>'
				append += '<td>'+data_queried[i].MessageText+'</td>'
				append += '<td>'+data_queried[i].time+'</td>'
				append += '<td>'+data_queried[i].creationUser+'</td>'
				append += '<td>'+deletionUser+'</td>'
				append += '<td>'+data_queried[i].CreationTime+'</td>'
				append += '<td>'+data_queried[i].UpdationTime+'</td>'
				append += '<td>'+deletionTime+'</td>'
				append += '</tr>'
				
				$('#searchResult').append(append);
	        }
	    }
        append = '<tr>'
        append += '<td colspan"7">&nbsp</td>';
        //<td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>'
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
        append = '<tr><td>&nbsp</td><td  colspan="9">'

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
	    var fromDate=$('#startDate').val();
	    var toDate=$('#endDate').val();
	    var fromTime=$('#fromTime').val();
        var toTime=$('#toTime').val();
        if(fromDate == ""){
			alert("Please Enter From Date");
			return;
		}
		if(toDate == ""){
			alert("Please Enter To Date");
			return;
		}
		if(fromTime == ""){
            fromTime = "00:00:00"
        }
        if(toTime == ""){
            toTime = "23:59:59"
        }
		var status=$("#status :selected").val();
		var scn=$("#vms_devices :selected").val();
		var slide=$("#slide :selected").val();
		var createdBy=$("#createdBy :selected").val();
		var username=$('#username').val();

		formatted_fromDate = fromDate.substr(fromDate.lastIndexOf("-")+1,fromDate.length) + "-" + fromDate.substr(fromDate.indexOf("-")+1,fromDate.lastIndexOf("-")-3)+ "-" + fromDate.substr(0,fromDate.indexOf("-")) + " "+ fromTime;
        formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-")) + " " + toTime;
        if(formatted_fromDate > formatted_toDate){
			alert("From Date should be less than To Date");
			return;
		}
		else{
			
			$.ajax({
				url: '../utils/createreport_vms.php',
				data :{fromDate:formatted_fromDate,toDate:formatted_toDate,status:status,scn:scn,slide:slide,createdBy:createdBy,username:username},
				type: 'POST',
				success: function(result) {
					if(result.length == 2){
						alert("Connection Error please try again");
					}
					else{
						var devices_set = jQuery.parseJSON(result);
						var count = 0;
						if(devices_set.length != 0){
							data_queried = jQuery.parseJSON(result);
                            pagenation(1);
						}else{
							$('#searchResult').empty();
							append = '<tr><td colspan=10>No results</td></tr>'
							$('#searchResult').append(append);
						}
						
					}
				}
	    	});
		}
	}

	create_reportOnLoad = function(){
        
		var status=1;
		var scn='All';
		var slide='All';
		var createdBy='All';
		var username='All';

		var formatted_fromDate;
		var formatted_toDate;
		
		$.ajax({
			url: '../utils/createreport_vms.php',
			data :{fromDate:formatted_fromDate,toDate:formatted_toDate,status:status,scn:scn,slide:slide,createdBy:createdBy,username:username},
			type: 'POST',
			success: function(result) {
				if(result.length == 2){
					alert("Connection Error please try again");
				}
				else{
					var devices_set = jQuery.parseJSON(result);
					var count = 0;
					if(devices_set.length != 0){
						data_queried = jQuery.parseJSON(result);
                        pagenation(1);
					}
					
				}
			}
    	});
	}


    $("#createReport").click(function() {
            create_report();
    });
    create_reportOnLoad();
});


$(document).ready(function(){
    download_report = function(){

    	var downloadPermission = false;

    	$.ajax({
            url: '../utils/get_roles.php',
            success: function(result) {
				var id_set = jQuery.parseJSON(result);
				/*for(i=0; i<id_set.length;i++){
					if((id_set[i].role.indexOf("Manager") > -1) || (id_set[i].role.indexOf("Admin") > -1)){
						downloadPermission = true;
					}
						
				}*/
				downloadPermission = true;

				if(downloadPermission){

					var fromDate=$('#startDate').val();
				    var toDate=$('#endDate').val();
				    var fromTime=$('#fromTime').val();
			        var toTime=$('#toTime').val();
			        if(fromDate == ""){
						alert("Please Enter From Date");
						return;
					}
					if(toDate == ""){
						alert("Please Enter To Date");
						return;
					}
					if(fromTime == ""){
			            fromTime = "00:00:00"
			        }
			        if(toTime == ""){
			            toTime = "23:59:59"
			        }
					var status=$("#status :selected").val();
					var scn=$("#vms_devices :selected").val();
					var slide=$("#slide :selected").val();
					var createdBy=$("#createdBy :selected").val();
					var username=$('#username').val();

					formatted_fromDate = fromDate.substr(fromDate.lastIndexOf("-")+1,fromDate.length) + "-" + fromDate.substr(fromDate.indexOf("-")+1,fromDate.lastIndexOf("-")-3)+ "-" + fromDate.substr(0,fromDate.indexOf("-")) + " "+ fromTime;
			        formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-")) + " " + toTime;
			        if(formatted_fromDate > formatted_toDate){
						alert("From Date should be less than To Date");
						return;
					}
					else{
						
						$.ajax({
							url: '../utils/createreport_vms.php',
							data :{fromDate:formatted_fromDate,toDate:formatted_toDate,status:status,scn:scn,slide:slide,createdBy:createdBy,username:username},
							type: 'POST',
							success: function(result) {
								if(result.length == 2){
									alert("Connection Error please try again");
								}
								else{
									$.ajax({
					                	url: '../utils/vms_devices.php',
					                	success: function(result_devices) {

					                		$.ajax({
								                url: '../utils/get_username.php',
								                success: function(result_username) {
													var username = result_username;
													var currentdate = new Date(); 
													var ts = "Downloaded at: " + currentdate.getDate() + "/"
													                + (currentdate.getMonth()+1)  + "/" 
													                + currentdate.getFullYear() + " @ "  
													                + currentdate.getHours() + ":"  
													                + currentdate.getMinutes() + ":" 
													                + currentdate.getSeconds();

													json_to_csv(result,"VMS Report",true,fromDate,toDate,result_devices,username,ts);
												}
								            });
					                	}
					                });

								}
							}
				    	});
					}
				} else{
	            	alert("Permission denied. Please contact your administrator");
	            }
	        }
	    });
	}
    $("#downloadReport").click(function() {
            download_report();
    });
});


$(document).ready(function(){
        download_pdf = function(){
        	var downloadPermission = false;
	    	$.ajax({
	            url: '../utils/get_roles.php',
	            success: function(result) {
					var id_set = jQuery.parseJSON(result);
					/*for(i=0; i<id_set.length;i++){
						if((id_set[i].role.indexOf("Manager") > -1) || (id_set[i].role.indexOf("Admin") > -1)){
							downloadPermission = true;
						}
							
					}*/
					downloadPermission = true;

					if(downloadPermission){

						var fromDate=$('#startDate').val();
					    var toDate=$('#endDate').val();
					    var fromTime=$('#fromTime').val();
				        var toTime=$('#toTime').val();
				        if(fromDate == ""){
							alert("Please Enter From Date");
							return;
						}
						if(toDate == ""){
							alert("Please Enter To Date");
							return;
						}
						if(fromTime == ""){
				            fromTime = "00:00:00"
				        }
				        if(toTime == ""){
				            toTime = "23:59:59"
				        }
						var status=$("#status :selected").val();
						var scn=$("#vms_devices :selected").val();
						var slide=$("#slide :selected").val();
						var createdBy=$("#createdBy :selected").val();
						var username=$('#username').val();

						formatted_fromDate = fromDate.substr(fromDate.lastIndexOf("-")+1,fromDate.length) + "-" + fromDate.substr(fromDate.indexOf("-")+1,fromDate.lastIndexOf("-")-3)+ "-" + fromDate.substr(0,fromDate.indexOf("-")) + " "+ fromTime;
				        formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-")) + " " + toTime;
				        if(formatted_fromDate > formatted_toDate){
							alert("From Date should be less than To Date");
							return;
						}
						else{

							$.ajax({
				                url: '../utils/get_username.php',
				                success: function(result_username) {
									var username = result_username;
									window.open("../utils/createreport_vms_pdf.php?fromDate=" + formatted_fromDate +"&toDate=" + formatted_toDate + "&status=" + status+"&scn=" + scn+"&slide=" + slide+"&createdBy=" + createdBy+"&username="+username,'_blank');
								}
				            });
						}
					} else{
		            	alert("Permission denied. Please contact your administrator");
		            }
		        }
		    });
		}
        $("#downloadPDF").click(function() {
                download_pdf();
        });
});


function json_to_csv(json_data, title, label, fromDate, toDate, json_data_devices, username, timestamp) {
    //Json  Parser
    var arr_data = JSON.parse(json_data);
    var arr_data_devices = JSON.parse(json_data_devices);
    var csv = '';
    csv += 'Downloaded by: '+username+'\r\n';
    csv += timestamp+'\r\n\n';
    csv += 'Device Details \r\n';


    
    if (label) {
        var row = "";
        for (var index in arr_data_devices[0]) {
            row += index + ',';
        }
        row = row.slice(0, -1);
        //new line
        csv += row + '\r\n';
    }

    //Traffic data extraction
    if(document.getElementById("des").checked == true){
	    for (var i = arr_data_devices.length-1; i >= 0; i--) {
	        var row = "";        
	        for (var index in arr_data_devices[i]) {
	            row += '"' + arr_data_devices[i][index] + '",';
	        }
	        row.slice(0, row.length - 1);
	        //add a line break after each row
	        csv += row + '\r\n';
	    }
	}
	else{
		for (var i = 0; i < arr_data_devices.length; i++) {
	        var row = "";        
	        for (var index in arr_data_devices[i]) {
	            row += '"' + arr_data_devices[i][index] + '",';
	        }
	        row.slice(0, row.length - 1);
	        //add a line break after each row
	        csv += row + '\r\n';
	    }
	}
    
    //Title of the csv file, utilize it if needed 
    csv += '\r\n\n'+title + '\r\n\n';
   
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
	    for (var i = arr_data.length-1; i >= 0; i--) {
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
    var file_name = "vms_report_"+fromDate+"_"+toDate;  
    var uri = 'data:text/csv;charset=utf-8,' + escape(csv);    
    var link = document.createElement("a");    
    link.href = uri;
    link.style = "visibility:hidden";
    link.download = file_name + ".csv";    
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}