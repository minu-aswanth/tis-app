$(document).ready(function(){
	var logic = function( currentDateTime ){
	        if (currentDateTime && currentDateTime.getDay() == 6){
	            this.setOptions({
	                minTime:'11:00'
	            });
	        }
	        else
	            this.setOptions({
	                minTime:'8:00'
	            });
		    };

		    $('.datepicker').datetimepicker({
		    onChangeDateTime:logic,
		    onShow:logic
		    });
	
	var selector = '[data-rangeslider]';
	var $element = $(selector);	
	var textContent = ('textContent' in document) ? 'textContent' : 'innerText';

	function valueOutput(element) {
            var value = element.value;
            var output = element.parentNode.getElementsByTagName('output')[0] || element.parentNode.parentNode.getElementsByTagName('output')[0];
            output[textContent] = value;
        }

    $(document).on('input', 'input[type="range"], ' + selector, function(e) {
        valueOutput(e.target);
    });

	$element.rangeslider();


	$('.search').click(function(){
		var type=$('.accType').val().toLowerCase(),
			edtime=$('.accEDate').val(),
			sev=$('#accSev').val(),
			adtime=$('.accSDate').val();

		var dNow = new Date();
    	var localdate= dNow.getFullYear() + '-' + (dNow.getMonth()+1) + '-' + (dNow.getDate()+1) + ' 23:59:59';

		if(adtime == "")
			adtime = "0000-00-00 00:00:00"

		if(edtime == "")
			edtime = localdate;

		if(sev == "0")
			sev=""

		$.ajax({
			url:'../utils/filter_accidents.php',
			method:'POST',
			data:{AccidentType:type,EndTime:edtime,Severity:sev,StartTime:adtime},
			success:function(res){
				res=jQuery.parseJSON(res);
				if (res.length == 0 ) {
					$('.acc_table tbody tr').has('td').remove();
					alert("No Result Found");
				}
				else{
					$('.acc_table tbody tr').has('td').remove();
					for (var i = 0; i < res.length; i++) {
						$('.acc_table tbody').append('<tr><td colspan="1"><input type="radio" name="acc_record"></td><td class="a_scn">'+res[i].SystemCodeNumber+'</td><td class="a_sdesc">'+res[i].ShortDescription+'</td><td class="a_ldesc">'+res[i].LongDescription+'</td><td class="a_nor">'+res[i].Northing+'</td><td class="a_eas">'+res[i].Easting+'</td><td class="a_tid">'+res[i].AccidentType+'</td><td class="a_ctime">'+res[i].CreationDate+'</td><td class="a_atime">'+res[i].AccidentTime+'</td><td class="a_etime">'+res[i].EndDate+'</td><td class="a_sev">'+res[i].Severity+'</td><td class="a_rby">'+res[i].ReportedBy+'</td><td class="a_cby">'+res[i].CreatedBy+'</td><td style="color:blue;" class="view_report" scn="'+res[i].SystemCodeNumber+'">View Report</td></tr>')
					}
				}
			}
		})	
	})
	$
	$(document).on('click', ".view_report", function() {
		var scn = $(this).attr("scn");
		var mid = $(".accType").val().toLowerCase();
		$("#name_modal")[0].innerHTML = scn;
		$("#chk_modal tbody").empty();
		$.ajax({
			url:'../utils/performance_reports.php',
			method:'POST',
			data:{SystemCodeNumber:scn,MainID:mid},              
			success:function(res){
				res=jQuery.parseJSON(res);
				var table = "";
				for (var i = 0; i < res.length; i++) {
					$("#action_modal")[0].innerHTML = res[i].Action;
					if (res[i].Checklist_type != "Camera" && res[i].Checklist_type !="VMS") {
						table += "<tr><td>"+res[i].Checklist_type+"</td><td>"+res[i].Informed+"</td><td>"+res[i].Informed_time+"</td><td>"+res[i].Arrived+"</td><td>"+res[i].Arrived_time+"</td><td>"+res[i].Resolved+"</td><td>"+res[i].Resolved_time+"</td></tr>";
					}
					else{
						table += "<tr><td>"+res[i].Checklist_type+"</td><td>N/A</td><td>N/A</td><td>N/A</td><td>N/A</td><td>N/A</td><td>N/A</td></tr>";
					}
				}
				$("#chk_modal tbody").append(table);
				$("#viewReportModal").modal();
			}
		})
	})	    
})