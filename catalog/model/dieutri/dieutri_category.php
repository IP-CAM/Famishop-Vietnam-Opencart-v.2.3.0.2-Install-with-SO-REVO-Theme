<?php
class ModelDieutriDieutriCategory extends Model {
	public function getDieutriCategory($dieutri_category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "dieutri_category c LEFT JOIN " . DB_PREFIX . "dieutri_category_description cd ON (c.dieutri_category_id = cd.dieutri_category_id) LEFT JOIN " . DB_PREFIX . "dieutri_category_to_store c2s ON (c.dieutri_category_id = c2s.dieutri_category_id) WHERE c.dieutri_category_id = '" . (int)$dieutri_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		
		return $query->row;
	}
	
	public function getDieutriCategories($parent_id = 0) {

		$dieutri_category_data = $this->cache->get('dieutri_category.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

		if (!$dieutri_category_data && !is_array($dieutri_category_data)) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_category c LEFT JOIN " . DB_PREFIX . "dieutri_category_description cd ON (c.dieutri_category_id = cd.dieutri_category_id) LEFT JOIN " . DB_PREFIX . "dieutri_category_to_store c2s ON (c.dieutri_category_id = c2s.dieutri_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' AND c.sort_order <> '-1' ORDER BY c.sort_order, LCASE(cd.name)");

			$dieutri_category_data = $query->rows;

			$this->cache->set('dieutri_category.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $dieutri_category_data);
		}

		return $dieutri_category_data;
	}
				
	public function getTotalDieutriCategoriesByDieutriCategoryId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "dieutri_category c LEFT JOIN " . DB_PREFIX . "dieutri_category_to_store c2s ON (c.dieutri_category_id = c2s.dieutri_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1' AND c.sort_order <> '-1'");
		
		return $query->row['total'];
	}
	
	public function getDieutriCategoriesByParentId($dieutri_category_id) {
		$dieutri_category_data = array();
		
		$dieutri_category_data[] = $dieutri_category_id;
		
		$dieutri_category_query = $this->db->query("SELECT dieutri_category_id FROM " . DB_PREFIX . "dieutri_category WHERE parent_id = '" . (int)$dieutri_category_id . "'");
		
		foreach ($dieutri_category_query->rows as $dieutri_category) {
			$children = $this->getDieutriCategoriesByParentId($dieutri_category['dieutri_category_id']);
			
			if ($children) {
				$dieutri_category_data = array_merge($children, $dieutri_category_data);
			}			
		}
		
		return $dieutri_category_data;
	}
}