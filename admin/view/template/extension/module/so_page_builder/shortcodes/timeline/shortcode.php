<?php
function timelineYTShortcode($atts,$contentC,$module_id,$id,$database){
    $timeline ='';
	$css    = '';
	if($module_id != "0"){
		$css .= "/* Style Testimonial */ \n";
		$css .= $atts->css_internal;
		$css .= ".mod-".$id." h3{text-align:center}";
		$css .= ".mod-".$id." .item-img-info img{border-radius:50%; margin:0 auto; max-width:100%;}";

		$file = '../catalog/view/javascript/so_page_builder/css/style_render_'.$module_id.'.css';
		// Open the file to get existing content
		$current = file_get_contents($file);
		// Append a new person to the file
		$current .= $css."\n";
		// Write the contents back to the file
		file_put_contents($file, $current);
		if(!empty($contentC)){
			add_ytshortcode("timeline_item");
			$atts->dem = 1;
			foreach($contentC as $child => $value){
				$timeline .= timeline_itemYTShortcode($value,$atts,$module_id,$id,$database);
				$atts->dem += 1;
			}
		}
	}else{
	/*------Check isset Value Before Call value---------*/
		$name_shortcode_	= 'name_shortcode_'.$database['language_id'];
		$text_name_shortcode = '';
		if(isset($atts->$name_shortcode_) && ($atts->$name_shortcode_ != '')){
			$text_name_shortcode = $atts->$name_shortcode_;
		}
		$yt_title_ 			= 'yt_title_'.$database['language_id'];
		$text_yt_title = '';
		if(isset($atts->$yt_title_) && ($atts->$yt_title_ != '')){
			$text_yt_title = $atts->$yt_title_;
		}
	/*--------------------------------------------------*/
		if($atts->name_shortcode_status == "yes" && $text_name_shortcode != ''){
			$timeline .= '<h3 class="shortcodeTitle">'.$text_name_shortcode.'</h3>';
		}
		$timeline .= '<div class="yt-timeline mod-'.$id.' yt-clearfix '.(($atts->display_avatar == 'true') ? "background" : "").' '.$atts->yt_class.'" >

			<div id="'.$id.'"
				 class="button-type2">
				<div class="timeline-for'.$id.'" data-effect="fadeIn" style="">';
				if(!empty($contentC)){
					add_ytshortcode("timeline_item");
					$atts->dem = 1;
					foreach($contentC as $child => $value){
						$timeline .= timeline_itemYTShortcode($value,$atts,$module_id,$id,$database);
						$atts->dem += 1;
					}
				}

		$timeline .='	</div></div>';



    $timeline .='<script type="text/javascript">
      $(".timeline-for'.$id.'").slick({

        autoplay: false,
        dots: true,
        fade:true,
        customPaging : function(slider, i) {
            var thumb = $(slider.$slides[i]).data("nav");
            return "<a> "+thumb+" </a>";
        },

        responsive: [{
            breakpoint: 500,
            settings: {
                dots: false,
                arrows: true,
                infinite: false,
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }]


      });

      </script>



		</div>';
	}
    return $timeline;
}
?>
