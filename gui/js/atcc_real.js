$(document).ready(function(){
	routes = function(){
		$.ajax({
            url: '../utils/atcc_real.php',
            type: 'GET',
            success: function(result) {
                if(result == 'F'){
                        alert('Connection Error')
                }
                else{
                	for (var j = 1; j <= 4; j++) {
                		$("#atcc_1"+j).css("background-color", "#CC6868");
                		$("#atcc_1"+j+"_1").css('background-image', 'none');
						$("#atcc_1"+j+"_2")[0].innerHTML = ""
                		$("#atcc_2"+j).css("background-color", "#CC6868");
                		$("#atcc_2"+j+"_1").css('background-image', 'none');
						$("#atcc_2"+j+"_2")[0].innerHTML = ""
                	}
					var data = jQuery.parseJSON(result);
					for(var i=0; i<data.length;i++){
						if(data[i].SCN=="ATCC-001"){
							$("#atcc_1"+data[i].Lane).css("background-color", "#7AA37E");
							if(data[i].binName=="Car/Jeep"){
								$("#atcc_1"+data[i].Lane+"_1").css('background-image', 'url(../images/Car.png)');
								//$("#atcc_1"+data[i].Lane+"_1").css('background-size', '102px 85px');
								//$("#atcc_1"+data[i].Lane+"_1").css('background-repeat', 'no-repeat');
							} else if(data[i].binName=="Truck/Bus"){
								$("#atcc_1"+data[i].Lane+"_1").css('background-image', 'url(../images/Bus.png)' );
							} else{
								$("#atcc_1"+data[i].Lane+"_1").css('background-image', 'url(../images/'+data[i].binName+'.png)');
							}
							$("#atcc_1"+data[i].Lane+"_2")[0].innerHTML = data[i].Speed+' kmph';
						}
						if(data[i].SCN=="ATCC-002"){
							$("#atcc_2"+data[i].Lane).css("background-color", "#7AA37E");
							if(data[i].binName=="Car/Jeep"){
								$("#atcc_2"+data[i].Lane+"_1").css('background-image', 'url(../images/Car.png)' );
							} else if(data[i].binName=="Truck/Bus"){
								$("#atcc_2"+data[i].Lane+"_1").css('background-image', 'url(../images/Bus.png)' );
							} else{
								$("#atcc_2"+data[i].Lane+"_1").css('background-image', 'url(../images/'+data[i].binName+'.png)');
							}
							//$("#atcc_2"+data[i].Lane+"_1").css('background-image', 'url(Custom-Icon-Design-Flatastic-2-Truck.ico)' );
							$("#atcc_2"+data[i].Lane+"_2")[0].innerHTML = data[i].Speed+' kmph';
						}
					}
           		}
            },
            timeout: 1000
        });
	}
	routes();
	timeOutId = setInterval(routes, 1000);
});