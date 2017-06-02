<?php
class ControllerExtensionModuleManufacturer extends Controller {
	public function index() {
		$this->load->language('extension/module/manufacturer');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['manufacturer_id'] = $this->request->get['manufacturer_id'];
		} else {
			$data['manufacturer_id'] = 0;
		}


		$this->load->model('catalog/manufacturer');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$manufacturers = $this->model_catalog_manufacturer->getManufacturers(0);

		foreach ($manufacturers as $category) {
			$children_data = array();


			$filter_data = array();

			$data['categories'][] = array(
				'manufacturer_id' => $category['manufacturer_id'],
				'name'        => $category['name'],
				'href'        => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $category['manufacturer_id'])
			);
		}

		return $this->load->view('extension/module/manufacturer', $data);
	}
}
