<?php
function testimonialYTShortcode($atts,$contentC,$module_id,$id,$database){
    $testimonial ='';
	$css    = '';
	$border_testimonial = $atts->border;
	$background_ = $atts->background;
	$background_image = ($atts->background != 'no_image.png' ? 'background:url('.yt_image_media($atts->background).');' : '');
	if($module_id != "0"){
		$css .= "/* Style Testimonial */ \n";
		$css .= $atts->css_internal;
		$css .= ".mod-".$id." h3{text-align:center}";
		$css .= ".mod-".$id." .item-info,.mod-".$id." .item-info h5,.mod-".$id." .item-info span{color:".$atts->title_color."}";
		$css .= ".mod-".$id." .item-img-info img{border-radius:50%; margin:0 auto; max-width:100%;}";

		$background_item = (($background_!= '') ? "background:rgba(255,255,255,0.8)" : "");
		$border_item = (($border_testimonial!= '') ? "border:".$border_testimonial : "");
		$css .= ".mod-".$id." .item{".$border_item."; ".$background_item." }";

		$file = '../catalog/view/javascript/so_page_builder/css/style_render_'.$module_id.'.css';
		// Open the file to get existing content
		$current = file_get_contents($file);
		// Append a new person to the file
		$current .= $css."\n";
		// Write the contents back to the file
		file_put_contents($file, $current);
		if(!empty($contentC)){
			add_ytshortcode("testimonial_item");
			$atts->dem = 1;
			foreach($contentC as $child => $value){
				$testimonial .= testimonial_itemYTShortcode($value,$atts,$module_id,$id,$database);
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
			$testimonial .= '<h3 class="shortcodeTitle">'.$text_name_shortcode.'</h3>';
		}
		$testimonial .= '<div class="yt-testimonial mod-'.$id.' yt-clearfix '.(($atts->display_avatar == 'true') ? "background" : "").' column-'.$atts->items_column0.' '.$atts->yt_class.'" >
		<h3>'.$text_yt_title.'</h3>
			<div id="'.$id.'"
				 class="button-type2">
				<div class="testimonial-for'.$id.'" data-effect="fadeIn" style="'.$background_image.'">';
				if(!empty($contentC)){
					add_ytshortcode("testimonial_item");
					$atts->dem = 1;
					foreach($contentC as $child => $value){
						$testimonial .= testimonial_itemYTShortcode($value,$atts,$module_id,$id,$database);
						$atts->dem += 1;
					}
				}

		$testimonial .='	</div>
			</div>';
        $testimonial .='<div class="navslider testimonial-nav'.$id.'">';
          foreach($contentC as $child => $value){
            $testimonial .= '  <div class="item">';
            $value->avatar 		= ($value->avatar != '' ? $value->avatar : 'no_image.png');
            $testimonial .='<div class="imgx">';
        		$testimonial .='<img class="img-responsive" src="' . $database['url'] . yt_image_media($value->avatar) . '" alt="" width="150" height="150"/> ';
            $testimonial .='</div>';

            $author_ 			= 'author_'.$database['language_id'];
        		$text_author 		= '';
        		if(isset($value->$author_) && ($value->$author_ != '')){
        			$text_author 	= $value->$author_;
        		}
            $testimonial .='<div class="author-title">';
            $testimonial .=$text_author ;
            $testimonial .='</div>';
            $testimonial .='  </div>' ;
            $atts->dem += 1;
          }
        $testimonial .='</div>


      <script type="text/javascript">
      $(".testimonial-for'.$id.'").slick({
       slidesToShow: 1,
       slidesToScroll: 1,
       arrows: false,
       fade: false,
       autoplay: true,
       autoplaySpeed: 2000,
       asNavFor: ".testimonial-nav'.$id.'"
      });
      $(".testimonial-nav'.$id.'").slick({
       slidesToShow: 5,
       slidesToScroll: 1,
       autoplay: true,
       asNavFor: ".testimonial-for'.$id.'",
       focusOnSelect: true
      });
      </script>


			<script type="text/javascript">
				//<![CDATA[
				jQuery(document).ready(function ($) {
					;(function (element) {
						var $element = $(element),
								$extraslider = $(".extraslider-inner", $element),
								_delay = 800,
								_duration = 500,
								_effect = "fadeIn";

						$extraslider.on("initialized.owl.carousel", function () {
							var $item_active = $(".owl-item.active", $element);
							if ($item_active.length > 1 && _effect != "none") {
								_getAnimate($item_active);
							}
							else {
								var $item = $(".owl-item", $element);
								$item.css({"opacity": 1, "filter": "alpha(opacity = 100)"});
							}
							$(".owl-nav", $element).insertBefore($extraslider);
							$(".owl-controls", $element).insertAfter($extraslider);

						});

						$extraslider.owlCarousel2({
						margin: 5,
						slideBy: 1,
						autoplay: true,
						autoplayHoverPause: true,
						autoplayTimeout: 5000,
						autoplaySpeed: 2000,
						startPosition: 0,
						mouseDrag: true,
						touchDrag: true,
						autoWidth: false,
						responsive: {
							0: 	{ items: '.$atts->items_column4.' } ,
							480: { items: '.$atts->items_column3.' },
							768: { items: '.$atts->items_column2.' },
							992: { items: '.$atts->items_column1.' },
							1200: {items: '.$atts->items_column0.'}
						},
							dotClass: "owl2-dot",
							dotsClass: "owl2-dots",
							dots: true,
							dotsSpeed:5000,
							nav: true,
							loop: true,
							navSpeed: 2000,
							navText: ["", ""],
							navClass: ["owl2-prev", "owl2-next"]

						});
						function _getAnimate($el) {
							if (_effect == "none") return;
							//if ($.browser.msie && parseInt($.browser.version, 10) <= 9) return;
							$extraslider.removeClass("extra-animate");
							$el.each(function (i) {
								var $_el = $(this);
								$(this).css({
									"-webkit-animation": _effect + " " + _duration + "ms ease both",
									"-moz-animation": _effect + " " + _duration + "ms ease both",
									"-o-animation": _effect + " " + _duration + "ms ease both",
									"animation": _effect + " " + _duration + "ms ease both",
									"-webkit-animation-delay": +i * _delay + "ms",
									"-moz-animation-delay": +i * _delay + "ms",
									"-o-animation-delay": +i * _delay + "ms",
									"animation-delay": +i * _delay + "ms",
									"opacity": 1
								}).animate({
									opacity: 1
								});

								if (i == $el.size() - 1) {
									$extraslider.addClass("extra-animate");
								}
							});
						}

						function _UngetAnimate($el) {
							$el.each(function (i) {
								$(this).css({
									"animation": "",
									"-webkit-animation": "",
									"-moz-animation": "",
									"-o-animation": "",
									"opacity": 0
								});
							});
						}

					})("#'.$id.'");
				});
			</script>
		</div>';
	}
    return $testimonial;
}
?>
