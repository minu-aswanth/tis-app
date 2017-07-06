$(document).ready(function(){
	fetch_devices = function(){
				$('#vms_set_msg').empty();
                $.ajax({
                	url: '../utils/vms_set_msg.php',
                	success: function(result) {
						var devices_set = jQuery.parseJSON(result);
						for(i=0; i<devices_set.length;i++){
							append = '<tr>'
							append += '<td><input type="radio" name="mds"></td>'
							append += '<td>'+(i+1)+'</td>'
							//append += '<td>'+devices_set[i].MessageID+'</td>'
							append += '<td>'+devices_set[i].topLineText+' '
							append += devices_set[i].midLineText+' '
							append += devices_set[i].botLineText+'</td>'
							append += '<td>'+devices_set[i].Category+'</td>'
							append += '<td>'+devices_set[i].CommandPhrase+'</td>'
							append += '<td style="display:none;">'+devices_set[i].MessageID+'</td>'
							append += '</tr>'
							$('#vms_set_msg').append(append);
						}
                	}
                });
        }
    fetch_devices();
});


function update() {
	 var size = parseInt($('#maxsize').val(), 20);

	 if (!isNaN(size)) {
	 	var top = $('#tMessageText').val();
	 	var mid = $('#mMessageText').val();
	 	var bot = $('#bMessageText').val();

		 $('.messageTextVal').html(top+"<br>"+mid+"<br>"+bot);

		 $('.jtextfill').textfill({
			 maxFontPixels: size
		 });
	 }
 }

 $(function () {
	 $('#maxsize').keyup(update);
	 $('#tMessageText').keyup(update);
	 $('#mMessageText').keyup(update);
	 $('#bMessageText').keyup(update);
	 update()
 });



 function update_modal() {
	 var size = parseInt($('#maxsize_modal').val(), 20);

	 if (!isNaN(size)) {
	 	var top = $('#tMessageText_modal').val();
	 	var mid = $('#mMessageText_modal').val();
	 	var bot = $('#bMessageText_modal').val();

		 $('.messageTextVal_modal').html(top+"<br>"+mid+"<br>"+bot);

		 $('.jtextfill_modal').textfill({
			 maxFontPixels: size
		 });
	 }
 }

 $(function () {
	 $('#maxsize_modal').keyup(update_modal);
	 $('#tMessageText_modal').keyup(update_modal);
	 $('#mMessageText_modal').keyup(update_modal);
	 $('#bMessageText_modal').keyup(update_modal);
	 update_modal()
 });
