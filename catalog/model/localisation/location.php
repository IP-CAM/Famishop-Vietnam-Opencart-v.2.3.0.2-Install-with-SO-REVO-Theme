<?php
class ModelLocalisationLocation extends Model {
	public function getLocation($location_id) {
		$query = $this->db->query("SELECT location_id, name, address, geocode, telephone, fax, image, open, comment FROM " . DB_PREFIX . "location WHERE location_id = '" . (int)$location_id . "'");

		return $query->row;
	}


	public function getLocations($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "location WHERE 1=1" ;


		 if (!empty($data['manufacturer_id'])) {
			 $sql .= " AND manufacturer_id = '" . (int)$data['manufacturer_id'] . "'";
		 }
		 if (!empty($data['country_id'])) {
			 $sql .= " AND country_id = '" . (int)$data['country_id'] . "'";
		 }

		 if (!empty($data['zone_id'])) {
			 $sql .= " AND zone_id = '" . (int)$data['zone_id'] . "'";
		 }

		 if (!empty($data['keyword'])) {
			 $sql .= " AND address LIKE '%".$data['keyword']."%' OR name LIKE '%".$data['keyword']."%'";
		 }

		$query = $this->db->query($sql);
		return $query->rows;
	}


}
