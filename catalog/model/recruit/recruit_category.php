<?php
class ModelRecruitRecruitCategory extends Model {
	public function getRecruitCategory($recruit_category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "recruit_category c LEFT JOIN " . DB_PREFIX . "recruit_category_description cd ON (c.recruit_category_id = cd.recruit_category_id) LEFT JOIN " . DB_PREFIX . "recruit_category_to_store c2s ON (c.recruit_category_id = c2s.recruit_category_id) WHERE c.recruit_category_id = '" . (int)$recruit_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		
		return $query->row;
	}
	
	public function getRecruitCategories($parent_id = 0) {

		$recruit_category_data = $this->cache->get('recruit_category.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

		if (!$recruit_category_data && !is_array($recruit_category_data)) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_category c LEFT JOIN " . DB_PREFIX . "recruit_category_description cd ON (c.recruit_category_id = cd.recruit_category_id) LEFT JOIN " . DB_PREFIX . "recruit_category_to_store c2s ON (c.recruit_category_id = c2s.recruit_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' AND c.sort_order <> '-1' ORDER BY c.sort_order, LCASE(cd.name)");

			$recruit_category_data = $query->rows;

			$this->cache->set('recruit_category.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $recruit_category_data);
		}

		return $recruit_category_data;
	}
				
	public function getTotalRecruitCategoriesByRecruitCategoryId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit_category c LEFT JOIN " . DB_PREFIX . "recruit_category_to_store c2s ON (c.recruit_category_id = c2s.recruit_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1' AND c.sort_order <> '-1'");
		
		return $query->row['total'];
	}
	
	public function getRecruitCategoriesByParentId($recruit_category_id) {
		$recruit_category_data = array();
		
		$recruit_category_data[] = $recruit_category_id;
		
		$recruit_category_query = $this->db->query("SELECT recruit_category_id FROM " . DB_PREFIX . "recruit_category WHERE parent_id = '" . (int)$recruit_category_id . "'");
		
		foreach ($recruit_category_query->rows as $recruit_category) {
			$children = $this->getRecruitCategoriesByParentId($recruit_category['recruit_category_id']);
			
			if ($children) {
				$recruit_category_data = array_merge($children, $recruit_category_data);
			}			
		}
		
		return $recruit_category_data;
	}
}