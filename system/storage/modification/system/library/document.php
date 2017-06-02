<?php
class Document {

				public function mfp_removeLink( $rel ) {foreach( $this->links as $k => $v ) {if( $v['rel'] == $rel ) {unset( $this->links[$k] );}}}
			
	private $title;
	private $description;
	private $keywords;
	private $links = array();
	private $styles = array();
	private $scripts = array();


        private $seo_meta = '';

        public function addSeoMeta($html) {
          $this->seo_meta .= $html;
        }
        
        public function renderSeoMeta() {
          return $this->seo_meta;
        }
      
	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setDescription($description) {
		$this->description = $description;
	}

	public function getDescription() {
		return $this->description;
	}

	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	public function getKeywords() {
		return $this->keywords;
	}

	public function addLink($href, $rel) {
		$this->links[$href] = array(
			'href' => $href,
			'rel'  => $rel
		);
	}

	public function getLinks() {
		return $this->links;
	}

	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[$href] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}

	public function getStyles() {
		return $this->styles;
	}

	public function addScript($href, $postion = 'header') {
		$this->scripts[$postion][$href] = $href;
	}

	public function getScripts($postion = 'header') {
		if (isset($this->scripts[$postion])) {
			return $this->scripts[$postion];
		} else {
			return array();
		}
	}
}