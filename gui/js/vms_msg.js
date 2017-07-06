function openModal(){
	$("#myModal").modal();
}
function openEditModal() {
	try{
		var messageID = $("input[type='radio'][name='mds']:checked").parent().parent().children()[5].innerHTML
		var category = $("input[type='radio'][name='mds']:checked").parent().parent().children()[3].innerHTML
		var commandPhrase = $("input[type='radio'][name='mds']:checked").parent().parent().children()[4].innerHTML

		var topLine="";
		var midLine="";
		var botLine="";
		var fontSize="";

		$.ajax({
            url: '../utils/vms_set_msg_edit.php',
            data :{messageID:messageID},
            type: 'POST',
            success: function(result) {
                var devices_set = jQuery.parseJSON(result);
                for(i=devices_set.length-1; i>=0;i--){
                    topLine=devices_set[i].topLineText
                    midLine=devices_set[i].midLineText
                    botLine=devices_set[i].botLineText
                    fontSize=devices_set[i].fontSize
                    
                    $("#editModal").modal();
                    $(".modal-body #message_id")[0].innerHTML = messageID
					$(".modal-body #tMessageText_modal").val(topLine)
					$(".modal-body #mMessageText_modal").val(midLine)
					$(".modal-body #bMessageText_modal").val(botLine)
					$(".modal-body #maxsize_modal").val(fontSize)
					$(".modal-body #category_modal").val(category)
					$(".modal-body #commandPhrase_modal").val(commandPhrase)
					$(".modal-body #demoMsg_modal")[0].innerHTML = topLine+"<br>"+midLine+"<br>"+botLine
					
                }
            }
        });

	}
	catch(e){
		alert("Please select a message to edit")
	}
}

function editRow(){
	var messageID=$('#message_id')[0].innerHTML;
	var topLine=$('#tMessageText_modal').val();
	var midLine=$('#mMessageText_modal').val();
	var botLine=$('#bMessageText_modal').val();
	var fontSize=$('#maxsize_modal').val();
	var category=$('#category_modal').val();
	var commandPhrase=$('#commandPhrase_modal').val();
	$.ajax({
		url: '../utils/edit_vms_set_msg.php',
		data :{messageID:messageID,topLine:topLine,midLine:midLine,botLine:botLine,fontSize:fontSize,category:category,commandPhrase:commandPhrase},
		type: 'POST',
		success: function(result) {
			$("#cancelModal_edit").click();
			alert("Selected Message has been edited")
			fetch_devices();
		}
	});

}
function deleteRow() {
	try{
		var messageID = $("input[type='radio'][name='mds']:checked").parent().parent().children()[5].innerHTML
		$.ajax({
				url: '../utils/del_vms_set_msg.php',
				data :{messageID:messageID},
				type: 'POST',
				success: function(result) {
					if(result.length == 2){
						alert("Connection Error please try again");
					}
					else{
						alert("Deleted the Message Succesfully");
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
			var topLine=$('#tMessageText').val();
			var midLine=$('#mMessageText').val();
			var botLine=$('#bMessageText').val();
			var fontSize=$('#maxsize').val();
			var category=$('#category').val();
			var commandPhrase=$('#commandPhrase').val();

			$.ajax({
				url: '../utils/add_vms_set_msg.php',
				data :{topLine:topLine,midLine:midLine,botLine:botLine,fontSize:fontSize,category:category,commandPhrase:commandPhrase},
				type: 'POST',
				success: function(result) {
					$("#cancelModal").click();
					alert("New Message has been added")
					fetch_devices();
				}
            });
        }
        $("#addMessage").click(function() {
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
				//window.location = "../utils/createreport_vms.php?fromDate=" + formatted_fromDate +"&toDate=" + formatted_toDate + "&timerange=" + timerange
				window.open("../utils/createreport_vms.php?fromDate=" + formatted_fromDate +"&toDate=" + formatted_toDate + "&timerange=" + timerange,'_blank');
			}
        }
        $("#createReport").click(function() {
                create_report();
        });
		
});