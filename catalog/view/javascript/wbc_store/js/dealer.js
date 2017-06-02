
// Get from query hash
String.prototype.getQueryHash = function (name, defaultVal) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\#&$]" + name + "=([^&#]*)"),
		results = regex.exec(this);
	return results == null ? (defaultVal == undefined ? "" : defaultVal) : decodeURIComponent(results[1].replace(/\+/g, " "));
};

// function cityChange(country_id)
// {
// 	var data =  "country="+country_id;
// 	$.ajax({
// 		async: true,
// 		url: 'index.php?route=account/account/country',
// 		type: 'POST',
// 		data: data ,
// 		success: function (html) {
// 			$("#state").html(html) ;
// 		}
// 	});
// }


function cityChange(country_id) {
 	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + country_id,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'city\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {

			html = '<option value="">Chọn quận huyện</option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected">Không tìm thấy</option>';
			}

			$('#state').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
};




function scrollToDealer () {
	var targetOffset = $("#boxMapSearch").offset().top - 120;
	jQuery('html,body').animate({scrollTop: targetOffset},1000);
}

$(document).ready(function(){

	$('#btn_list').click(function () {
		var $this = $(this);
		if ($this.hasClass('active')) {
			$this.removeClass();
			$('ul.list-filters').css({
				"display": "none"
			});
		} else {
			$this.addClass('active');
			$('ul.list-filters').css({
				"display": "block"
			});
		}
	});

	/*
	$(".result-wrapper").slimScroll({
		height: '560px',
		size: '10px',
		position: 'right',
		color: '#cccccc',
		alwaysVisible: true,
		distance: '20px',
		railVisible: false,
		railColor: '#222',
		railOpacity: 1,
		wheelStep: 10,
		allowPageScroll: true,
		disableFadeOut: true
	});
	*/
});
