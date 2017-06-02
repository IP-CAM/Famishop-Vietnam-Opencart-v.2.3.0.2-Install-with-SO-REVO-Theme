<?php
class ModelDieutriDieutriComment extends Model { 

	public function getDieutriComments ($data = array()){
		$sql = 'SELECT c.*,bd.title FROM '.DB_PREFIX.'dieutri_comment c LEFT JOIN '
				. DB_PREFIX.'dieutri b ON b.dieutri_id=c.dieutri_id LEFT JOIN '
				. DB_PREFIX.'dieutri_description bd ON bd.dieutri_id=b.dieutri_id AND language_id='.(int)$this->config->get('config_language_id')
				;

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
	}
	
	public function getTotalDieutriComments() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "dieutri_comment");
		
		return $query->row['total'];
	}

	
	public function enableDieutriComment($id) {
		$this->db->query("UPDATE " . DB_PREFIX . "dieutri_comment SET status = '1' WHERE dieutri_comment_id = '" . (int)$id . "'");
	}
	
	public function disableDieutriComment($id) {
		$this->db->query("UPDATE " . DB_PREFIX . "dieutri_comment SET status = '0' WHERE dieutri_comment_id = '" . (int)$id . "'");
	}
	
	public function deleteDieutriComment($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "dieutri_comment WHERE dieutri_comment_id = '" . (int)$id . "'");
		
	} 

}