<?php
class ModelDieutriDieutriSetting extends Model { 
	
	public function install() {
	$sql = " SHOW TABLES LIKE '" . DB_PREFIX . "dieutri' ";
		$query = $this->db->query( $sql );
		if( count($query->rows) <=0 ){ 
			$this->createTables();
		}
	}
	
	public function createTables() {
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri` ( ";
	$sql .= "`dieutri_id` int(11) NOT NULL AUTO_INCREMENT, ";
	$sql .= "`allow_comment` int(1) NOT NULL DEFAULT '1', ";
	$sql .= "`count_read` int(11) NOT NULL DEFAULT '0', ";
	$sql .= "`sort_order` int(3) NOT NULL, ";
	$sql .= "`status` int(1) NOT NULL DEFAULT '1', ";
	$sql .= "`author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL, ";
	$sql .= "`date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', ";
	$sql .= "`image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL, ";
	$sql .= "PRIMARY KEY (`dieutri_id`) ";
	$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_category` ( ";
	$sql .= "`dieutri_category_id` int(11) NOT NULL AUTO_INCREMENT, ";
	$sql .= "`parent_id` int(11) NOT NULL DEFAULT '0', ";
	$sql .= "`sort_order` int(3) NOT NULL DEFAULT '0', ";
	$sql .= "`date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', ";
	$sql .= "`status` int(1) NOT NULL DEFAULT '1', ";
	$sql .= "PRIMARY KEY (`dieutri_category_id`) ";
	$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=49 ; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_category_description` ( ";
	$sql .= "`dieutri_category_id` int(11) NOT NULL, ";
	$sql .= "`language_id` int(11) NOT NULL, ";
	$sql .= "`name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '', ";
	$sql .= "`page_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '', ";
	$sql .= "`meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL, ";
	$sql .= "`meta_description` varchar(255) COLLATE utf8_bin NOT NULL, ";
	$sql .= "`description` text COLLATE utf8_bin NOT NULL, ";
	$sql .= "PRIMARY KEY (`dieutri_category_id`,`language_id`), ";
	$sql .= "KEY `name` (`name`) ";
	$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_category_to_layout` ( ";
	$sql .= "`dieutri_category_id` int(11) NOT NULL, ";
	$sql .= "`store_id` int(11) NOT NULL, ";
	$sql .= "`layout_id` int(11) NOT NULL, ";
	$sql .= "PRIMARY KEY (`dieutri_category_id`,`store_id`) ";
	$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_category_to_store` ( ";
	$sql .= "`dieutri_category_id` int(11) NOT NULL, ";
	$sql .= "`store_id` int(11) NOT NULL, ";
	$sql .= "PRIMARY KEY (`dieutri_category_id`,`store_id`) ";
	$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_comment` ( ";
	$sql .= "`dieutri_comment_id` int(11) NOT NULL AUTO_INCREMENT, ";
	$sql .= "`dieutri_id` int(11) NOT NULL DEFAULT '0', ";
	$sql .= "`name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
	$sql .= "`email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
	$sql .= "`comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
	$sql .= "`date_added` datetime DEFAULT '0000-00-00 00:00:00', ";
	$sql .= "`status` int(1) NOT NULL DEFAULT '1', ";
	$sql .= "PRIMARY KEY (`dieutri_comment_id`) ";
	$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_description` ( ";
	$sql .= "`dieutri_id` int(11) NOT NULL, ";
	$sql .= "`language_id` int(11) NOT NULL, ";
	$sql .= "`title` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
	$sql .= "`page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
	$sql .= "`meta_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
	$sql .= "`meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
	$sql .= "`short_description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
	$sql .= "`description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
	$sql .= "`tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ";
	$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_related` ( ";
	$sql .= "`parent_dieutri_id` int(11) NOT NULL DEFAULT '0', ";
	$sql .= "`child_dieutri_id` int(11) NOT NULL DEFAULT '0' ";
	$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=latin1; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_to_category` ( ";
	$sql .= "`dieutri_id` int(11) NOT NULL, ";
	$sql .= "`dieutri_category_id` int(11) NOT NULL, ";
	$sql .= "PRIMARY KEY (`dieutri_id`,`dieutri_category_id`) ";
	$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_to_layout` ( ";
	$sql .= "`dieutri_id` int(11) NOT NULL, ";
	$sql .= "`store_id` int(11) NOT NULL, ";
	$sql .= "`layout_id` int(11) NOT NULL, ";
	$sql .= "PRIMARY KEY (`dieutri_id`,`store_id`) ";
	$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
	$this->db->query($sql);
	
	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "dieutri_to_store` ( ";
	$sql .= "`dieutri_id` int(11) NOT NULL, ";
	$sql .= "`store_id` int(11) NOT NULL ";
	$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=latin1; ";
	$this->db->query($sql);
	
	$sql  = "INSERT INTO  `" . DB_PREFIX . "layout` ( `layout_id` , `name` ) VALUES ( NULL , 'Dieutri' ); ";
	$query = $this->db->query( $sql );
		
	$id = $this->db->getLastId();
		
	$sql = "INSERT INTO `".DB_PREFIX."layout_route` (
				`layout_route_id` ,
				`layout_id` ,
				`store_id` ,
				`route`
				)
				VALUES (
				NULL , '".$id."', '0', 'dieutri/%');
		";
		$query = $this->db->query( $sql );

	}
	
	public function getHomeKeyword() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'dieutri/home'");
		return $query->row;
		
	}
	
	
	public function editDieutriSetting($code, $data, $store_id = 0) {
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'dieutri/home'");
		
		if ($data['dieutri_home_url']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'dieutri/home', keyword = '" . $this->db->escape($data['dieutri_home_url']) . "'");
		}
				
		
		$this->db->query("DELETE FROM `" . DB_PREFIX . "setting` WHERE store_id = '" . (int)$store_id . "' AND `code` = '" . $this->db->escape($code) . "'");

		foreach ($data as $key => $value) {
			if (substr($key, 0, strlen($code)) == $code) {
				if (!is_array($value)) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape((json_encode($value)), true) . "', serialized = '1'");
				}
			}
		}		
	}
	

}