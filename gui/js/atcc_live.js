$(document).ready(function(){
	fetch_atccraw = function(){
				$('#atcc_raw').empty();
                $.ajax({
                	url: '../utils/atcc_raw.php',
                	success: function(result) {
						var raw_set = jQuery.parseJSON(result);
						for(i=raw_set.length-1; i>=0;i--){
							append = '<tr>'
							append += '<td colspan="3" rowspan="2" bgcolor="#993232" style="vertical-align:middle"><font color="white">&nbsp</td><td colspan="9" bgcolor="#993232" style="vertical-align:middle"><font color="white">Overall Traffic Volume (Last 15 minute Data) (in no. of vehicles)</td></tr>'
							append += '<tr><td bgcolor="#993232" style="vertical-align:middle"><font color="white">2-Wheelers</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Car/Jeep</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">LCV</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Truck/Bus</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">3-Axle</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Multi-Axle</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Tractor</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Jugad</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Total</td></tr>'
							append += '<tr><td rowspan="6" bgcolor="#993232" style="vertical-align:middle"><font color="white">'
							append += raw_set[i].SCN
							append += '</td><td rowspan="3" bgcolor="#993232" style="vertical-align:middle"><font color="white">Towards Berhampore</td><td bgcolor="#cc9999" style="vertical-align:middle">Lane 1</td>'
							append += '<td>'+raw_set[i].lane_1_class_1 +'</td>'
							append += '<td>'+raw_set[i].lane_1_class_2 +'</td>'
							append += '<td>'+raw_set[i].lane_1_class_3 +'</td>'
							append += '<td>'+raw_set[i].lane_1_class_4 +'</td>'
							append += '<td>'+raw_set[i].lane_1_class_5 +'</td>'
							append += '<td>'+raw_set[i].lane_1_class_6 +'</td>'
							append += '<td>'+raw_set[i].lane_1_class_7 +'</td>'
							append += '<td>'+raw_set[i].lane_1_class_8 +'</td>'
							append += '<td>'+raw_set[i].lane_1_total +'</td></tr><tr><td bgcolor="#cc9999" style="vertical-align:middle">Lane 2</td>'
							append += '<td>'+raw_set[i].lane_2_class_1 +'</td>'
							append += '<td>'+raw_set[i].lane_2_class_2 +'</td>'
							append += '<td>'+raw_set[i].lane_2_class_3 +'</td>'
							append += '<td>'+raw_set[i].lane_2_class_4 +'</td>'
							append += '<td>'+raw_set[i].lane_2_class_5 +'</td>'
							append += '<td>'+raw_set[i].lane_2_class_6 +'</td>'
							append += '<td>'+raw_set[i].lane_2_class_7 +'</td>'
							append += '<td>'+raw_set[i].lane_2_class_8 +'</td>'
							append += '<td>'+raw_set[i].lane_2_total +'</td></tr><tr bgcolor="#cc9999"><td>Total</td>'
							/*append += '<td>'+raw_set[i].ttoll_class_1 +'</td>'
							append += '<td>'+raw_set[i].ttoll_class_2 +'</td>'
							append += '<td>'+raw_set[i].ttoll_class_3 +'</td>'
							append += '<td>'+raw_set[i].ttoll_class_4 +'</td>'
							append += '<td>'+raw_set[i].ttoll_class_5 +'</td>'
							append += '<td>'+raw_set[i].ttoll_class_6 +'</td>'
							append += '<td>'+raw_set[i].ttoll_class_7 +'</td>'
							append += '<td>'+raw_set[i].ttoll_class_8 +'</td>'
							append += '<td>'+raw_set[i].ttoll_total +'</td></tr>'*/
							if(raw_set[i].SCN === 'ATCC-001'){
								append += '<td>'+raw_set[i].ftoll_class_1 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_2 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_3 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_4 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_5 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_6 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_7 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_8 +'</td>'
								append += '<td>'+raw_set[i].ftoll_total +'</td></tr>'
								append += '<tr><td rowspan="3" bgcolor="#993232" style="vertical-align:middle"><font color="white">Towards Raiganj</td><td bgcolor="#cc9999" style="vertical-align:middle">Lane 3</td>'
							} else{
								append += '<td>'+raw_set[i].ttoll_class_1 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_2 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_3 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_4 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_5 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_6 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_7 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_8 +'</td>'
								append += '<td>'+raw_set[i].ttoll_total +'</td></tr>'
								append += '<tr><td rowspan="3" bgcolor="#993232" style="vertical-align:middle"><font color="white">Towards Farakka</td><td bgcolor="#cc9999" style="vertical-align:middle">Lane 3</td>'									
							}
							
							append += '<td>'+raw_set[i].lane_3_class_1 +'</td>'
							append += '<td>'+raw_set[i].lane_3_class_2 +'</td>'
							append += '<td>'+raw_set[i].lane_3_class_3 +'</td>'
							append += '<td>'+raw_set[i].lane_3_class_4 +'</td>'
							append += '<td>'+raw_set[i].lane_3_class_5 +'</td>'
							append += '<td>'+raw_set[i].lane_3_class_6 +'</td>'
							append += '<td>'+raw_set[i].lane_3_class_7 +'</td>'
							append += '<td>'+raw_set[i].lane_3_class_8 +'</td>'
							append += '<td>'+raw_set[i].lane_3_total +'</td></tr><tr><td bgcolor="#cc9999" style="vertical-align:middle">Lane 4</td>'
							append += '<td>'+raw_set[i].lane_4_class_1 +'</td>'
							append += '<td>'+raw_set[i].lane_4_class_2 +'</td>'
							append += '<td>'+raw_set[i].lane_4_class_3 +'</td>'
							append += '<td>'+raw_set[i].lane_4_class_4 +'</td>'
							append += '<td>'+raw_set[i].lane_4_class_5 +'</td>'
							append += '<td>'+raw_set[i].lane_4_class_6 +'</td>'
							append += '<td>'+raw_set[i].lane_4_class_7 +'</td>'
							append += '<td>'+raw_set[i].lane_4_class_8 +'</td>'
							append += '<td>'+raw_set[i].lane_4_total +'</td></tr><tr bgcolor="#cc9999"><td>Total</td>'
							

							if(raw_set[i].SCN === 'ATCC-001'){
								append += '<td>'+raw_set[i].ttoll_class_1 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_2 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_3 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_4 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_5 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_6 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_7 +'</td>'
								append += '<td>'+raw_set[i].ttoll_class_8 +'</td>'
								append += '<td>'+raw_set[i].ttoll_total +'</td></tr>'								
							} else{
								append += '<td>'+raw_set[i].ftoll_class_1 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_2 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_3 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_4 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_5 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_6 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_7 +'</td>'
								append += '<td>'+raw_set[i].ftoll_class_8 +'</td>'
								append += '<td>'+raw_set[i].ftoll_total +'</td></tr>'
							}
								
							append += '<tr><td colspan="12">&nbsp;</td></tr>'

							$('#atcc_raw').append(append);
						}
                	}
                });
        }
    fetch_atccraw();
    var timeout = setTimeout("location.reload(true);",300000);
});

function populateParam(){

	var param = document.getElementById("param").options[document.getElementById("param").selectedIndex].text;

	if(param === "Average Speed"){
		fetch_atccraw_speed();
	} else if(param === "Traffic Volume"){
		fetch_atccraw();
	}

}

fetch_atccraw_speed = function(){
	$('#atcc_raw').empty();
    $.ajax({
    	url: '../utils/atcc_raw_speed.php',
    	success: function(result) {
			var raw_set = jQuery.parseJSON(result);
			for(i=raw_set.length-1; i>=0;i--){
				append = '<tr>'
				append += '<td colspan="3" rowspan="2" bgcolor="#993232" style="vertical-align:middle"><font color="white">&nbsp</td><td colspan="9" bgcolor="#993232" style="vertical-align:middle"><font color="white">Average Speed (based on last 15 minute Data) (in kmph)</td></tr>'
				append += '<tr><td bgcolor="#993232" style="vertical-align:middle"><font color="white">2-Wheelers</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Car/Jeep</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">LCV</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Truck/Bus</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">3-Axle</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Multi-Axle</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Tractor</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Jugad</td><td bgcolor="#993232" style="vertical-align:middle"><font color="white">Total</td></tr>'
				append += '<tr><td rowspan="6" bgcolor="#993232" style="vertical-align:middle"><font color="white">'
				append += raw_set[i].SCN
				append += '</td><td rowspan="3" bgcolor="#993232" style="vertical-align:middle"><font color="white">Towards Berhampore</td><td bgcolor="#cc9999" style="vertical-align:middle">Lane 1</td>'
				
				if(raw_set[i].lane_1_class_1 !=null ){ append += '<td>'+raw_set[i].lane_1_class_1 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_1_class_2 !=null ){ append += '<td>'+raw_set[i].lane_1_class_2 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_1_class_3 !=null ){ append += '<td>'+raw_set[i].lane_1_class_3 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_1_class_4 !=null ){ append += '<td>'+raw_set[i].lane_1_class_4 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_1_class_5 !=null ){ append += '<td>'+raw_set[i].lane_1_class_5 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_1_class_6 !=null ){ append += '<td>'+raw_set[i].lane_1_class_6 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_1_class_7 !=null ){ append += '<td>'+raw_set[i].lane_1_class_7 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_1_class_8 !=null ){ append += '<td>'+raw_set[i].lane_1_class_8 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_1_total !=null ){ append += '<td>'+raw_set[i].lane_1_total +'</td>'}else{append += '<td>'+"0" +'</td>'}
				append += '</tr><tr><td bgcolor="#cc9999" style="vertical-align:middle">Lane 2</td>'
				
				if(raw_set[i].lane_2_class_1 !=null ){ append += '<td>'+raw_set[i].lane_2_class_1 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_2_class_2 !=null ){ append += '<td>'+raw_set[i].lane_2_class_2 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_2_class_3 !=null ){ append += '<td>'+raw_set[i].lane_2_class_3 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_2_class_4 !=null ){ append += '<td>'+raw_set[i].lane_2_class_4 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_2_class_5 !=null ){ append += '<td>'+raw_set[i].lane_2_class_5 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_2_class_6 !=null ){ append += '<td>'+raw_set[i].lane_2_class_6 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_2_class_7 !=null ){ append += '<td>'+raw_set[i].lane_2_class_7 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_2_class_8 !=null ){ append += '<td>'+raw_set[i].lane_2_class_8 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_2_total !=null ){ append += '<td>'+raw_set[i].lane_2_total +'</td>'}else{append += '<td>'+"0" +'</td>'}
				append += '</tr><tr bgcolor="#cc9999"><td>Total</td>'

				if(raw_set[i].ttoll_class_1 !=null ){ append += '<td>'+raw_set[i].ttoll_class_1 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ttoll_class_2 !=null ){ append += '<td>'+raw_set[i].ttoll_class_2 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ttoll_class_3 !=null ){ append += '<td>'+raw_set[i].ttoll_class_3 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ttoll_class_4 !=null ){ append += '<td>'+raw_set[i].ttoll_class_4 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ttoll_class_5 !=null ){ append += '<td>'+raw_set[i].ttoll_class_5 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ttoll_class_6 !=null ){ append += '<td>'+raw_set[i].ttoll_class_6 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ttoll_class_7 !=null ){ append += '<td>'+raw_set[i].ttoll_class_7 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ttoll_class_8 !=null ){ append += '<td>'+raw_set[i].ttoll_class_8 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ttoll_total !=null ){ append += '<td>'+raw_set[i].ttoll_total +'</td>'}else{append += '<td>'+"0" +'</td>'}
				append += '</tr>'

				if(raw_set[i].SCN === 'ATCC-001'){
					append += '</tr>'
					append += '<tr><td rowspan="3" bgcolor="#993232" style="vertical-align:middle"><font color="white">Towards Raiganj</td><td bgcolor="#cc9999" style="vertical-align:middle">Lane 3</td>'

				} else{
					append += '</tr>'
					append += '<tr><td rowspan="3" bgcolor="#993232" style="vertical-align:middle"><font color="white">Towards Farakka</td><td bgcolor="#cc9999" style="vertical-align:middle">Lane 3</td>'						
				}
			
				if(raw_set[i].lane_3_class_1 !=null ){ append += '<td>'+raw_set[i].lane_3_class_1 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_3_class_2 !=null ){ append += '<td>'+raw_set[i].lane_3_class_2 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_3_class_3 !=null ){ append += '<td>'+raw_set[i].lane_3_class_3 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_3_class_4 !=null ){ append += '<td>'+raw_set[i].lane_3_class_4 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_3_class_5 !=null ){ append += '<td>'+raw_set[i].lane_3_class_5 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_3_class_6 !=null ){ append += '<td>'+raw_set[i].lane_3_class_6 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_3_class_7 !=null ){ append += '<td>'+raw_set[i].lane_3_class_7 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_3_class_8 !=null ){ append += '<td>'+raw_set[i].lane_3_class_8 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_3_total !=null ){ append += '<td>'+raw_set[i].lane_3_total +'</td>'}else{append += '<td>'+"0" +'</td>'}
				append += '</tr><tr><td bgcolor="#cc9999" style="vertical-align:middle">Lane 4</td>'
			
				if(raw_set[i].lane_4_class_1 !=null ){ append += '<td>'+raw_set[i].lane_4_class_1 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_4_class_2 !=null ){ append += '<td>'+raw_set[i].lane_4_class_2 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_4_class_3 !=null ){ append += '<td>'+raw_set[i].lane_4_class_3 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_4_class_4 !=null ){ append += '<td>'+raw_set[i].lane_4_class_4 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_4_class_5 !=null ){ append += '<td>'+raw_set[i].lane_4_class_5 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_4_class_6 !=null ){ append += '<td>'+raw_set[i].lane_4_class_6 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_4_class_7 !=null ){ append += '<td>'+raw_set[i].lane_4_class_7 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_4_class_8 !=null ){ append += '<td>'+raw_set[i].lane_4_class_8 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].lane_4_total !=null ){ append += '<td>'+raw_set[i].lane_4_total +'</td>'}else{append += '<td>'+"0" +'</td>'}				
				append += '</tr><tr bgcolor="#cc9999"><td>Total</td>'

				if(raw_set[i].ftoll_class_1 !=null ){ append += '<td>'+raw_set[i].ftoll_class_1 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ftoll_class_2 !=null ){ append += '<td>'+raw_set[i].ftoll_class_2 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ftoll_class_3 !=null ){ append += '<td>'+raw_set[i].ftoll_class_3 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ftoll_class_4 !=null ){ append += '<td>'+raw_set[i].ftoll_class_4 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ftoll_class_5 !=null ){ append += '<td>'+raw_set[i].ftoll_class_5 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ftoll_class_6 !=null ){ append += '<td>'+raw_set[i].ftoll_class_6 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ftoll_class_7 !=null ){ append += '<td>'+raw_set[i].ftoll_class_7 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ftoll_class_8 !=null ){ append += '<td>'+raw_set[i].ftoll_class_8 +'</td>'}else{append += '<td>'+"0" +'</td>'}
				if(raw_set[i].ftoll_total !=null ){ append += '<td>'+raw_set[i].ftoll_total +'</td>'}else{append += '<td>'+"0" +'</td>'}
				
				append += '</tr>'
				if(i != 0)append += '<tr><td colspan="12">&nbsp;</td></tr>'

				$('#atcc_raw').append(append);
			}
    	}
    });
}