<?php
class ControllerInformationMaps extends Controller {
	private $error = array();

	public function index() {

	 $json = array();

		if (isset( $this->request->post['cate']) && $this->request->post['cate']) {
		 	$cate = $this->request->post['cate'];
		} else {
			$cate = '';
		}
		if (isset( $this->request->post['city']) && $this->request->post['city']) {
		 	$city = $this->request->post['city'];
		} else {
			$city = '';
		}
		if (isset( $this->request->post['state']) && $this->request->post['state']) {
		 	$state = $this->request->post['state'];
		} else {
			$state = '';
		}
		if (isset( $this->request->post['keyword']) && $this->request->post['keyword']) {
		 	$keyword = $this->request->post['keyword'];
		} else {
			$keyword = '';
		}

		 $this->load->model('localisation/location');
		 $this->load->model('catalog/manufacturer');
		 $this->load->model('tool/image');

		 $filter_data = array(
			 'manufacturer_id' => $cate,
			 'country_id'        => $city,
			 'zone_id'       => $state,
			 'keyword'       => $keyword,
		 );

		 $results = $this->model_localisation_location->getLocations($filter_data);
		 $locations = array();
		 foreach ($results as $result) {
			 $geocode = explode(",", $result['geocode']);
			 $lat = $geocode[0];
			 $lon = $geocode[1];

			 $image = $this->model_tool_image->resize($result['image'], 70,70);
			 //$manufacturer =  $this->model_catalog_manufacturer->getManufacturer($result['manufacturer_id']);

			 if ($result['manufacturer_id'] == 1) {
			 	$cat_name = "TRUNG TÂM DỊCH VỤ KHÁCH HÀNG";
			} else {
				$cat_name = "ĐẠI LÝ ỦY QUYỀN";
			}

			 $locations[] = array(
				 "id" => $result['location_id'],
		     "cat_id" => $result['manufacturer_id'],
		     "cat_name" => $cat_name,
		     "title" => $result['name'],
		     "address" => $result['address'],
		     "comment" => $result['comment'],
		     "telephone" => $result['telephone'],
		     "fax" => $result['fax'],
		     "picture" => $image,
		     "time_open" => $result['open'],
		     "date" => "23\/05\/2014",
		     "detailLink" => "#",
		     "lat" => $lat,
		     "lon" => $lon,
		     "distance" => 0,
		     "icon" => "../catalog/view/javascript/wbc_store/images/map_localization.png",
		     "is_current" => 0
			 );
		 }
		 $sort_order = array();

		 foreach ($locations as $key => $value) {
			 $sort_order[$key] = $value['title'];
		 }

		 array_multisort($sort_order, SORT_ASC, $locations);

		 $json = array(
			 'data' => $locations,
			 'total' => count($results),
			 'page' => 1,
			 'pagesize' => 500
		 );




	 $this->response->addHeader('Content-Type: application/json');
	 $this->response->setOutput(json_encode($json));
 }

}
