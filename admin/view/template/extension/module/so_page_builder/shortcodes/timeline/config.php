<?php
class YT_Shortcode_timeline_config {
	static function get_config($language,$value) {
		$multiLanguage = explode(',',$value['language']);
		$title_arr = array();
		$content_arr = array();
		$name_shortcode_arr = array();
		$name_shortcode = (is_array($value) && isset($value[0]['name_shortcode']) ? $value[0]['name_shortcode'] : $language->get('shortcode_timeline'));
		$yt_title = (is_array($value) && isset($value[0]['yt_title']) ? $value[0]['yt_title'] : 'Title');
		foreach($multiLanguage as $language_){
			$name_shortcode_arr['name_shortcode_'.$language_] = (is_array($value) && isset($value[0]['name_shortcode_'.$language_]) ? $value[0]['name_shortcode_'.$language_] : $name_shortcode);
			$title_arr['yt_title_'.$language_] = (is_array($value) && isset($value[0]['yt_title_'.$language_]) ? $value[0]['yt_title_'.$language_] : $yt_title);
		}
		return array(
			'name_shortcode' => array(
				'type' 		=> 'textLanguage',
				'default' 	=> (is_array($value) && isset($value[0]['name_shortcode']) ? $value[0]['name_shortcode'] : $language->get('shortcode_timeline')),
				'values'  	=> $name_shortcode_arr,
				'name'    	=> $language->get('shortcode_name_shortcode'),
				'desc'    	=> $language->get('shortcode_name_shortcode_desc'),
				'child'  => array(
	                'name_shortcode_status' => array(
						'type' 		=> 'bool',
						'default' 	=> (is_array($value) && isset($value[0]['name_shortcode_status']) ? $value[0]['name_shortcode_status'] : 'no'),
						'name' 		=> $language->get('shortcode_name_shortcode_status'),
						'desc' 		=> $language->get('shortcode_name_shortcode_status_desc'),
					)
	            )
			),
			'yt_title'=> array(
				'type' 		=> 'textLanguage',
				'default' 	=> (is_array($value) && isset($value[0]['yt_title']) ? $value[0]['yt_title'] : 'Title'),
				'values'  	=> $title_arr,
				'name' 		=> $language->get('shortcode_title'),
				'desc' 		=> $language->get('shortcode_title_desc'),
				'child' 	=> array(
					'display_avatar' => array(
						'type'		=> 'bool',
						'default' 	=> (is_array($value) && isset($value[0]['display_avatar']) ? $value[0]['display_avatar'] : 'yes'),
						'name' 		=> $language->get('shortcode_timeline_display_avatar'),
						'desc' 		=> $language->get('shortcode_timeline_display_avatar_desc'),
					),
				),
			),
			 
			'yt_class'=> array(
				'default' 	=> (is_array($value) && isset($value[0]['yt_class']) ? $value[0]['yt_class'] : ''),
				'name'  	=> $language->get('shortcode_yt_class'),
				'desc'  	=> $language->get('shortcode_yt_class_desc')
			),
			'css_internal'=> array(
				'type' 		=> 'textarea',
				'default' 	=> (is_array($value) && isset($value[0]['css_internal']) ? $value[0]['css_internal'] : ''),
				'name'  	=> $language->get('shortcode_css_internal'),
				'desc'  	=> $language->get('shortcode_css_internal_desc')
			),
		);
	}
}

?>
