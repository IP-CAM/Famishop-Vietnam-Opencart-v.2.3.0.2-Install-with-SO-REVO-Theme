<?php
class ModelRecruitRecruit extends Model {
	public function addRecruit($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "recruit SET
		sort_order = '" . (int)$this->request->post['sort_order'] . "',
		image = '" . $this->db->escape($data['image']) . "',
		status = '" . (int)$data['status'] . "',
		author = '" . $this->db->escape($data['author']) . "',
		allow_comment = '" . (int)$data['allow_comment'] . "',
		date_timeout = '" . $this->db->escape($data['date_timeout']) . "',

		date_added = NOW()");

		$recruit_id = $this->db->getLastId();

		foreach ($data['recruit_description'] as $language_id => $value) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_description SET
		recruit_id = '" . (int)$recruit_id . "',
		language_id = '" . (int)$language_id . "',
		title = '" . $this->db->escape($value['title']) . "',
		page_title = '" . $this->db->escape($value['page_title']) . "',
		short_description = '" . $this->db->escape($value['short_description']) . "',
		meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "',
		meta_description = '" . $this->db->escape($value['meta_description']) . "',
		description = '" . $this->db->escape($value['description']) . "',
		tags = '" . $this->db->escape($value['tags']) . "'
		")
		;}

		if (isset($data['recruit_store'])) {
			foreach ($data['recruit_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_to_store SET
				recruit_id = '" . (int)$recruit_id . "',
				store_id = '" . (int)$store_id . "'
				");
			}
		}

		if (isset($data['recruit_layout'])) {
			foreach ($data['recruit_layout'] as $store_id => $layout) {
				if ($layout) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_to_layout SET
					recruit_id = '" . (int)$recruit_id . "',
					store_id = '" . (int)$store_id . "',
					layout_id = '" . (int)$layout['layout_id'] . "'
					");
				}
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET
			query = 'recruit_id=" . (int)$recruit_id . "',
			keyword = '" . $this->db->escape($data['keyword']) . "'
			");
		}

		if (isset($data['this_recruit_category'])) {
			foreach ($data['this_recruit_category'] as $recruit_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_to_category SET
				recruit_id = '" . (int)$recruit_id . "',
				recruit_category_id = '" . (int)$recruit_category_id . "'
				");
			}
		}

		if (isset($data['related_recruit'])) {
			foreach ($data['related_recruit'] as $child_recruit_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_related SET
				parent_recruit_id = '" . (int)$recruit_id . "',
				child_recruit_id = '" . (int)$child_recruit_id . "'
				");
			}
		}

		$this->cache->delete('recruit');
	}

	public function editRecruit($recruit_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "recruit SET
		sort_order = '" . (int)$data['sort_order'] . "',
		image = '" . $this->db->escape($data['image']) . "',
		allow_comment = '" . (int)$data['allow_comment'] . "' ,
		author = '" . $this->db->escape($data['author']) . "',
		status = '" . (int)$data['status'] . "',
		date_timeout = '" . $this->db->escape($data['date_timeout']) . "'
		WHERE recruit_id = '" . (int)$recruit_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_description WHERE recruit_id = '" . (int)$recruit_id . "'");

		foreach ($data['recruit_description'] as $language_id => $value) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_description SET
		recruit_id = '" . (int)$recruit_id . "',
		language_id = '" . (int)$language_id . "',
		title = '" . $this->db->escape($value['title']) . "',
		page_title = '" . $this->db->escape($value['page_title']) . "',
		short_description = '" . $this->db->escape($value['short_description']) . "',
		meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "',
		meta_description = '" . $this->db->escape($value['meta_description']) . "',
		description = '" . $this->db->escape($value['description']) . "',
		tags = '" . $this->db->escape($value['tags']) . "'
		");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_to_store WHERE recruit_id = '" . (int)$recruit_id . "'");

		if (isset($data['recruit_store'])) {
			foreach ($data['recruit_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_to_store SET
				recruit_id = '" . (int)$recruit_id . "',
				store_id = '" . (int)$store_id . "'
				");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_to_layout WHERE recruit_id = '" . (int)$recruit_id . "'");

		if (isset($data['recruit_layout'])) {
			foreach ($data['recruit_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_to_layout SET
					recruit_id = '" . (int)$recruit_id . "',
					store_id = '" . (int)$store_id . "',
					layout_id = '" . (int)$layout['layout_id'] . "'
					");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'recruit_id=" . (int)$recruit_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET
			query = 'recruit_id=" . (int)$recruit_id . "',
			keyword = '" . $this->db->escape($data['keyword']) . "'
			");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_to_category WHERE recruit_id = '" . (int)$recruit_id . "'");

		if (isset($data['this_recruit_category'])) {
			foreach ($data['this_recruit_category'] as $recruit_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_to_category SET
				recruit_id = '" . (int)$recruit_id . "',
				recruit_category_id = '" . (int)$recruit_category_id . "'
				");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_related WHERE parent_recruit_id = '" . (int)$recruit_id . "'");

		if (isset($data['related_recruit'])) {
			foreach ($data['related_recruit'] as $child_recruit_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "recruit_related SET
				parent_recruit_id = '" . (int)$recruit_id . "',
				child_recruit_id = '" . (int)$child_recruit_id . "'
				");
			}
		}

		$this->cache->delete('recruit');
	}

	public function deleteRecruit($recruit_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit WHERE recruit_id = '" . (int)$recruit_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_description WHERE recruit_id = '" . (int)$recruit_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_to_store WHERE recruit_id = '" . (int)$recruit_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_to_layout WHERE recruit_id = '" . (int)$recruit_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'recruit_id=" . (int)$recruit_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_related WHERE parent_recruit_id = '" . (int)$recruit_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_to_category WHERE recruit_id = '" . (int)$recruit_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_comment WHERE recruit_id = '" . (int)$recruit_id . "'");

		$this->cache->delete('recruit');
	}

	public function getRecruit($recruit_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE
		query = 'recruit_id=" . (int)$recruit_id . "')
		AS keyword FROM " . DB_PREFIX . "recruit WHERE
		recruit_id = '" . (int)$recruit_id . "'
		");

		return $query->row;
	}

	public function getRecruits($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "recruit i LEFT JOIN " . DB_PREFIX . "recruit_description id ON (i.recruit_id = id.recruit_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			$sort_data = array(
				'id.title',
				'i.date_added',
				'i.sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY i.recruit_id";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$recruit_data = $this->cache->get('recruit.' . $this->config->get('config_language_id'));

			if (!$recruit_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit i LEFT JOIN " . DB_PREFIX . "recruit_description id ON (i.recruit_id = id.recruit_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$recruit_data = $query->rows;

				$this->cache->set('recruit.' . $this->config->get('config_language_id'), $recruit_data);
			}

			return $recruit_data;
		}
	}

	public function getRecruitDescriptions($recruit_id) {
		$recruit_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_description WHERE recruit_id = '" . (int)$recruit_id . "'");

		foreach ($query->rows as $result) {
			$recruit_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
				'page_title'       => $result['page_title'],
				'meta_keyword'       => $result['meta_keyword'],
				'meta_description'       => $result['meta_description'],
				'tags'       => $result['tags'],
				'short_description'       => $result['short_description'],
				'description' => $result['description']
			);
		}

		return $recruit_description_data;
	}

	public function getRecruitStores($recruit_id) {
		$recruit_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_to_store WHERE recruit_id = '" . (int)$recruit_id . "'");

		foreach ($query->rows as $result) {
			$recruit_store_data[] = $result['store_id'];
		}

		return $recruit_store_data;
	}

	public function getRecruitCategories($recruit_id) {
		$recruit_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_to_category WHERE recruit_id = '" . (int)$recruit_id . "'");

		foreach ($query->rows as $result) {
			$recruit_category_data[] = $result['recruit_category_id'];
		}

		return $recruit_category_data;
	}



	public function getTotalRecruits() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit");

		return $query->row['total'];
	}

	public function getRelatedRecruit($recruit_id) {
		$related_recruit_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_related WHERE parent_recruit_id = '" . (int)$recruit_id . "'");

		foreach ($query->rows as $result) {
			$related_recruit_data[] = $result['child_recruit_id'];
		}

		return $related_recruit_data;
	}

	public function getCommentsByRecruitId($recruit_id, $start = 0, $limit = 40) {
		$query = $this->db->query("SELECT nc.recruit_comment_id, nc.recruit_id, nc.name, nc.email, nc.comment, nc.status, n.recruit_id, nd.title, n.image, nc.date_added FROM " . DB_PREFIX . "recruit_comment nc LEFT JOIN " . DB_PREFIX . "recruit n ON (nc.recruit_id = n.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_description nd ON (n.recruit_id = nd.recruit_id) WHERE n.recruit_id = '" . (int)$recruit_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY nc.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalCommentsByRecruitId($recruit_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit_comment nc LEFT JOIN " . DB_PREFIX . "recruit n ON (nc.recruit_id = n.recruit_id) LEFT JOIN " . DB_PREFIX . "recruit_description nd ON (n.recruit_id = nd.recruit_id) WHERE n.recruit_id = '" . (int)$recruit_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row['total'];
	}

	public function getRecruitLayouts($recruit_id) {
		$recruit_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recruit_to_layout WHERE recruit_id = '" . (int)$recruit_id . "'");

		foreach ($query->rows as $result) {
			$recruit_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $recruit_layout_data;
	}
}
