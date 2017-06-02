<?php
class ModelRecruitRecruit extends Model {
	
	public function getRecruit($recruit_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "recruit i LEFT JOIN " . DB_PREFIX . "recruit_description id ON (i.recruit_id = id.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_to_store i2s ON (i.recruit_id = i2s.recruit_id) WHERE i.recruit_id = '" . (int)$recruit_id . "' AND id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1'");
	
		return $query->row;
	}
	
	public function getRecruits($data, $start = 0, $limit = 30) {
		$sql = "SELECT * FROM " . DB_PREFIX . "recruit i LEFT JOIN " . DB_PREFIX . "recruit_description id ON (i.recruit_id = id.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_to_store i2s ON (i.recruit_id = i2s.recruit_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' AND i.sort_order <> '-1'";
		
		if(!empty($data['filter_tag'])){
			$parts = explode (",",$data['filter_tag'] );
			
			if(count($parts) > 1) {
				$tags = array();
                
				foreach($parts as $part) {
					$tags[] = 'id.tags LIKE "%' . $this->db->escape($part) . '%"';
					
				}
                
				$sql .= ' AND  ' . implode(" OR ", $tags ) . ' ';	

			} else {
				$sql .= ' AND id.tags LIKE "%' . $this->db->escape($data['filter_tag']) . '%"';
			}
		}
        
        $sql .= " ORDER BY i.sort_order, i.recruit_id DESC LIMIT " . (int)$start . "," . (int)$limit;
		
        $query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getTotalRecruits($data) {
      	$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit i LEFT JOIN " . DB_PREFIX . "recruit_description id ON (i.recruit_id = id.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_to_store i2s ON (i.recruit_id = i2s.recruit_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' AND i.sort_order <> '-1'";
        
		if(!empty($data['filter_tag'])){
			$parts = explode (",",$data['filter_tag'] );
			
			if(count($parts) > 1) {
				$tags = array();
                
				foreach($parts as $part) {
					$tags[] = 'id.tags LIKE "%' . $this->db->escape($part) . '%"';
					
				}
                
				$sql .= ' AND  ' . implode(" OR ", $tags ) . ' ';	

			} else {
				$sql .= ' AND id.tags LIKE "%' . $this->db->escape($data['filter_tag']) . '%"';
			}
		}
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
		
	public function getLatestRecruits($data = array()) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit i LEFT JOIN " . DB_PREFIX . "recruit_description id ON (i.recruit_id = id.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_to_store i2s ON (i.recruit_id = i2s.recruit_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' AND i.sort_order <> '-1' ORDER BY i.sort_order, i.recruit_id DESC LIMIT " . (int)$data['start'] . "," . (int)$data['limit'] . "");
		
		return $query->rows;
	}
	
	public function getRecruitsByRecruitCategoryId($recruit_category_id, $start = 0, $limit = 40) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit n LEFT JOIN " . DB_PREFIX . "recruit_description nd ON (n.recruit_id = nd.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_to_store n2s ON (n.recruit_id = n2s.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_to_category n2c ON (n.recruit_id = n2c.recruit_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n2c.recruit_category_id = '" . (int)$recruit_category_id . "' AND n.status = '1' AND n.sort_order <> '-1' ORDER BY n.sort_order, n.recruit_id DESC LIMIT " . (int)$start . "," . (int)$limit);
		
		return $query->rows;
	}
	
	public function getTotalRecruitsByRecruitCategoryId($recruit_category_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit WHERE status = '1'");
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit_to_category n2c LEFT JOIN " . DB_PREFIX . "recruit n ON (n2c.recruit_id = n.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_to_store n2s ON (n.recruit_id = n2s.recruit_id) WHERE n.status = '1' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n2c.recruit_category_id = '" . (int)$recruit_category_id . "'");
		
		return $query->row['total'];
	}
	
	public function getTotalRecruitsPerCategory($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX ."recruit n LEFT JOIN " . DB_PREFIX . "recruit_to_store n2s ON (n.recruit_id = n2s.recruit_id) WHERE n.status = '1' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
		
		if (isset($data['filter_recruit_category_id']) && $data['filter_recruit_category_id']) {
			if (isset($data['filter_sub_recruit_category']) && $data['filter_sub_recruit_category']) {
				$implode_data = array();
				
				$this->load->model('recruit/recruit_category');
				
				$recruit_categories = $this->model_recruit_recruit_category->getRecruitCategoriesByParentId($data['filter_recruit_category_id']);
				
				foreach ($recruit_categories as $recruit_category_id) {
					$implode_data[] = "n2c.recruit_category_id = '" . (int)$recruit_category_id . "'";
				}
				
				$sql .= " AND n.recruit_id IN (SELECT n2c.recruit_id FROM " . DB_PREFIX . "recruit_to_category n2c WHERE " . implode(' OR ', $implode_data) . ")";			
			} else {
				$sql .= " AND n.recruit_id IN (SELECT n2c.recruit_id FROM " . DB_PREFIX . "recruit_to_category n2c WHERE n2c.recruit_category_id = '" . (int)$data['filter_recruit_category_id'] . "')";
			}
		}
				
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
	public function updateRecruitReadCounter($recruit_id, $new_read_counter_value) {
	$this->db->query("UPDATE " . DB_PREFIX . "recruit SET count_read = '" . (int)$new_read_counter_value . "' WHERE recruit_id = '" . (int)$recruit_id . "'");
   }
	
	public function getRelatedRecruit($recruit_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit n LEFT JOIN " . DB_PREFIX . "recruit_description nd ON (n.recruit_id = nd.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_to_store n2s ON (n.recruit_id = n2s.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_related nr ON (n.recruit_id = nr.child_recruit_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' AND n.sort_order <> '-1' AND nr.parent_recruit_id = '" . (int)$recruit_id. "' ORDER BY n.sort_order, n.recruit_id DESC");
		
		return $query->rows;
	}
	

	public function addComment($recruit_id, $data) {
		
		if($this->config->get('recruitsetting_comment_approve')){
		$comment_status = '0';
		}else{
		$comment_status = '1';
		}
		
		// $this->event->trigger('pre.comment.add', $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_comment SET 
		name = '" . $this->db->escape($data['name']) . "', 
		email = '" . $this->db->escape($data['email']) . "', 
		recruit_id = '" . (int)$recruit_id . "', 
		comment = '" . $this->db->escape($data['comment']) . "', 
		status = '" . $comment_status . "',
		date_added = NOW()");

		$recruit_comment_id = $this->db->getLastId();

		// $this->event->trigger('post.comment.add', $recruit_comment_id);
	}
	
	
	
	public function getCommentsByRecruitId($recruit_id, $start = 0, $limit = 40) {
		$query = $this->db->query("SELECT nc.name, nc.email, nc.comment, nc.date_added FROM " . DB_PREFIX . "recruit_comment nc LEFT JOIN " . DB_PREFIX . "recruit n ON (nc.recruit_id = n.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_description nd ON (n.recruit_id = nd.recruit_id) WHERE n.recruit_id = '" . (int)$recruit_id . "' AND n.status = '1' AND nc.status = '1' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY nc.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
		
		return $query->rows;
	}
	
	public function getTotalCommentsByRecruitId($recruit_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit_comment nc LEFT JOIN " . DB_PREFIX . "recruit n ON (nc.recruit_id = n.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_description nd ON (n.recruit_id = nd.recruit_id) WHERE n.recruit_id = '" . (int)$recruit_id . "' AND n.status = '1' AND nc.status = '1' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row['total'];
	}
	

}