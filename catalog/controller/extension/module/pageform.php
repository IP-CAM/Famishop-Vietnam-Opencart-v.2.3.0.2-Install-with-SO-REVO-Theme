<?php
class ControllerExtensionModulePageform extends Controller {
	public function index($setting) {
		static $module = 0;
		$this->load->language('page/form');
		$this->load->model('page/form');


		if (isset($setting['page_form_id'])) {
			$page_form_id = (int)$setting['page_form_id'];
		}
 		$page_form_info = $this->model_page_form->getPageForm($page_form_id);


		if ($page_form_info) {

			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');


			$data['page_form_id'] = $page_form_info['page_form_id'];

			$data['text_select'] = $this->language->get('text_select');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['text_loading'] = $this->language->get('text_loading');
			$data['text_none'] = $this->language->get('text_none');

			$data['name'] = $page_form_info['title'];

			$data['description'] = html_entity_decode($page_form_info['description'], ENT_QUOTES, 'UTF-8');

			$data['fieldset_title'] = $page_form_info['fieldset_title'];
			$data['button_continue'] = ($page_form_info['submit_button']) ? $page_form_info['submit_button'] :  $this->language->get('button_continue');


			// Page Form Options
			$data['page_form_options'] = $this->model_page_form->getPageFormOptions($page_form_id);
			$data['country_exists'] = $this->model_page_form->getPageFormOptionsCountry($page_form_id);

			$this->load->model('localisation/country');
			$data['countries'] = $this->model_localisation_country->getCountries();


			$this->load->model('localisation/zone');
			$data['zones'] = $this->model_localisation_zone->getZonesByCountryId($this->config->get('config_country_id'));

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && $page_form_info['captcha']) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}


			$data['module_id'] = $module++;

				return $this->load->view('extension/module/pageform', $data);

		}



		//return $this->load->view('extension/module/pageform', $data);
	}
}
