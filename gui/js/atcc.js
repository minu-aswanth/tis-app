function openModal(){
	$("#myModal").modal();
}
/*function configRow(){
	$("#configModal").modal();
}*/

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
		url: '../utils/edit_atcc_device.php',
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
				url: '../utils/del_atcc_device.php',
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
			url: '../utils/atcc_devices.php',
			success: function(result) {
				var devices_set = jQuery.parseJSON(result);
				$('#scnATCC').append('<option value="All">All Devices</option>');
				for(i=devices_set.length-1; i>=0;i--){
					append = '<option value="'
					append += devices_set[i].SystemCodeNumber
					append += '">'
					append += devices_set[i].SystemCodeNumber
					append += '</option>'
					$('#scnATCC').append(append);
				}				
			}
	    });

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
				url: '../utils/add_atcc_device.php',
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

	pagenation = function(page_number){
        
        $('#searchResult').empty();
		var header = null;
		if(timerange == "Monthly"){
			header = '<tr><td bgcolor="#993232" rowspan="2"><font color="white">SCN</td><td bgcolor="#993232" rowspan="2"><font color="white">Year</td><td bgcolor="#993232" rowspan="2"><font color="white">Month</td><td bgcolor="#993232" rowspan="2"><font color="white">Traffic Flow</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Average Data</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Maximum Data</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Minimum Data</td></tr><tr><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td></tr>';
		} else if(timerange == "Weekly"){
			header = '<tr><td bgcolor="#993232" rowspan="2"><font color="white">SCN</td><td bgcolor="#993232" rowspan="2"><font color="white">Year</td><td bgcolor="#993232" rowspan="2"><font color="white">Week</td><td bgcolor="#993232" rowspan="2"><font color="white">Traffic Flow</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Average Data</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Maximum Data</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Minimum Data</td></tr><tr><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td></tr>';
		} else if(timerange == "Daily"){
			header = '<tr><td bgcolor="#993232" rowspan="2"><font color="white">SCN</td><td bgcolor="#993232" rowspan="2"><font color="white">Year</td><td bgcolor="#993232" rowspan="2"><font color="white">Month</td><td bgcolor="#993232" rowspan="2"><font color="white">Day</td><td bgcolor="#993232" rowspan="2"><font color="white">Traffic Flow</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Average Data</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Maximum Data</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Minimum Data</td></tr><tr><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td></tr>';
		} else if(timerange == "Hourly"){
			header = '<tr><td bgcolor="#993232" rowspan="2"><font color="white">SCN</td><td bgcolor="#993232" rowspan="2"><font color="white">Year</td><td bgcolor="#993232" rowspan="2"><font color="white">Month</td><td bgcolor="#993232" rowspan="2"><font color="white">Day</td><td bgcolor="#993232" rowspan="2"><font color="white">Hour</td><td bgcolor="#993232" rowspan="2"><font color="white">Traffic Flow</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Average Data</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Maximum Data</td><td bgcolor="#993232" colspan="2" align="center"><font color="white">Minimum Data</td></tr><tr><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td></tr>';
		} else if(timerange == "Raw_Data"){
			header = '<tr><td bgcolor="#993232"><font color="white">SCN</td><td bgcolor="#993232"><font color="white">Direction</td><td bgcolor="#993232"><font color="white">Lane</td><td bgcolor="#993232"><font color="white">Error Loop</td><td bgcolor="#993232"><font color="white">Speed</td><td bgcolor="#993232"><font color="white">Length</td><td bgcolor="#993232"><font color="white">Class</td><td bgcolor="#993232"><font color="white">No. Of Axles</td><td bgcolor="#993232"><font color="white">Timestamp</td></tr>';
		}

        $('#searchResult').append(header);
        if(document.getElementById("des").checked == true){
	        initial_value = Math.min(page_number*10, data_queried.length-1);
            for(i=(page_number-1)*10; i<=initial_value;i++){
	            
	        	if(timerange != "Raw_Data"){
					append = '<tr>'
					append += '<td>'+data_queried[data_queried.length-1-i].SCN+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Year+'</td>'
					if(timerange=="Monthly" || timerange=="Daily" || timerange=="Hourly"){
						append += '<td>'+data_queried[data_queried.length-1-i].Month+'</td>'	
						if(timerange=="Daily" || timerange=="Hourly"){
							append += '<td>'+data_queried[data_queried.length-1-i].Day+'</td>'
							if(timerange=="Hourly")	{
								append += '<td>'+data_queried[data_queried.length-1-i].Hour+'</td>'
							}
						}
					} else if(timerange=="Weekly"){
						append += '<td>'+data_queried[data_queried.length-1-i].Week+'</td>'
					} 
					append += '<td>'+data_queried[data_queried.length-1-i].Total_FLow+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Avg_Speed+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Avg_Length+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Max_Speed+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Max_Length+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Min_Speed+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Min_Length+'</td>'
					append += '</tr>'
				
				} else{
					var direction = null;
					if(data_queried[data_queried.length-1-i].TowardsToll == 1) direction = "TowardsToll";
						else direction = "FromToll";

					append = '<tr>'
					append += '<td>'+data_queried[data_queried.length-1-i].SCN+'</td>'
					append += '<td>'+direction+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Lane+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].ErrorLoop+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Speed+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].VehicleLength+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].Class+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].NumberOfAxle+'</td>'
					append += '<td>'+data_queried[data_queried.length-1-i].TimeStamp+'</td>'
					append += '</tr>'
				
				}
				
				$('#searchResult').append(append);

	        }
	    }
	    else{
	    	initial_value = Math.min(page_number*10, data_queried.length-1);
            for(i=(page_number-1)*10; i<=initial_value;i++){
	            
	        	if(timerange != "Raw_Data"){
					append = '<tr>'
					append += '<td>'+data_queried[i].SCN+'</td>'
					append += '<td>'+data_queried[i].Year+'</td>'
					if(timerange=="Monthly" || timerange=="Daily" || timerange=="Hourly"){
						append += '<td>'+data_queried[i].Month+'</td>'	
						if(timerange=="Daily" || timerange=="Hourly"){
							append += '<td>'+data_queried[i].Day+'</td>'
							if(timerange=="Hourly")	{
								append += '<td>'+data_queried[i].Hour+'</td>'
							}
						}
					} else if(timerange=="Weekly"){
						append += '<td>'+data_queried[i].Week+'</td>'
					} 
					append += '<td>'+data_queried[i].Total_FLow+'</td>'
					append += '<td>'+data_queried[i].Avg_Speed+'</td>'
					append += '<td>'+data_queried[i].Avg_Length+'</td>'
					append += '<td>'+data_queried[i].Max_Speed+'</td>'
					append += '<td>'+data_queried[i].Max_Length+'</td>'
					append += '<td>'+data_queried[i].Min_Speed+'</td>'
					append += '<td>'+data_queried[i].Min_Length+'</td>'
					append += '</tr>'
				
				} else{
					var direction = null;
					if(data_queried[i].TowardsToll == 1) direction = "TowardsToll";
						else direction = "FromToll";

					append = '<tr>'
					append += '<td>'+data_queried[i].SCN+'</td>'
					append += '<td>'+direction+'</td>'
					append += '<td>'+data_queried[i].Lane+'</td>'
					append += '<td>'+data_queried[i].ErrorLoop+'</td>'
					append += '<td>'+data_queried[i].Speed+'</td>'
					append += '<td>'+data_queried[i].VehicleLength+'</td>'
					append += '<td>'+data_queried[i].Class+'</td>'
					append += '<td>'+data_queried[i].NumberOfAxle+'</td>'
					append += '<td>'+data_queried[i].TimeStamp+'</td>'
					append += '</tr>'
				
				}
				
				$('#searchResult').append(append);

	        }
	    }
        append = '<tr>'
        append += '<td colspan"9">&nbsp</td>';
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
        append = '<tr><td colspan="9">'
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
        var fromDate=$('#from').val();
        var toDate=$('#to').val();
        timerange=$("#timerange :selected").val();
		var vClass=$("#vClass :selected").val();
		var direction=$("#direction :selected").val();
		var dayOfWeek=$("#dayOfWeek :selected").val();
		var fromTime=$('#fromTime').val();
        var toTime=$('#toTime').val();
        var scn=$('#scnATCC').val();
        var lane=$('#lane').val();
        var error=$('#error').val();

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

		formatted_fromDate = fromDate.substr(fromDate.lastIndexOf("-")+1,fromDate.length) + "-" + fromDate.substr(fromDate.indexOf("-")+1,fromDate.lastIndexOf("-")-3)+ "-" + fromDate.substr(0,fromDate.indexOf("-")) + " "+fromTime
		formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-")) + " "+toTime

		var q = new Date();
		var m = q.getMonth();
		var d = q.getDate();
		var y = q.getFullYear();
		var date = new Date(y,m,d);
		mydate=new Date(formatted_fromDate);
		
		//console.log((date-mydate)/86400000);

		if((date-mydate)/86400000 > 60){
			alert("Please use Archival Report Screen for searches before 60 days.")
			return;
		}

		if(formatted_fromDate > formatted_toDate){
			alert("From Date should be less than To Date");
			return;
		}
		else{
			$.ajax({
				url: '../utils/createreport_atcc.php',
				data :{fromDate:formatted_fromDate,toDate:formatted_toDate,timerange:timerange,vClass:vClass,direction:direction,dayOfWeek:dayOfWeek,scn:scn,lane:lane,error:error},
				type: 'POST',
				success: function(result) {
					if(result.length == 2){
						alert("Connection Error please try again");
					}
					else{
						var devices_set = jQuery.parseJSON(result);
						if(devices_set.length > 0){

							data_queried = jQuery.parseJSON(result);
							pagenation(1);
						
						}else{
                            append = '<tr>'
                            append += '<td colspan="9">No Results</td></tr>'
                            $('#searchResult').append(append);
                        }
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

						var fromDate=$('#from').val();
			            var toDate=$('#to').val();
			            var timerange=$("#timerange :selected").val();
						var vClass=$("#vClass :selected").val();
						var direction=$("#direction :selected").val();
						var dayOfWeek=$("#dayOfWeek :selected").val();
						var fromTime=$('#fromTime').val();
			            var toTime=$('#toTime').val();
			            var scn=$('#scnATCC').val();
			            var lane=$('#lane').val();
			            var error=$('#error').val();

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

						formatted_fromDate = fromDate.substr(fromDate.lastIndexOf("-")+1,fromDate.length) + "-" + fromDate.substr(fromDate.indexOf("-")+1,fromDate.lastIndexOf("-")-3)+ "-" + fromDate.substr(0,fromDate.indexOf("-")) + " "+fromTime
						formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-")) + " "+toTime

						var q = new Date();
						var m = q.getMonth();
						var d = q.getDate();
						var y = q.getFullYear();
						var date = new Date(y,m,d);
						mydate=new Date(formatted_fromDate);
						
						//console.log((date-mydate)/86400000);

						if((date-mydate)/86400000 > 60){
							alert("Please use Archival Report Screen for searches before 60 days.")
							return;
						}

						if(formatted_fromDate > formatted_toDate){
							alert("From Date should be less than To Date");
							return;
						}
						else{
							$.ajax({
								url: '../utils/createreport_atcc.php',
								data :{fromDate:formatted_fromDate,toDate:formatted_toDate,timerange:timerange,vClass:vClass,direction:direction,dayOfWeek:dayOfWeek,scn:scn,lane:lane,error:error},
								type: 'POST',
								success: function(result) {
									if(result.length == 2){
										alert("Connection Error please try again");
									}
									else{
										$.ajax({
						                	url: '../utils/atcc_devices.php',
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

														json_to_csv(result,"ATCC Report",true,fromDate,toDate,timerange,result_devices,username,ts);

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

			            var fromDate=$('#from').val();
			            var toDate=$('#to').val();
			            var timerange=$("#timerange :selected").val();
						var vClass=$("#vClass :selected").val();
						var direction=$("#direction :selected").val();
						var dayOfWeek=$("#dayOfWeek :selected").val();
						var fromTime=$('#fromTime').val();
			            var toTime=$('#toTime').val();
			            var scn=$('#scnATCC').val();
			            var lane=$('#lane').val();
			            var error=$('#error').val();

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

						formatted_fromDate = fromDate.substr(fromDate.lastIndexOf("-")+1,fromDate.length) + "-" + fromDate.substr(fromDate.indexOf("-")+1,fromDate.lastIndexOf("-")-3)+ "-" + fromDate.substr(0,fromDate.indexOf("-")) + " "+fromTime
						formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-")) + " "+toTime

						var q = new Date();
						var m = q.getMonth();
						var d = q.getDate();
						var y = q.getFullYear();
						var date = new Date(y,m,d);
						mydate=new Date(formatted_fromDate);
						
						//console.log((date-mydate)/86400000);

						if((date-mydate)/86400000 > 60){
							alert("Please use Archival Report Screen for searches before 60 days.")
							return;
						}						

						if(formatted_fromDate > formatted_toDate){
							alert("From Date should be less than To Date");
							return;
						}
						else{
							$.ajax({
				                url: '../utils/get_username.php',
				                success: function(result_username) {
									var username = result_username;
									window.open("../utils/createreport_atcc_pdf.php?fromDate=" + formatted_fromDate +"&toDate=" + formatted_toDate + "&timerange=" + timerange+"&username="+username+"&vClass="+vClass+"&direction="+direction+"&dayOfWeek="+dayOfWeek+"&scn="+scn+"&lane="+lane+"&error="+error,'_blank');
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





function json_to_csv(json_data, title, label, fromDate, toDate, timerange,json_data_devices) {
    //Json  Parser
    var arr_data = JSON.parse(json_data);
    var arr_data_devices = JSON.parse(json_data_devices);
    var csv = '';    
    
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
    if(document.getElementById("des")){
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
    var file_name = "atcc_report_"+fromDate+"_"+toDate+"_"+timerange;  
    var uri = 'data:text/csv;charset=utf-8,' + escape(csv);    
    var link = document.createElement("a");    
    link.href = uri;
    link.style = "visibility:hidden";
    link.download = file_name + ".csv";    
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}