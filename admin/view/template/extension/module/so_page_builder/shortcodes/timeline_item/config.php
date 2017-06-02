<?php
class YT_Shortcode_timeline_item_config {
	static function get_config($language,$value) {
		$multiLanguage = explode(',',$value['language']);
		$date_arr = array();
		$position_arr = array();
		$content_arr = array();
		$date = (is_array($value) && isset($value['date']) ? $value['date'] : 'TESTIMONIAL AUTHOR');
		$position = (is_array($value) && isset($value['position']) ? $value['position'] : 'AUTHOR POSITION');
		$content = (is_array($value) && isset($value['content']) ? $value['content'] : 'Add content here');
		foreach($multiLanguage as $language_)
		{
			$date_arr['date_'.$language_] = (is_array($value) && isset($value['date_'.$language_]) ? $value['date_'.$language_] : $date);
			$position_arr['position_'.$language_] = (is_array($value) && isset($value['position_'.$language_]) ? $value['position_'.$language_] : $position);
			$content_arr['content_'.$language_] = (is_array($value) && isset($value['content_'.$language_]) ? $value['content_'.$language_] : $content);
		}
		return array(
			'date' => array(
				'type' 		=> 'text',
				'default'	=> (is_array($value) && isset($value['date']) ? $value['date'] : 'Year'),
				'values'	=> $date_arr,
				'name' 		=> $language->get('shortcode_timeline_date'),
				'desc' 		=> $language->get('shortcode_timeline_date_desc'),
				'child' => array(

					'avatar' => array(
						'type' 		=> 'media',
						'default'	=> (is_array($value) && isset($value['avatar']) && $value['avatar'] != "" ? $value['avatar'] : 'no_image.png'),
						'name' 		=> $language->get('shortcode_timeline_avatar'),
						'desc' 		=> $language->get('shortcode_timeline_avatar_desc')
					),
				),
			),
			'content' => array(
				'type' 		=> 'textareaEditorLanguage',
				'default' 	=> (is_array($value) && isset($value['text_content']) ? $value['text_content'] : 'Add content here'),
				'values'	=> $content_arr,
				'name' 		=> $language->get('shortcode_content'),

			),
		);
	}
}

?>
