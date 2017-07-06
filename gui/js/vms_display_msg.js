function getUrlParameter() {
    urlParameter ="";
    var sPageURL = decodeURIComponent(window.location.href);
    urlVariables = sPageURL.split('?');
    //console.log(urlVariables);
    if(urlVariables[1]){
    	if(urlVariables[1].split("=")[0]=="vms_scn"){
	    	urlParameter = urlVariables[1].split("=")[1];
	  		console.log(urlParameter); 
	    }
    }
    
};
getUrlParameter();
$(document).ready(function(){
	$.ajax({
		url: '../utils/get_vms_scns.php',
		success: function(result) {
			if(result.length == 2){
				alert("Connection Error please try again");
			}
			else{
				var scns = JSON.parse(result);
				for(i=0;i<scns.length;i++){
					if(urlParameter){
						if (urlParameter == scns[i].SystemCodeNumber) {
							$("#scns").empty();	
							$("#scns").append('<option>'+scns[i].SystemCodeNumber+'</option>');
							alert("Automatically detected nearest VMS display board");
							break;
						}
					}
					

					$("#scns").append('<option>'+scns[i].SystemCodeNumber+'</option>');
				}
			}
		}
    });
    $.ajax({
		url: '../utils/get_vms_msgs.php',
		success: function(result) {
			if(result.length == 2){
				alert("Connection Error please try again");
			}
			else{
				var scns = JSON.parse(result);
				for(i=0;i<scns.length;i++){
					var append = '<option>'
					append += scns[i].topLineText
					append += ' '
					append += scns[i].midLineText
					append += ' '
					append += scns[i].botLineText
					append += '</option>'
					$("#msg_texts").append(append);
				}
			}
		}
    });
    
    set_message = function(){
    		var vms = document.getElementById("scns").options[document.getElementById("scns").selectedIndex].text;
			var msg = document.getElementById("msg_texts").options[document.getElementById("msg_texts").selectedIndex].text;
			var slide = document.getElementById("slide").options[document.getElementById("slide").selectedIndex].text;
			var time=$('#time').val();

			if(slide == "Slide Number"){
				alert("Please enter Slide number");
				return;
			}
			if(time == "time(in sec)"){
				alert("Please enter time");
				return;
			}

			$.ajax({
                url: '../utils/get_username.php',
                success: function(result_username) {
					var username = result_username;
					$.ajax({
		                url: '../utils/set_vms_msg.php',
		                data :{vms:vms,msg:msg,slide:slide,time:time,username:username},
		                type: 'POST',
		                success: function(result) {
		                	if(result.length == 2){
								alert("Connection Error please try again");
							}else if(result === "\nduplicate"){
								alert("Please delete existing message on the device");
								fetch_messages();
							}else if(result === "\nMessageID"){
								alert("Message is not selected properly");
								fetch_messages();
							}else{
								alert("Your message has been set successfully");
								fetch_messages();	
							}
		               }
		           });
				}
            });

			
			
    }
    $("#set_message").click(function() {
            set_message();
    });
    document.onkeypress=function(event){
       if(event.keyCode=='13'){
            $("#set_message").click();
            }
    }
});
