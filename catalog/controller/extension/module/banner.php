<?php
class ControllerExtensionModuleBanner extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		if ($setting['column']) {
			$data['column'] = $setting['column'];
		} else {
			$data['column'] = 1;
		}
		if ($setting['margin']) {
			$data['margin'] = $setting['margin'];
		} else {
			$data['margin'] = 0;
		}
		if ($setting['style']) {
			$data['style'] = $setting['style'];
		} else {
			$data['style'] = 1;
		}

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => html_entity_decode($result['title'],  ENT_QUOTES, 'UTF-8'),
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('extension/module/banner', $data);
	}
}
