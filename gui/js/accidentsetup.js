$(document).ready(function(){

	$.ajax({
                url: '../utils/get_username.php',
                success: function(result) {
                	    if(result.length > 30){
                                window.location = "../index.html"
                        }
                uname=result.trim();
                }  
                
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
	


	$.ajax({
		url:'../utils/get_accident_actions.php',
		method:'POST',
		success:function(res){
			res=$.parseJSON(res);
			for(var i=0;i<res.length;i++){
				$('.type_id').append('<option value='+res[i].TypeID+'>'+res[i].name+'</option>');
				$('.up_type_id').append('<option value='+res[i].TypeID+'>'+res[i].name+'</option>');
			}
		}
	});

	$.ajax({
		url:'../utils/get_accidents.php',
		method:'POST',
		success:function(res){
			res=jQuery.parseJSON(res);

			for (var i = 0; i < res.length; i++) {

				$('.acc_table tbody').append('<tr><td colspan="1"><input type="radio" name="acc_record"></td><td class="a_scn">'+res[i].SystemCodeNumber+'</td><td class="a_sdesc">'+res[i].ShortDescription+'</td><td class="a_ldesc">'+res[i].LongDescription+'</td><td class="a_nor">'+res[i].Northing+'</td><td class="a_eas">'+res[i].Easting+'</td><td class="a_tid">'+res[i].AccidentType+'</td><td class="a_ctime">'+res[i].CreationDate+'</td><td class="a_atime">'+res[i].AccidentTime+'</td><td class="a_etime">'+res[i].EndDate+'</td><td class="a_sev">'+res[i].Severity+'</td><td class="a_rby">'+res[i].ReportedBy+'</td><td class="a_cby">'+res[i].CreatedBy+'</td></tr>')
			}

		}
	})

	$('.add_acc_btn').click(function(){

		var scn=$('.scn').val(),
			sdesc=$('.sdesc').val(),
			ldesc=$('.ldesc').val(),
			nor=$('.northing').val(),
			eas=$('.easting').val(),
			tid=$('.type_id').val(),
			accDT=$('.acc_datetime').val(),
			edate=$('.end_datetime').val(),
			sev=$('#severity').val(),
			rep=$('.reported').val(),
			mod=$('.modified').val();

		if(sev == "0")
			sev=""	

		$.ajax({
			url:'../utils/add_accident.php',
			method:'POST',
			data:{SystemCodeNumber:scn,ShortDescription:sdesc,LongDescription:ldesc,Northing:nor,Easting:eas,TypeID:tid,AccidentTime:accDT,CreatedBy:uname,EndDate:edate,Severity:sev,ReportedBy:rep,ModifiedBy:mod,isedit:0},
			success:function(res){
				//alert(res);
				location.reload();

			}
		});
	})

	$('.update_group_modal').click(function(){
		if($('input[name=acc_record]:checked').length == 0){	
				alert('Select a record to edit');
				return;
			}
	
		var currEle=$('input[name=acc_record]:checked').closest('tr');

		$('.up_scn').val($('.a_scn',currEle).html());
		$('.up_sdesc').val($('.a_sdesc',currEle).html());
		$('.up_ldesc').val($('.a_ldesc',currEle).html());
		$('.up_northing').val($('.a_nor',currEle).html());
		$('.up_easting').val($('.a_eas',currEle).html());
		$('.up_type_id').html('<option>'+$('.a_tid',currEle).html()+'</option>');
		$('.up_acc_datetime').val($('.a_atime',currEle).html());
		$('.up_end_datetime').val($('.a_etime',currEle).html());
		$('#up_severity').val($('.a_sev',currEle).html());
		$('#up_sev_out').val($('.a_sev',currEle).html())
		$('.up_reported').val($('.a_rby',currEle).html());
		$('.up_modified').val($('.a_mby',currEle).html());

	});
	
	$('.update_acc_btn').click(function(){	
		

		var scn=$('.up_scn').val(),
			sdesc=$('.up_sdesc').val(),
			ldesc=$('.up_ldesc').val(),
			nor=$('.up_northing').val(),
			eas=$('.up_easting').val(),
			tid=$('.type_id option:contains("'+$('.up_type_id').text()+'")').val();
			accDT=$('.up_acc_datetime').val(),
			edate=$('.up_end_datetime').val(),
			sev=$('#up_severity').val(),
			rep=$('.up_reported').val(),
			mod=$('.up_modified').val();

		if(edate == ""){
			alert('Enter End Date');
			return;
		}	
		if(rep == ""){
			alert('Enter the Reported By field');
			return;
		}
		if(mod == ""){
			alert("Enter the Modified By field");
			return;
		}
		if(sev == "0"){
			alert('Select Severity');
			return;
		}

		$.ajax({
			url:'../utils/add_accident.php',
			method:'POST',
			data:{SystemCodeNumber:scn,ShortDescription:sdesc,LongDescription:ldesc,Northing:nor,Easting:eas,TypeID:tid,AccidentTime:accDT,CreatedBy:uname,EndDate:edate,Severity:sev,ReportedBy:rep,ModifiedBy:mod,isedit:1},
			success:function(res){
				//alert(res);
				location.reload();

				
			}
		});
	});

	$('.delete_group').click(function(){
			if($('input[name=acc_record]:checked').length == 0){	
				alert('Select a record to delete');
				return;
			}	
		var delRecord=$('.a_scn',$('input[name=acc_record]:checked').closest('tr')).html()
		console.log(delRecord);	

		$.ajax({
			url:'../utils/delete_accident.php',
			method:'POST',
			data:{SystemCodeNumber:delRecord},
			success:function(res){
				if(res)
					location.reload();

			}
		})
	
	})
		
		



	

})