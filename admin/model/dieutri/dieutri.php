<?php
class ModelDieutriDieutri extends Model {
	public function addDieutri($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri SET
		sort_order = '" . (int)$this->request->post['sort_order'] . "',
		image = '" . $this->db->escape($data['image']) . "',
		image_before = '" . $this->db->escape($data['image_before']) . "',
		image_after = '" . $this->db->escape($data['image_after']) . "',
		status = '" . (int)$data['status'] . "',
		author = '" . $this->db->escape($data['author']) . "',
		allow_comment = '" . (int)$data['allow_comment'] . "',
		date_added = NOW()");

		$dieutri_id = $this->db->getLastId();

		foreach ($data['dieutri_description'] as $language_id => $value) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_description SET
		dieutri_id = '" . (int)$dieutri_id . "',
		language_id = '" . (int)$language_id . "',
		title = '" . $this->db->escape($value['title']) . "',
		page_title = '" . $this->db->escape($value['page_title']) . "',
		short_description = '" . $this->db->escape($value['short_description']) . "',
		meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "',
		meta_description = '" . $this->db->escape($value['meta_description']) . "',
		description = '" . $this->db->escape($value['description']) . "',
		faq = '" . $this->db->escape($value['faq']) . "',
		tags = '" . $this->db->escape($value['tags']) . "'
		")
		;}

		if (isset($data['dieutri_store'])) {
			foreach ($data['dieutri_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_to_store SET
				dieutri_id = '" . (int)$dieutri_id . "',
				store_id = '" . (int)$store_id . "'
				");
			}
		}

		if (isset($data['dieutri_layout'])) {
			foreach ($data['dieutri_layout'] as $store_id => $layout) {
				if ($layout) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_to_layout SET
					dieutri_id = '" . (int)$dieutri_id . "',
					store_id = '" . (int)$store_id . "',
					layout_id = '" . (int)$layout['layout_id'] . "'
					");
				}
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET
			query = 'dieutri_id=" . (int)$dieutri_id . "',
			keyword = '" . $this->db->escape($data['keyword']) . "'
			");
		}

		if (isset($data['this_dieutri_category'])) {
			foreach ($data['this_dieutri_category'] as $dieutri_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_to_category SET
				dieutri_id = '" . (int)$dieutri_id . "',
				dieutri_category_id = '" . (int)$dieutri_category_id . "'
				");
			}
		}

		if (isset($data['related_dieutri'])) {
			foreach ($data['related_dieutri'] as $child_dieutri_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_related SET
				parent_dieutri_id = '" . (int)$dieutri_id . "',
				child_dieutri_id = '" . (int)$child_dieutri_id . "'
				");
			}
		}

		if (isset($data['related_product'])) {
			foreach ($data['related_product'] as $product_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_product SET
				dieutri_id = '" . (int)$dieutri_id . "',
				product_id = '" . (int)$product_id . "'
				");
			}
		}

		$this->cache->delete('dieutri');
	}

	public function editDieutri($dieutri_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "dieutri SET
		sort_order = '" . (int)$data['sort_order'] . "',
		image = '" . $this->db->escape($data['image']) . "',
		image_before = '" . $this->db->escape($data['image_before']) . "',
		image_after = '" . $this->db->escape($data['image_after']) . "',
		allow_comment = '" . (int)$data['allow_comment'] . "' ,
		author = '" . $this->db->escape($data['author']) . "',
		status = '" . (int)$data['status'] . "'
		WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_description WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		foreach ($data['dieutri_description'] as $language_id => $value) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_description SET
		dieutri_id = '" . (int)$dieutri_id . "',
		language_id = '" . (int)$language_id . "',
		title = '" . $this->db->escape($value['title']) . "',
		page_title = '" . $this->db->escape($value['page_title']) . "',
		short_description = '" . $this->db->escape($value['short_description']) . "',
		meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "',
		meta_description = '" . $this->db->escape($value['meta_description']) . "',
		description = '" . $this->db->escape($value['description']) . "',
		faq = '" . $this->db->escape($value['faq']) . "',
		tags = '" . $this->db->escape($value['tags']) . "'
		");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_to_store WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		if (isset($data['dieutri_store'])) {
			foreach ($data['dieutri_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_to_store SET
				dieutri_id = '" . (int)$dieutri_id . "',
				store_id = '" . (int)$store_id . "'
				");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_to_layout WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		if (isset($data['dieutri_layout'])) {
			foreach ($data['dieutri_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_to_layout SET
					dieutri_id = '" . (int)$dieutri_id . "',
					store_id = '" . (int)$store_id . "',
					layout_id = '" . (int)$layout['layout_id'] . "'
					");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'dieutri_id=" . (int)$dieutri_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET
			query = 'dieutri_id=" . (int)$dieutri_id . "',
			keyword = '" . $this->db->escape($data['keyword']) . "'
			");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_to_category WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		if (isset($data['this_dieutri_category'])) {
			foreach ($data['this_dieutri_category'] as $dieutri_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_to_category SET
				dieutri_id = '" . (int)$dieutri_id . "',
				dieutri_category_id = '" . (int)$dieutri_category_id . "'
				");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_related WHERE parent_dieutri_id = '" . (int)$dieutri_id . "'");

		if (isset($data['related_dieutri'])) {
			foreach ($data['related_dieutri'] as $child_dieutri_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_related SET
				parent_dieutri_id = '" . (int)$dieutri_id . "',
				child_dieutri_id = '" . (int)$child_dieutri_id . "'
				");
			}
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_product WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		if (isset($data['related_product'])) {
			foreach ($data['related_product'] as $product_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "dieutri_product SET
				dieutri_id = '" . (int)$dieutri_id . "',
				product_id = '" . (int)$product_id . "'
				");
			}
		}

		$this->cache->delete('dieutri');
	}

	public function deleteDieutri($dieutri_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri WHERE dieutri_id = '" . (int)$dieutri_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_description WHERE dieutri_id = '" . (int)$dieutri_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_to_store WHERE dieutri_id = '" . (int)$dieutri_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_to_layout WHERE dieutri_id = '" . (int)$dieutri_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'dieutri_id=" . (int)$dieutri_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_related WHERE parent_dieutri_id = '" . (int)$dieutri_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_to_category WHERE dieutri_id = '" . (int)$dieutri_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_comment WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		$this->cache->delete('dieutri');
	}

	public function getDieutri($dieutri_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE
		query = 'dieutri_id=" . (int)$dieutri_id . "')
		AS keyword FROM " . DB_PREFIX . "dieutri WHERE
		dieutri_id = '" . (int)$dieutri_id . "'
		");

		return $query->row;
	}

	public function getDieutris($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "dieutri i LEFT JOIN " . DB_PREFIX . "dieutri_description id ON (i.dieutri_id = id.dieutri_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			$sort_data = array(
				'id.title',
				'i.date_added',
				'i.sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY i.dieutri_id";
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
			$dieutri_data = $this->cache->get('dieutri.' . $this->config->get('config_language_id'));

			if (!$dieutri_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri i LEFT JOIN " . DB_PREFIX . "dieutri_description id ON (i.dieutri_id = id.dieutri_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$dieutri_data = $query->rows;

				$this->cache->set('dieutri.' . $this->config->get('config_language_id'), $dieutri_data);
			}

			return $dieutri_data;
		}
	}

	public function getDieutriDescriptions($dieutri_id) {
		$dieutri_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_description WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		foreach ($query->rows as $result) {
			$dieutri_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
				'page_title'       => $result['page_title'],
				'meta_keyword'       => $result['meta_keyword'],
				'meta_description'       => $result['meta_description'],
				'tags'       => $result['tags'],
				'short_description'       => $result['short_description'],
				'description' => $result['description'],
				'faq' => $result['faq'],
			);
		}

		return $dieutri_description_data;
	}

	public function getDieutriStores($dieutri_id) {
		$dieutri_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_to_store WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		foreach ($query->rows as $result) {
			$dieutri_store_data[] = $result['store_id'];
		}

		return $dieutri_store_data;
	}

	public function getDieutriCategories($dieutri_id) {
		$dieutri_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_to_category WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		foreach ($query->rows as $result) {
			$dieutri_category_data[] = $result['dieutri_category_id'];
		}

		return $dieutri_category_data;
	}



	public function getTotalDieutris() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "dieutri");

		return $query->row['total'];
	}

	public function getRelatedDieutri($dieutri_id) {
		$related_dieutri_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_related WHERE parent_dieutri_id = '" . (int)$dieutri_id . "'");

		foreach ($query->rows as $result) {
			$related_dieutri_data[] = $result['child_dieutri_id'];
		}

		return $related_dieutri_data;
	}

	public function getRelatedProduct($dieutri_id) {
		$related_product_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_product WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		foreach ($query->rows as $result) {
			$related_product_data[] = $result['product_id'];
		}

		return $related_product_data;
	}

	public function getCommentsByDieutriId($dieutri_id, $start = 0, $limit = 40) {
		$query = $this->db->query("SELECT nc.dieutri_comment_id, nc.dieutri_id, nc.name, nc.email, nc.comment, nc.status, n.dieutri_id, nd.title, n.image, nc.date_added FROM " . DB_PREFIX . "dieutri_comment nc LEFT JOIN " . DB_PREFIX . "dieutri n ON (nc.dieutri_id = n.dieutri_id) LEFT JOIN " . DB_PREFIX . "dieutri_description nd ON (n.dieutri_id = nd.dieutri_id) WHERE n.dieutri_id = '" . (int)$dieutri_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY nc.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalCommentsByDieutriId($dieutri_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "dieutri_comment nc LEFT JOIN " . DB_PREFIX . "dieutri n ON (nc.dieutri_id = n.dieutri_id) LEFT JOIN " . DB_PREFIX . "dieutri_description nd ON (n.dieutri_id = nd.dieutri_id) WHERE n.dieutri_id = '" . (int)$dieutri_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row['total'];
	}

	public function getDieutriLayouts($dieutri_id) {
		$dieutri_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dieutri_to_layout WHERE dieutri_id = '" . (int)$dieutri_id . "'");

		foreach ($query->rows as $result) {
			$dieutri_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $dieutri_layout_data;
	}
}
