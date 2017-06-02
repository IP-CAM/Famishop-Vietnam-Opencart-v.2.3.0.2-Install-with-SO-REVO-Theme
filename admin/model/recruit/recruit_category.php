<?php
class ModelRecruitRecruitCategory extends Model {
	
	public function addRecruitCategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_category SET 
		parent_id = '" . (int)$data['parent_id'] . "', 
		sort_order = '" . (int)$data['sort_order'] . "', 
		status = '" . (int)$data['status'] . "', 
		date_added = NOW()
		");
	
		$recruit_category_id = $this->db->getLastId();
		
		foreach ($data['recruit_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_category_description SET 
			recruit_category_id = '" . (int)$recruit_category_id . "', 
			language_id = '" . (int)$language_id . "', 
			name = '" . $this->db->escape($value['name']) . "',
			page_title = '" . $this->db->escape($value['page_title']) . "', 
			meta_keywords = '" . $this->db->escape($value['meta_keywords']) . "', 
			meta_description = '" . $this->db->escape($value['meta_description']) . "', 
			description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if (isset($data['recruit_category_store'])) {
			foreach ($data['recruit_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_category_to_store SET 
				recruit_category_id = '" . (int)$recruit_category_id . "', 
				store_id = '" . (int)$store_id . "'
			");
			}
		}

		if (isset($data['recruit_category_layout'])) {
			foreach ($data['recruit_category_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_category_to_layout SET 
					recruit_category_id = '" . (int)$recruit_category_id . "', 
					store_id = '" . (int)$store_id . "', 
					layout_id = '" . (int)$layout['layout_id'] . "'
				");
				}
			}
		}
						
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET 
			query = 'recruit_category_id=" . (int)$recruit_category_id . "', 
			keyword = '" . $this->db->escape($data['keyword']) . "'
			");
		}
		
		$this->cache->delete('recruit_category');
	}
	
	public function editRecruitCategory($recruit_category_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "recruit_category SET 
		parent_id = '" . (int)$data['parent_id'] . "', 
		sort_order = '" . (int)$data['sort_order'] . "', 
		status = '" . (int)$data['status'] . "' 
		WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "recruit_category SET 
			image = '" . $this->db->escape($data['image']) . "' 
			WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_category_description WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");

		foreach ($data['recruit_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_category_description SET 
			recruit_category_id = '" . (int)$recruit_category_id . "', 
			language_id = '" . (int)$language_id . "', 
			name = '" . $this->db->escape($value['name']) . "', 
			page_title = '" . $this->db->escape($value['page_title']) . "', 
			meta_keywords = '" . $this->db->escape($value['meta_keywords']) . "', 
			meta_description = '" . $this->db->escape($value['meta_description']) . "', 
			description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_category_to_store WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");
		
		if (isset($data['recruit_category_store'])) {		
			foreach ($data['recruit_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_category_to_store SET 
				recruit_category_id = '" . (int)$recruit_category_id . "', 
				store_id = '" . (int)$store_id . "'
				");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_category_to_layout WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");

		if (isset($data['recruit_category_layout'])) {
			foreach ($data['recruit_category_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_category_to_layout SET 
					recruit_category_id = '" . (int)$recruit_category_id . "', 
					store_id = '" . (int)$store_id . "', 
					layout_id = '" . (int)$layout['layout_id'] . "'
					");
				}
			}
		}
						
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'recruit_category_id=" . (int)$recruit_category_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET 
			query = 'recruit_category_id=" . (int)$recruit_category_id . "', 
			keyword = '" . $this->db->escape($data['keyword']) . "'
			");
		}
		
		$this->cache->delete('recruit_category');
	}
	
	public function deleteRecruitCategory($recruit_category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_category WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_category_description WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_category_to_store WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_category_to_layout WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'recruit_category_id=" . (int)$recruit_category_id . "'");
		
		$query = $this->db->query("SELECT recruit_category_id FROM " . DB_PREFIX . "recruit_category WHERE parent_id = '" . (int)$recruit_category_id . "'");

		foreach ($query->rows as $result) {
			$this->deleteRecruitCategory($result['recruit_category_id']);
		}
				
		$this->cache->delete('recruit_category');
	} 

	public function getRecruitCategory($recruit_category_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE 
		query = 'recruit_category_id=" . (int)$recruit_category_id . "') 
		AS keyword FROM " . DB_PREFIX . "recruit_category WHERE 
		recruit_category_id = '" . (int)$recruit_category_id . "'
		");
		
		return $query->row;
	}
	
	public function getRecruitIdCategories($filter_id) {
		$query = $this->db->query("SELECT *, (SELECT name FROM " . DB_PREFIX . "recruit_category_description fgd WHERE 
		f.recruit_category_id = fgd.recruit_category_id AND 
		fgd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS 
		`recruit_category_id` FROM " . DB_PREFIX . "recruit_category f LEFT JOIN " . DB_PREFIX . "recruit_category_description fd ON (f.recruit_category_id = fd.recruit_category_id) WHERE 
		f.recruit_category_id = '" . (int)$filter_id . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}
	
	public function getRecruitCategories($parent_id) {
		$recruit_category_data = $this->cache->get('recruit_category.' . $this->config->get('config_language_id') . '.' . $parent_id);
	
		if (!$recruit_category_data) {
			$recruit_category_data = array();
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_category c LEFT JOIN " . DB_PREFIX . "recruit_category_description cd ON (c.recruit_category_id = cd.recruit_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
			foreach ($query->rows as $result) {
				$recruit_category_data[] = array(
					'recruit_category_id' => $result['recruit_category_id'],
					'name'        => $this->getPath($result['recruit_category_id'], $this->config->get('config_language_id')),
					'status'  	  => $result['status'],
					'sort_order'  => $result['sort_order']
				);
			
				$recruit_category_data = array_merge($recruit_category_data, $this->getRecruitCategories($result['recruit_category_id']));
			}	
	
			$this->cache->set('recruit_category.' . $this->config->get('config_language_id') . '.' . $parent_id, $recruit_category_data);
		}
		
		return $recruit_category_data;
	}
	
	public function getPath($recruit_category_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "recruit_category c LEFT JOIN " . DB_PREFIX . "recruit_category_description cd ON (c.recruit_category_id = cd.recruit_category_id) WHERE c.recruit_category_id = '" . (int)$recruit_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		$recruit_category_info = $query->row;
		
		if ($recruit_category_info['parent_id']) {
			return $this->getPath($recruit_category_info['parent_id'], $this->config->get('config_language_id')) . " > " . $recruit_category_info['name'];
		} else {
			return $recruit_category_info['name'];
		}
	}
	
	public function getRecruitCategoryDescriptions($recruit_category_id) {
		$recruit_category_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_category_description WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");
		
		foreach ($query->rows as $result) {
			$recruit_category_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'page_title'        => $result['page_title'],
				'meta_keywords'     => $result['meta_keywords'],
				'meta_description' => $result['meta_description'],
				'description'      => $result['description']
			);
		}
		
		return $recruit_category_description_data;
	}	
	
	public function getRecruitCategoryStores($recruit_category_id) {
		$recruit_category_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_category_to_store WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");

		foreach ($query->rows as $result) {
			$recruit_category_store_data[] = $result['store_id'];
		}
		
		return $recruit_category_store_data;
	}

	public function getRecruitCategoryLayouts($recruit_category_id) {
		$recruit_category_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_category_to_layout WHERE recruit_category_id = '" . (int)$recruit_category_id . "'");
		
		foreach ($query->rows as $result) {
			$recruit_category_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $recruit_category_layout_data;
	}
		
	public function getTotalRecruitCategories() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit_category");
		
		return $query->row['total'];
	}	
		
	public function getTotalRecruitCategoriesByImageId($image_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit_category WHERE image_id = '" . (int)$image_id . "'");
		
		return $query->row['total'];
	}

	public function getTotalRecruitCategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit_category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
		
		
}