<?php
function timeline_itemYTShortcode($atts,$contentP,$module_id,$id,$database){
	$display_avatar = $contentP->display_avatar;
    $css='';
	$timeline_item ='';
	$timeline_avatar = '';
	/*------Check isset Value Before Call value---------*/
 		if(isset($atts->date) && ($atts->date!= '')){
			$text_date 	= $atts->date;
		} else {
			$text_date = 2017;
		}

		$position_ 			= 'position_'.$database['language_id'];
		$text_position 		= '';
		if(isset($atts->$position_) && ($atts->$position_ != '')){
			$text_position 	= $atts->$position_;
		}

		$content_ 			= 'content_'.$database['language_id'];
		$text_content 		= '';
		if(isset($atts->$content_) && ($atts->$content_ != '')){
			$text_content 	= $atts->$content_;
		}

	/*--------------------------------------------------*/
		$atts->avatar = ($atts->avatar != '' ? $atts->avatar : 'no_image.png');

		//$timeline_avatar .='<img class="img-responsive" src="' . $database['url'] . yt_image_media($atts->avatar) . '" alt="'.$text_date.'" width="150" height="150"/> ';
		$timeline_item = '<div class="item" data-nav="'.$text_date.'">
								<div class="item-wrap" style="background-image:url(' . $database['url'] . yt_image_media($atts->avatar) . ')">
									<div class="item-wrap-inner">';

										$timeline_item .= '			<div class="item-info">';
										$timeline_item .= '<div class="titledate">'.$text_date.'</div>';
									if($text_content != ''){
										$timeline_item .=			$text_content;
									}


		$timeline_item .= '			</div>
									</div>
								</div>
							</div>';
	return $timeline_item;
}
?>
