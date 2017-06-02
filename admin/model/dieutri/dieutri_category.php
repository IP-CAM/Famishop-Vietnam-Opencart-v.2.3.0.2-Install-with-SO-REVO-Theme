<?php
class ModelDieutriDieutriCategory extends Model {
	
	public function addDieutriCategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_category SET 
		parent_id = '" . (int)$data['parent_id'] . "', 
		sort_order = '" . (int)$data['sort_order'] . "', 
		status = '" . (int)$data['status'] . "', 
		date_added = NOW()
		");
	
		$dieutri_category_id = $this->db->getLastId();
		
		foreach ($data['dieutri_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_category_description SET 
			dieutri_category_id = '" . (int)$dieutri_category_id . "', 
			language_id = '" . (int)$language_id . "', 
			name = '" . $this->db->escape($value['name']) . "',
			page_title = '" . $this->db->escape($value['page_title']) . "', 
			meta_keywords = '" . $this->db->escape($value['meta_keywords']) . "', 
			meta_description = '" . $this->db->escape($value['meta_description']) . "', 
			description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if (isset($data['dieutri_category_store'])) {
			foreach ($data['dieutri_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_category_to_store SET 
				dieutri_category_id = '" . (int)$dieutri_category_id . "', 
				store_id = '" . (int)$store_id . "'
			");
			}
		}

		if (isset($data['dieutri_category_layout'])) {
			foreach ($data['dieutri_category_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_category_to_layout SET 
					dieutri_category_id = '" . (int)$dieutri_category_id . "', 
					store_id = '" . (int)$store_id . "', 
					layout_id = '" . (int)$layout['layout_id'] . "'
				");
				}
			}
		}
						
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET 
			query = 'dieutri_category_id=" . (int)$dieutri_category_id . "', 
			keyword = '" . $this->db->escape($data['keyword']) . "'
			");
		}
		
		$this->cache->delete('dieutri_category');
	}
	
	public function editDieutriCategory($dieutri_category_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "dieutri_category SET 
		parent_id = '" . (int)$data['parent_id'] . "', 
		sort_order = '" . (int)$data['sort_order'] . "', 
		status = '" . (int)$data['status'] . "' 
		WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "dieutri_category SET 
			image = '" . $this->db->escape($data['image']) . "' 
			WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_category_description WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");

		foreach ($data['dieutri_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_category_description SET 
			dieutri_category_id = '" . (int)$dieutri_category_id . "', 
			language_id = '" . (int)$language_id . "', 
			name = '" . $this->db->escape($value['name']) . "', 
			page_title = '" . $this->db->escape($value['page_title']) . "', 
			meta_keywords = '" . $this->db->escape($value['meta_keywords']) . "', 
			meta_description = '" . $this->db->escape($value['meta_description']) . "', 
			description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_category_to_store WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");
		
		if (isset($data['dieutri_category_store'])) {		
			foreach ($data['dieutri_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_category_to_store SET 
				dieutri_category_id = '" . (int)$dieutri_category_id . "', 
				store_id = '" . (int)$store_id . "'
				");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_category_to_layout WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");

		if (isset($data['dieutri_category_layout'])) {
			foreach ($data['dieutri_category_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_category_to_layout SET 
					dieutri_category_id = '" . (int)$dieutri_category_id . "', 
					store_id = '" . (int)$store_id . "', 
					layout_id = '" . (int)$layout['layout_id'] . "'
					");
				}
			}
		}
						
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'dieutri_category_id=" . (int)$dieutri_category_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET 
			query = 'dieutri_category_id=" . (int)$dieutri_category_id . "', 
			keyword = '" . $this->db->escape($data['keyword']) . "'
			");
		}
		
		$this->cache->delete('dieutri_category');
	}
	
	public function deleteDieutriCategory($dieutri_category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_category WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_category_description WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_category_to_store WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_category_to_layout WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'dieutri_category_id=" . (int)$dieutri_category_id . "'");
		
		$query = $this->db->query("SELECT dieutri_category_id FROM " . DB_PREFIX . "dieutri_category WHERE parent_id = '" . (int)$dieutri_category_id . "'");

		foreach ($query->rows as $result) {
			$this->deleteDieutriCategory($result['dieutri_category_id']);
		}
				
		$this->cache->delete('dieutri_category');
	} 

	public function getDieutriCategory($dieutri_category_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE 
		query = 'dieutri_category_id=" . (int)$dieutri_category_id . "') 
		AS keyword FROM " . DB_PREFIX . "dieutri_category WHERE 
		dieutri_category_id = '" . (int)$dieutri_category_id . "'
		");
		
		return $query->row;
	}
	
	public function getDieutriIdCategories($filter_id) {
		$query = $this->db->query("SELECT *, (SELECT name FROM " . DB_PREFIX . "dieutri_category_description fgd WHERE 
		f.dieutri_category_id = fgd.dieutri_category_id AND 
		fgd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS 
		`dieutri_category_id` FROM " . DB_PREFIX . "dieutri_category f LEFT JOIN " . DB_PREFIX . "dieutri_category_description fd ON (f.dieutri_category_id = fd.dieutri_category_id) WHERE 
		f.dieutri_category_id = '" . (int)$filter_id . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}
	
	public function getDieutriCategories($parent_id) {
		$dieutri_category_data = $this->cache->get('dieutri_category.' . $this->config->get('config_language_id') . '.' . $parent_id);
	
		if (!$dieutri_category_data) {
			$dieutri_category_data = array();
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_category c LEFT JOIN " . DB_PREFIX . "dieutri_category_description cd ON (c.dieutri_category_id = cd.dieutri_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
			foreach ($query->rows as $result) {
				$dieutri_category_data[] = array(
					'dieutri_category_id' => $result['dieutri_category_id'],
					'name'        => $this->getPath($result['dieutri_category_id'], $this->config->get('config_language_id')),
					'status'  	  => $result['status'],
					'sort_order'  => $result['sort_order']
				);
			
				$dieutri_category_data = array_merge($dieutri_category_data, $this->getDieutriCategories($result['dieutri_category_id']));
			}	
	
			$this->cache->set('dieutri_category.' . $this->config->get('config_language_id') . '.' . $parent_id, $dieutri_category_data);
		}
		
		return $dieutri_category_data;
	}
	
	public function getPath($dieutri_category_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "dieutri_category c LEFT JOIN " . DB_PREFIX . "dieutri_category_description cd ON (c.dieutri_category_id = cd.dieutri_category_id) WHERE c.dieutri_category_id = '" . (int)$dieutri_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		$dieutri_category_info = $query->row;
		
		if ($dieutri_category_info['parent_id']) {
			return $this->getPath($dieutri_category_info['parent_id'], $this->config->get('config_language_id')) . " > " . $dieutri_category_info['name'];
		} else {
			return $dieutri_category_info['name'];
		}
	}
	
	public function getDieutriCategoryDescriptions($dieutri_category_id) {
		$dieutri_category_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_category_description WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");
		
		foreach ($query->rows as $result) {
			$dieutri_category_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'page_title'        => $result['page_title'],
				'meta_keywords'     => $result['meta_keywords'],
				'meta_description' => $result['meta_description'],
				'description'      => $result['description']
			);
		}
		
		return $dieutri_category_description_data;
	}	
	
	public function getDieutriCategoryStores($dieutri_category_id) {
		$dieutri_category_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_category_to_store WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");

		foreach ($query->rows as $result) {
			$dieutri_category_store_data[] = $result['store_id'];
		}
		
		return $dieutri_category_store_data;
	}

	public function getDieutriCategoryLayouts($dieutri_category_id) {
		$dieutri_category_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_category_to_layout WHERE dieutri_category_id = '" . (int)$dieutri_category_id . "'");
		
		foreach ($query->rows as $result) {
			$dieutri_category_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $dieutri_category_layout_data;
	}
		
	public function getTotalDieutriCategories() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "dieutri_category");
		
		return $query->row['total'];
	}	
		
	public function getTotalDieutriCategoriesByImageId($image_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "dieutri_category WHERE image_id = '" . (int)$image_id . "'");
		
		return $query->row['total'];
	}

	public function getTotalDieutriCategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "dieutri_category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
		
		
}