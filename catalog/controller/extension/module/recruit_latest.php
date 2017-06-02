<?php
class ControllerExtensionModuleRecruitLatest extends Controller {
	public function index($setting) {
		
		$this->document->addStyle('catalog/view/theme/shopme/stylesheet/recruit.css');
		
		static $module = 0;
		
		$this->load->language('recruit/recruit');
		$this->load->model('recruit/recruit');
		$this->load->model('tool/image');
		
		$data = array(
			'start' => 0,
			'limit' => $setting['limit']
		);
		
		$data['characters'] = $setting['characters'];
		$data['carousel'] = $setting['carousel'];
		$data['columns'] = $setting['columns'];
		$data['thumb'] = $setting['thumb'];
		
		foreach ($this->model_recruit_recruit->getLatestRecruits($data) as $result) {
      		$data['posts'][] = array(
        		'title' => $result['title'],
				'author' => $result['author'],
				'comment_total' => $this->model_recruit_recruit->getTotalCommentsByRecruitId($result['recruit_id']),
				'date_added_full' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'description' => substr(html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8'), 0, $setting['characters']) . "...",
				'count_read' => $result['count_read'],
				'image'   		=> $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']),
	    		'href'  => $this->url->link('recruit/recruit', 'recruit_id=' . $result['recruit_id'])
      		);
    	}
		
		$data['recruit_show_all'] = $this->url->link('recruit/home');
		
		$data['text_show_all'] = $this->language->get('text_show_all');
		$data['text_posted_on'] = $this->language->get('text_posted_on');
		$data['text_posted_by'] = $this->language->get('text_posted_by');
		$data['text_read'] = $this->language->get('text_read');
		$data['text_comments'] = $this->language->get('text_comments');
		$data['text_not_found'] = $this->language->get('text_not_found');
		$data['heading_title_latest'] = $this->language->get('heading_title_latest');
		$data['text_read_more'] = $this->language->get('text_read_more');

		$data['date_added_status'] = $this->config->get('recruitsetting_date_added');
		$data['comments_count_status'] = $this->config->get('recruitsetting_comments_count');
		$data['page_view_status'] = $this->config->get('recruitsetting_page_view');
		$data['author_status'] = $this->config->get('recruitsetting_author');
		
		$data['module'] = $module++;

		return $this->load->view('extension/module/recruit_latest', $data);
	}
}