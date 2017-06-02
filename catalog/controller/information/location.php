<?php
class ControllerInformationLocation extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('information/location');

		$this->document->setTitle($this->language->get('heading_title'));

    $this->document->addStyle('catalog/view/javascript/wbc_store/js/dealer.css');
    $this->document->addStyle('catalog/view/javascript/wbc_store/js/maps.css');
    $this->document->addStyle('catalog/view/javascript/wbc_store/js/dealer.css');
    $this->document->addScript('catalog/view/javascript/wbc_store/js/jquery.slimscroll.min.js');
    $this->document->addScript('//maps.google.com/maps/api/js?key=AIzaSyC0R5qXRO_jgesJHdywgyYYG6UKEeGrYAU&libraries=drawing,geometry,places&language=vi');
    $this->document->addScript('catalog/view/javascript/wbc_store/js/jquery-migrate.min.js');
    $this->document->addScript('catalog/view/javascript/wbc_store/js/dealer.js');
    $this->document->addScript('catalog/view/javascript/wbc_store/js/yetii.js');
    $this->document->addScript('catalog/view/javascript/wbc_store/js/jquery.BlcokUI.js');
    $this->document->addScript('catalog/view/javascript/wbc_store/js/jquery.hiddenDropbox.js');
    $this->document->addScript('catalog/view/javascript/wbc_store/js/device.min.js');
    $this->document->addScript('catalog/view/javascript/wbc_store/js/jquery.tooltipmarker.js');
    $this->document->addScript('catalog/view/javascript/wbc_store/js/mapLibs.js');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/location')
		);

		$this->document->setTitle( $this->language->get('heading_title') );
		$data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		$this->load->model('catalog/manufacturer');
		$data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();

		if (isset($this->request->get['cat'])) {
			$data['cat'] = $this->request->get['cat'];
		} else {
			$data['cat'] = '';
		}

		if (isset($this->request->get['city'])) {
			$data['city'] = $this->request->get['city'];
		} else {
			$data['city'] = '';
		}





		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/location', $data));
	}


}
