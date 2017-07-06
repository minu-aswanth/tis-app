$(document).ready(function(){
	fetch_cctvraw = function(){
				$('#cctv_raw').empty();
                $.ajax({
                	url: '../utils/cctv_raw.php',
                	success: function(result) {
						var raw_set = jQuery.parseJSON(result);
						
						for(i=raw_set.length-1; i>=0;i--){

							var ip0=null;
							var ip1=null;
							var ip2=null;

							ip0 = raw_set[i].PublicIPAddress+":"+raw_set[i].Port;
							if(typeof raw_set[i-1] !== "undefined")ip1=raw_set[i-1].PublicIPAddress+":"+raw_set[i-1].Port;
							if(typeof raw_set[i-2] !== "undefined")ip2=raw_set[i-2].PublicIPAddress+":"+raw_set[i-2].Port;

							append = '<tr height="35"><td bgcolor="#993232" style="border:1px solid #993232"><a href="./cctvWindow.html?ip='
							append += ip0+'" target="_blank"><font color="white">'
							append += raw_set[i].SystemCodeNumber+'</font></a></td>'
							if(typeof raw_set[i-1] !== "undefined"){
								append += '<td width="2"></td><td bgcolor="#993232" style="border:1px solid #993232"><a href="./cctvWindow.html?ip='
								append += ip1+'" target="_blank"><font color="white">'
								append += raw_set[i-1].SystemCodeNumber+'</font></a></td>'
								if(typeof raw_set[i-2] !== "undefined"){
									append += '<td width="2"></td><td bgcolor="#993232" style="border:1px solid #993232"><a href="./cctvWindow.html?ip='
									append += ip2+'" target="_blank"><font color="white">'
									append += raw_set[i-2].SystemCodeNumber+'</font></a></td>'
								}
							}
							append += '</tr><tr height="140"><td style="border:1px solid black"> <a href="./cctvWindow.html?ip='
							append += ip0+'" target="_blank"><img src="http://'
							append += ip0+'/video2.mjpg" height="150" alt="Device disconnected"></img></a></td>'
							if(typeof raw_set[i-1] !== "undefined"){
								append += '<td width="2"></td><td style="border:1px solid black"> <a href="./cctvWindow.html?ip='
								append += ip1+'" target="_blank"><img src ="http://'
								append += ip1+'/video2.mjpg" height="150" alt="Device disconnected"></img></a></td>'
								if(typeof raw_set[i-2] !== "undefined"){
									append += '<td width="2"></td><td style="border:1px solid black"> <a href="./cctvWindow.html?ip='
									append += ip2+'" target="_blank"><img src ="http://'
									append += ip2+'/video2.mjpg" height="150" alt="Device disconnected"></img></a></td>'	
								}
							}
							i=i-2;
							append += '</tr><tr height="5"></tr>'
							$('#cctv_raw').append(append);
						}
                	}
                });
        }
    fetch_cctvraw();
    var timeout = setTimeout("location.reload(true);",300000);
});