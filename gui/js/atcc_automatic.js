jQuery(document).ready(function() {
//Adding accident
$.ajax({
        url: '../utils/get_atcc_users.php',
        success: function(result) {
        	result = jQuery.parseJSON(result);
        	for (var i = result.length - 1; i >= 0; i--) {
        		append = "<option email='"+result[i]["email"]+"' value='"+result[i]["user"]+"'>"+result[i]["user"]+"</option>";
        		$("#users_list").append(append);	
        	}           
        }
})
fetch_users = function(){
			$('#auto_users').empty();
            $.ajax({
            	url: '../utils/get_atcc_auto_users.php',
            	success: function(result) {
					var devices_set = jQuery.parseJSON(result);
					for(i=devices_set.length-1; i>=0;i--){
						append = '<tr>'
						append += '<td><input type="radio" name="mds"></td>'
						append += '<td>'+(devices_set.length - i)+'</td>'
						append += '<td>'+devices_set[i].user+'</td>'
						append += '<td>'+devices_set[i].frequency+'</td>'
						append += '<td>'+devices_set[i].updated_time+'</td>'
						append += '</tr>'
						$('#auto_users').append(append);
						$("#users_list option[value = '"+devices_set[i].user+"'").remove();
					}
            	}
            });
    }
fetch_users();
$("#users_list").on("change",function(e){
	$("#selected_users_list").empty();
	var user = $("#users_list option:selected").val(); 
	var email = $("#users_list option:selected").attr("email");
	//console.log("User"+user+"Email"+email);
	if (user == "" || email == "undefined") {
		return;
	}
	else{
	append = "<tr><td>Username: </td><td>&nbsp;"+user+" </td></tr>"
	append += "<tr><td>&nbsp;Email: </td><td>&nbsp;"+email+" </td></tr>"
	$("#selected_users_list").append(append);
	}
})

$("#add_action_submit").click(function(){
	var frequency = $("#timerange").val(),
	user = $("#users_list option:selected").val();
    $.ajax({
		url: '../utils/add_atcc_auto_users.php',
		data :{user:user,frequency:frequency},
		type: 'POST',
		success: function(result) {
			alert("Added user Successfully!");
			$("#cancelModal").click();
			fetch_users();
		}
	});
})

});
function openAddmodal(){
	$("#selected_users_list").empty();
	$("#add_modal").modal();
}
function openEditModal() {
	try{
		var name = $("input[type='radio'][name='mds']:checked").parent().parent().children()[2].innerHTML
		$('#edit_list_modal').empty();
		$("#editModal").modal();
		$(".modal-body #name_modal")[0].innerHTML = name;
	}
	catch(e){
		//console.log("I was here for"+e);
		alert("Please select a action to edit");
	}
}
function editRow(){
	var name = $('#name_modal')[0].innerHTML;
	var frequency = $("#timerange_edit").val();
	//console.log(name);
	//console.log(data_entry_list);
	$.ajax({
		url: '../utils/edit_atcc_auto_users.php',
		data :{user:name,frequency:frequency},
		type: 'POST',
		success: function(result) {
			$("#cancelModal_edit").click();
			alert("Selected action has been edited")
			fetch_users();
		}
	});
}

function deleteRow() {
	try{
		var name = $("input[type='radio'][name='mds']:checked").parent().parent().children()[2].innerHTML
		$.ajax({
				url: '../utils/del_atcc_auto_users.php',
				data :{user:name},
				type: 'POST',
				success: function(result) {
					if(result.length == 2){
						alert("Connection Error please try again");
					}
					else{
						alert("Deleted the Action Succesfully");
						fetch_users();
					}
				}
            });
	}
	catch(e){
		alert("Please select a action to delete")
	}
}