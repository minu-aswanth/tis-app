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
		url: '../utils/edit_met_device.php',
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
				url: '../utils/del_met_device.php',
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
				url: '../utils/add_met_device.php',
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
			header = '<tr><td bgcolor="#993232" rowspan="2"><font color="white">Year</td><td bgcolor="#993232" rowspan="2"><font color="white">Month</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Average Data</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Minimum Data</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Maximum Data</td></tr><tr><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td></tr>';
		} else if(timerange == "Weekly"){
			header = '<tr><td bgcolor="#993232" rowspan="2"><font color="white">Year</td><td bgcolor="#993232" rowspan="2"><font color="white">Week</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Average Data</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Minimum Data</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Maximum Data</td></tr><tr><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td></tr>';
		} else if(timerange == "Daily"){
			header = '<tr><td bgcolor="#993232" rowspan="2"><font color="white">Year</td><td bgcolor="#993232" rowspan="2"><font color="white">Month</td><td bgcolor="#993232" rowspan="2"><font color="white">Date</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Average Data</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Minimum Data</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Maximum Data</td></tr><tr><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td></tr>';
		} else if(timerange == "Hourly"){
			header = '<tr><td bgcolor="#993232" rowspan="2"><font color="white">Year</td><td bgcolor="#993232" rowspan="2"><font color="white">Month</td><td bgcolor="#993232" rowspan="2"><font color="white">Date</td><td bgcolor="#993232" rowspan="2"><font color="white">Hour</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Average Data</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Minimum Data</td><td bgcolor="#993232" colspan="7" align="center"><font color="white">Maximum Data</td></tr><tr><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td><td bgcolor="#993232"><font color="white">Battery Volt</td><td bgcolor="#993232"><font color="white">Road Temp</td><td bgcolor="#993232"><font color="white">Air Temp</td><td bgcolor="#993232"><font color="white">Humidity</td><td bgcolor="#993232"><font color="white">Wind Speed</td><td bgcolor="#993232"><font color="white">Wind Direction</td><td bgcolor="#993232"><font color="white">Visibility</td></tr>';
		} else if(timerange == "Raw_Data"){
			header = '<tr><td bgcolor="#993232"><font color="white">TimeStamp</td><td bgcolor="#993232"><font color="white">Record</td><td bgcolor="#993232"><font color="white">BattV_Avg</td><td bgcolor="#993232"><font color="white">PTemp_C_Avg</td><td bgcolor="#993232"><font color="white">AirTC_Avg</td><td bgcolor="#993232"><font color="white">RH</td><td bgcolor="#993232"><font color="white">WS_ms_Avg</td><td bgcolor="#993232"><font color="white">WindDir</td><td bgcolor="#993232"><font color="white">TT_C_Avg</td><td bgcolor="#993232"><font color="white">SBT_C_Avg</td><td bgcolor="#993232"><font color="white">Visibility</td></tr>';
		}
        $('#searchResult').append(header);

        initial_value = Math.min(page_number*10, data_queried.length-1)
        for(i=initial_value; i>=(page_number-1)*10;i--){
            
        	if(timerange!="Raw_Data"){
				append = '<tr>'
				append += '<td>'+data_queried[i].YEAR+'</td>'
				if(timerange=="Monthly" || timerange=="Daily" || timerange=="Hourly"){
					append += '<td>'+data_queried[i].MONTH+'</td>'	
					if(timerange=="Daily" || timerange=="Hourly"){
						append += '<td>'+data_queried[i].DAY+'</td>'
						if(timerange=="Hourly")	{
							append += '<td>'+data_queried[i].HOUR+'</td>'
						}
					}
				} else if(timerange=="Weekly"){
					append += '<td>'+data_queried[i].WEEK+'</td>'
				} 
				append += '<td>'+data_queried[i].AVG_BattV+'</td>'
				append += '<td>'+data_queried[i].AVG_RoadTemp+'</td>'
				append += '<td>'+data_queried[i].AVG_AirTemp+'</td>'
				append += '<td>'+data_queried[i].AVG_Humidity+'</td>'
				append += '<td>'+data_queried[i].AVG_WindSpeed+'</td>'
				append += '<td>'+data_queried[i].AVG_WindDirection+'</td>'
				append += '<td>'+data_queried[i].AVG_Visibility+'</td>'

				append += '<td>'+data_queried[i].MIN_BattV+'</td>'
				append += '<td>'+data_queried[i].MIN_RoadTemp+'</td>'
				append += '<td>'+data_queried[i].MIN_AirTemp+'</td>'
				append += '<td>'+data_queried[i].MIN_Humidity+'</td>'
				append += '<td>'+data_queried[i].MIN_WindSpeed+'</td>'
				append += '<td>'+data_queried[i].MIN_WindDirection+'</td>'
				append += '<td>'+data_queried[i].MIN_Visibility+'</td>'
				
				append += '<td>'+data_queried[i].MAX_BattV+'</td>'
				append += '<td>'+data_queried[i].MAX_RoadTemp+'</td>'
				append += '<td>'+data_queried[i].MAX_AirTemp+'</td>'
				append += '<td>'+data_queried[i].MAX_Humidity+'</td>'
				append += '<td>'+data_queried[i].MAX_WindSpeed+'</td>'
				append += '<td>'+data_queried[i].MAX_WindDirection+'</td>'
				append += '<td>'+data_queried[i].MAX_Visibility+'</td>'
				
				append += '</tr>'
				
			} else{
				append = '<tr>'
				append += '<td>'+data_queried[i].TimeStamp+'</td>'
				append += '<td>'+data_queried[i].Record+'</td>'
				append += '<td>'+data_queried[i].BattV_Avg+'</td>'
				append += '<td>'+data_queried[i].PTemp_C_Avg+'</td>'
				append += '<td>'+data_queried[i].AirTC_Avg+'</td>'
				append += '<td>'+data_queried[i].RH+'</td>'
				append += '<td>'+data_queried[i].WS_ms_Avg+'</td>'
				append += '<td>'+data_queried[i].WindDir+'</td>'
				append += '<td>'+data_queried[i].TT_C_Avg+'</td>'
				append += '<td>'+data_queried[i].SBT_C_Avg+'</td>'
				append += '<td>'+data_queried[i].Visibility+'</td>'
				append += '</tr>'
			}
			
			$('#searchResult').append(append);
			$('#graph').hide();
        }
        append = '<tr>'
        if(timerange == "Monthly"){
			append += '<td colspan"23">&nbsp</td>';
		} else if(timerange == "Weekly"){
			append += '<td colspan"23">&nbsp</td>';
		} else if(timerange == "Daily"){
			append += '<td colspan"24">&nbsp</td>';
		} else if(timerange == "Hourly"){
			append += '<td colspan"25">&nbsp</td>';
		} else if(timerange == "Raw_Data"){
			append += '<td colspan"11">&nbsp</td>';
		}
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
        if(timerange == "Monthly"){
			append += '<td colspan="23">';
		} else if(timerange == "Weekly"){
			append += '<td colspan="23">';
		} else if(timerange == "Daily"){
			append += '<td colspan="24">';
		} else if(timerange == "Hourly"){
			append += '<td colspan="25">';
		} else if(timerange == "Raw_Data"){
			append += '<td colspan="11">';
		}
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
            if(fromDate == ""){
				alert("Please Enter From Date");
				return;
			}
			if(toDate == ""){
				alert("Please Enter To Date");
				return;
			}
			timerange=$("#timerange :selected").val();
			var parameter=$("#parameter :selected").val();

			formatted_fromDate = fromDate.substr(fromDate.lastIndexOf("-")+1,fromDate.length) + "-" + fromDate.substr(fromDate.indexOf("-")+1,fromDate.lastIndexOf("-")-3)+ "-" + fromDate.substr(0,fromDate.indexOf("-"))
			formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-")) + " 23:59:59"
			if(formatted_fromDate > formatted_toDate){
				alert("From Date should be less than To Date");
				return;
			}
			else{
				if(parameter == "all") {
					
					$.ajax({
						url: '../utils/createreport_met.php',
						data :{fromDate:formatted_fromDate,toDate:formatted_toDate,timerange:timerange,parameter:parameter},
						type: 'POST',
						success: function(result) {
							if(result.length == 2){
								alert("Connection Error please try again");
							}
							else{
								data_queried = jQuery.parseJSON(result);
								pagenation(1);
							}
						}
	            	});

				} else {

					$('#graph').show();

					$.ajax({
						url: '../utils/createreport_met.php',
						data :{fromDate:formatted_fromDate,toDate:formatted_toDate,timerange:timerange,parameter:parameter},
						type: 'POST',
						success: function(result) {
							if(result.length == 2){
								alert("Connection Error please try again");
							}
							else{

								var csv = JSON2CSV(result);
								var title = null;
								var ylabel = null;
								
								switch(parameter) {
								    case "BattV_Avg":
								        title = "Battery Voltage";
								        ylabel = "Voltage (V)";
								        break;
								    case "PTemp_C_Avg":
								        title = "Road Temperature";
								        ylabel = "Temperature (`C)";
								        break;
								    case "AirTC_Avg":
								        title = "Air Temperature";
								        ylabel = "Temperature (`C)";
								        break;
								    case "RH":
								        title = "Humidity";
								        ylabel = "Humidity (%)";
								        break;
								    case "WS_ms_Avg":
								        title = "Wind Speed";
								        ylabel = "Wind Speed (m/s)";
								        break;
								    case "WindDir":
								        title = "Wind Direction";
								        ylabel = "Wind Direction (`)";
								        break;
								    case "Visibility":
								        title = "Visibility Distance";
								        ylabel = "Visibility Distance (m)";
								        break;
								}

								g2 = new Dygraph(
								    document.getElementById("graph"),
								    csv, // path to CSV file
								    {
								    	title: title,
							            ylabel: ylabel,
							            legend: 'always',
							            labelsDivStyles: { 'textAlign': 'right', 'font-size':'0' },
							            showRangeSelector: true
								    }
								);

								$('#searchResult').empty();
								
							}
						}
	            	});

				}
				
			}
		}

		create_reportOnLoad = function(){
            
			var current = new Date();

            var year = current.getFullYear();
            var month = current.getMonth() + 1;
            var date = current.getDate();
            //var date1 = current.getDate()+1;
            var hour = current.getHours();
            var minute = current.getMinutes();
            var seconds = current.getSeconds();
            
            if(month.toString().length==1) month="0"+month;
            if(date.toString().length==1) date="0"+date;
            if(hour.toString().length==1) hour="0"+hour;
            if(minute.toString().length==1) minute="0"+minute;
            if(seconds.toString().length==1) seconds="0"+seconds;

            formatted_toDate = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+seconds;
            formatted_fromDate = year+"-"+month+"-"+date+" "+"00:00:00";

			var timerange='Monthly';
			var parameter='AirTC_Avg';

			$.ajax({
				url: '../utils/createreport_met.php',
				data :{fromDate:formatted_fromDate,toDate:formatted_toDate,timerange:timerange,parameter:parameter},
				type: 'POST',
				success: function(result) {
					if(result.length == 2){
						alert("Connection Error please try again");
					}
					else{

						var csv = JSON2CSV(result);

						g2 = new Dygraph(
						    document.getElementById("graph"),
						    csv,
						    {
						    	title: "Today's Air Temperature",
					            ylabel: 'Temperature (C)',
					            legend: 'always',
					            labelsDivStyles: { 'textAlign': 'right', 'font-size':'0' },
					            showRangeSelector: false
						    }          // options
						);

						$('#searchResult').empty();
						
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
						formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-")) + " 23:59:59"
						var parameter = 'all';
						if(formatted_fromDate > formatted_toDate){
							alert("From Date should be less than To Date");
							return;
						}
						else{
							$.ajax({
								url: '../utils/createreport_met.php',
								data :{fromDate:formatted_fromDate,toDate:formatted_toDate,timerange:timerange,parameter:parameter},
								type: 'POST',
								success: function(result) {
									if(result.length == 2){
										alert("Connection Error please try again");
									}
									else{
										$.ajax({
						                	url: '../utils/met_devices.php',
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

														json_to_csv(result,"MET Report",true,fromDate,toDate,timerange,result_devices,username,ts);

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
						formatted_toDate = toDate.substr(toDate.lastIndexOf("-")+1,toDate.length) + "-" + toDate.substr(toDate.indexOf("-")+1,toDate.lastIndexOf("-")-3)+ "-" + toDate.substr(0,toDate.indexOf("-")) + " 23:59:59"
						if(formatted_fromDate > formatted_toDate){
							alert("From Date should be less than To Date");
							return;
						}
						else{
							$.ajax({
				                url: '../utils/get_username.php',
				                success: function(result_username) {
									var username = result_username;
									//window.location = "../utils/createreport_met_pdf.php?fromDate=" + formatted_fromDate +"&toDate=" + formatted_toDate + "&timerange=" + timerange+"&username="+username
									window.open("../utils/createreport_met_pdf.php?fromDate=" + formatted_fromDate +"&toDate=" + formatted_toDate + "&timerange=" + timerange+"&username="+username,'_blank');

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


function json_to_csv(json_data, title, label, fromDate, toDate, timerange, json_data_devices,username, timestamp) {
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
    for (var i = 0; i < arr_data_devices.length; i++) {
        var row = "";        
        for (var index in arr_data_devices[i]) {
            row += '"' + arr_data_devices[i][index] + '",';
        }
        row.slice(0, row.length - 1);
        //add a line break after each row
        csv += row + '\r\n';
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
    var file_name = "met_report_"+fromDate+"_"+toDate+"_"+timerange;  
    var uri = 'data:text/csv;charset=utf-8,' + escape(csv);    
    var link = document.createElement("a");    
    link.href = uri;
    link.style = "visibility:hidden";
    link.download = file_name + ".csv";    
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}



function JSON2CSV(objArray) {
    var array = typeof objArray != 'object' ? JSON.parse(objArray) : objArray;
    var str = '';
    var line = '';

    var head = array[0];
        for (var index in array[0]) {
            line += index + ',';
        }
    
    line = line.slice(0, -1);
    str += line + '\r\n';
    
    for (var i = 0; i < array.length; i++) {
        var line = '';

        for (var index in array[i]) {
            line += array[i][index] + ',';
        }
        
        line = line.slice(0, -1);
        str += line + '\r\n';
    }
    return str;
    /*var file_name = "met_graph_data";  
    var uri = 'data:text/csv;charset=utf-8,' + escape(str);
    var link = document.createElement("a");    
    link.href = uri;
    link.style = "visibility:hidden";
    link.download = file_name + ".csv";    
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);*/
}