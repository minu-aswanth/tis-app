/*$(document).ready(function(){
	fetch_metraw = function(){
				$('#met_raw').empty();
                $.ajax({
                	url: '../utils/met_raw.php',
                	success: function(result) {
						var raw_set = jQuery.parseJSON(result);
						for(i=raw_set.length-1; i>=0;i--){
							append = '<tr>'
							append += '<td>'+raw_set[i].SystemCodeNumber+'</td>'
							append += '<td>'+raw_set[i].RoadTemp+'</td>'
							append += '<td>'+raw_set[i].VisibilityDist+'</td>'
							append += '<td>'+raw_set[i].Precipitation+'</td>'
							append += '<td>'+raw_set[i].AirTemp+'</td>'
							append += '<td>'+raw_set[i].WindSpeed+'</td>'
							append += '<td>'+raw_set[i].Humidity+'</td>'
							append += '<td>'+raw_set[i].LastUpdated +'</td>'
							append += '</tr>'
							$('#met_raw').append(append);
						}
                	}
                });
        }
    fetch_metraw();
    var timeout = setTimeout("location.reload(true);",300000);
});*/

$(document).ready(function(){
	fetch_metraw = function(){
		
		$.ajax({
        	url: '../utils/met_raw.php',
        	success: function(result) {
				var raw_set = jQuery.parseJSON(result);

				var voltage1 = new JustGage({
                    id: 'voltage1',
                    value: raw_set[0].BattV_Avg,
                    defaults: dfltVoltage
                });
                var roadTemp1 = new JustGage({
				    id: 'roadTemp1',
				    value: raw_set[0].PTemp_C_Avg,
				    defaults: dfltRoadTemp
				});
                var airTemp1 = new JustGage({
                    id: 'airTemp1',
                    value: raw_set[0].AirTC_Avg,
                    defaults: dfltAirTemp
                });
                var humidity1 = new JustGage({
                    id: 'humidity1',
                    value: raw_set[0].RH,
                    defaults: dfltHumidity
                });
                var windSpeed1 = new JustGage({
                    id: 'windSpeed1',
                    value: raw_set[0].WS_ms_Avg,
                    defaults: dfltWindSpeed
                });

                if (window.DeviceOrientationEvent) {
                    window.addEventListener('deviceorientation', function(eventData) {
                    var dir = raw_set[0].WindDir;
                    deviceOrientationHandler(dir);
                  }, false);
                } 
                /*var windDirection1 = new JustGage({
                    id: 'windDirection1',
                    value: raw_set[0].WindDir,
                    defaults: dfltWindDirection
                });*/
				var visDist1 = new JustGage({
				    id: 'visDist1',
				    value: raw_set[0].Visibility,
				    defaults: dfltVisDist
				});
				
                $('#lastUpdated1').append(raw_set[0].TimeStamp);

        	}
        });
    }
    fetch_metraw();
    var timeout = setTimeout("location.reload(true);",300000);
});

document.addEventListener("DOMContentLoaded", function(event) {
    dfltVoltage = {
        min: 00,
        max: 15,
        donut: true,
        gaugeWidthScale: 0.6,
        counter: false,
        hideInnerShadow: false
    }
    dfltRoadTemp = {
        min: 00,
        max: 50,
        donut: true,
        gaugeWidthScale: 0.6,
        counter: false,
        hideInnerShadow: false
    }
    dfltAirTemp = {
        min: 00,
        max: 50,
        donut: true,
        gaugeWidthScale: 0.6,
        counter: false,
        hideInnerShadow: false
    }
    dfltHumidity = {
        min: 00,
        max: 90,
        donut: true,
        gaugeWidthScale: 0.6,
        counter: false,
        hideInnerShadow: false
    }
    dfltWindSpeed = {
        min: 00,
        max: 20,
        donut: true,
        gaugeWidthScale: 0.6,
        counter: false,
        hideInnerShadow: false
    }
    dfltWindDirection = {
        min: 00,
        max: 360,
        donut: true,
        gaugeWidthScale: 0.6,
        counter: false,
        hideInnerShadow: false
    }
    dfltVisDist = {
        min: 00,
        max: 5000,
        donut: true,
        reverse: true,
        gaugeWidthScale: 0.6,
        counter: false,
        hideInnerShadow: false
    }
    

});

function deviceOrientationHandler(dir) {
      document.getElementById("direction").innerHTML = Math.ceil(dir);
      
      var compassDisc = document.getElementById("compassDiscImg");
      compassDisc.style.webkitTransform = "rotate("+ dir +"deg)";
      compassDisc.style.MozTransform = "rotate("+ dir +"deg)";
      compassDisc.style.transform = "rotate("+ dir +"deg)";
    }


document.addEventListener("DOMContentLoaded", function(event) {

    /*if (window.DeviceOrientationEvent) {
        window.addEventListener('deviceorientation', function(eventData) {
        var dir = eventData.alpha;
        dir = 45;
        deviceOrientationHandler(dir);
      }, false);
    } */

    function deviceOrientationHandler(dir) {
      document.getElementById("direction").innerHTML = Math.ceil(dir);
      
      var compassDisc = document.getElementById("compassDiscImg");
      compassDisc.style.webkitTransform = "rotate("+ dir +"deg)";
      compassDisc.style.MozTransform = "rotate("+ dir +"deg)";
      compassDisc.style.transform = "rotate("+ dir +"deg)";
    }

});