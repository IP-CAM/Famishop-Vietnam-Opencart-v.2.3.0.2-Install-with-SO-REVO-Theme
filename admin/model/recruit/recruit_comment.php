<?php
class ModelRecruitRecruitComment extends Model { 

	public function getRecruitComments ($data = array()){
		$sql = 'SELECT c.*,bd.title FROM '.DB_PREFIX.'recruit_comment c LEFT JOIN '
				. DB_PREFIX.'recruit b ON b.recruit_id=c.recruit_id LEFT JOIN '
				. DB_PREFIX.'recruit_description bd ON bd.recruit_id=b.recruit_id AND language_id='.(int)$this->config->get('config_language_id')
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
	
	public function getTotalRecruitComments() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recruit_comment");
		
		return $query->row['total'];
	}

	
	public function enableRecruitComment($id) {
		$this->db->query("UPDATE " . DB_PREFIX . "recruit_comment SET status = '1' WHERE recruit_comment_id = '" . (int)$id . "'");
	}
	
	public function disableRecruitComment($id) {
		$this->db->query("UPDATE " . DB_PREFIX . "recruit_comment SET status = '0' WHERE recruit_comment_id = '" . (int)$id . "'");
	}
	
	public function deleteRecruitComment($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "recruit_comment WHERE recruit_comment_id = '" . (int)$id . "'");
		
	} 

}