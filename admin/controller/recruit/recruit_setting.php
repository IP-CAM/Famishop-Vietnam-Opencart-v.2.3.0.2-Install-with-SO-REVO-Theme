<?php
class ControllerRecruitRecruitSetting extends Controller { 
	private $error = array();

	public function index() {
		
		$this->load->language('recruit/recruit_setting');

		$this->document->setTitle($this->language->get('heading_title'));
		 
		$this->load->model('recruit/recruit_setting');
		
		$this->model_recruit_recruit_setting->install();
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_recruit_recruit_setting->editRecruitSetting('recruitsetting', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('recruit/recruit_setting', 'token=' . $this->session->data['token'], true));
		}
	
		$data['error_missing'] = $this->language->get('error_missing');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_recruit_home'] = $this->language->get('heading_recruit_home');
		$data['heading_recruit_listing'] = $this->language->get('heading_recruit_listing');
		$data['heading_recruit_listing_h'] = $this->language->get('heading_recruit_listing_h');
		$data['heading_recruit_post'] = $this->language->get('heading_recruit_post');
		$data['heading_related'] = $this->language->get('heading_related');
		$data['heading_comments'] = $this->language->get('heading_comments');
		$data['heading_author'] = $this->language->get('heading_author');

		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		
		$data['entry_recruitsetting_home_title'] = $this->language->get('entry_recruitsetting_home_title');
		$data['entry_recruitsetting_home_page_title'] = $this->language->get('entry_recruitsetting_home_page_title');
		$data['entry_recruitsetting_home_description'] = $this->language->get('entry_recruitsetting_home_description');
		$data['entry_recruitsetting_home_meta_description'] = $this->language->get('entry_recruitsetting_home_meta_description');
		$data['entry_recruitsetting_home_meta_keyword'] = $this->language->get('entry_recruitsetting_home_meta_keyword');
		$data['entry_recruitsetting_home_url'] = $this->language->get('entry_recruitsetting_home_url');
		$data['entry_recruitsetting_home_url_h'] = $this->language->get('entry_recruitsetting_home_url_h');
		$data['entry_recruitsetting_recruits_per_page'] = $this->language->get('entry_recruitsetting_recruits_per_page');
		$data['entry_recruitsetting_layout'] = $this->language->get('entry_recruitsetting_layout');
		$data['entry_recruitsetting_thumbs_w'] = $this->language->get('entry_recruitsetting_thumbs_w');
		$data['entry_recruitsetting_thumbs_h'] = $this->language->get('entry_recruitsetting_thumbs_h');
		$data['entry_recruitsetting_date_added'] = $this->language->get('entry_recruitsetting_date_added');
		$data['entry_recruitsetting_comments_count'] = $this->language->get('entry_recruitsetting_comments_count');
		$data['entry_recruitsetting_page_view'] = $this->language->get('entry_recruitsetting_page_view');
		$data['entry_recruitsetting_author'] = $this->language->get('entry_recruitsetting_author');
		$data['entry_recruitsetting_share'] = $this->language->get('entry_recruitsetting_share');
		$data['entry_recruitsetting_post_thumb'] = $this->language->get('entry_recruitsetting_post_thumb');
		$data['entry_recruitsetting_rel_characters'] = $this->language->get('entry_recruitsetting_rel_characters');
		$data['entry_recruitsetting_rel_recruit_per_row'] = $this->language->get('entry_recruitsetting_rel_recruit_per_row');
		$data['entry_recruitsetting_rel_thumb'] = $this->language->get('entry_recruitsetting_rel_thumb');
		$data['entry_recruitsetting_rel_thumbs_w'] = $this->language->get('entry_recruitsetting_rel_thumbs_w');
		$data['entry_recruitsetting_rel_thumbs_h'] = $this->language->get('entry_recruitsetting_rel_thumbs_h');
		$data['entry_recruitsetting_post_date_added'] = $this->language->get('entry_recruitsetting_post_date_added');
		$data['entry_recruitsetting_post_comments_count'] = $this->language->get('entry_recruitsetting_post_comments_count');
		$data['entry_recruitsetting_post_page_view'] = $this->language->get('entry_recruitsetting_post_page_view');
		$data['entry_recruitsetting_post_author'] = $this->language->get('entry_recruitsetting_post_author');
		$data['entry_recruitsetting_comment_per_page'] = $this->language->get('entry_recruitsetting_comment_per_page');
		$data['entry_recruitsetting_comment_approve'] = $this->language->get('entry_recruitsetting_comment_approve');
		$data['entry_recruitsetting_comment_approve_h'] = $this->language->get('entry_recruitsetting_comment_approve_h');
		$data['entry_recruitsetting_comment_notification'] = $this->language->get('entry_recruitsetting_comment_notification');
		$data['entry_recruitsetting_comment_notification_h'] = $this->language->get('entry_recruitsetting_comment_notification_h');
		$data['entry_recruitsetting_author_change'] = $this->language->get('entry_recruitsetting_author_change');
		$data['entry_recruitsetting_author_change_h'] = $this->language->get('entry_recruitsetting_author_change_h');
		$data['entry_recruitsetting_thumb_size'] = $this->language->get('entry_recruitsetting_thumb_size');
		$data['entry_recruitsetting_rel_thumbs'] = $this->language->get('entry_recruitsetting_rel_thumbs');

		
		$data['button_save'] = $this->language->get('button_save');

		$data['token'] = $this->session->data['token'];

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		$url = '';
					
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('recruit/recruit_setting', 'token=' . $this->session->data['token'] . $url, true)
   		);
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
							
		$data['action'] = $this->url->link('recruit/recruit_setting', 'token=' . $this->session->data['token'], true);
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['recruitsetting_home_title'])) {
			$data['recruitsetting_home_title'] = $this->request->post['recruitsetting_home_title'];
		} else {
			$data['recruitsetting_home_title'] = $this->config->get('recruitsetting_home_title');
		}
		
		if (isset($this->request->post['recruitsetting_home_page_title'])) {
			$data['recruitsetting_home_page_title'] = $this->request->post['recruitsetting_home_page_title'];
		} else {
			$data['recruitsetting_home_page_title'] = $this->config->get('recruitsetting_home_page_title');
		}
		
		if (isset($this->request->post['recruitsetting_home_description'])) {
			$data['recruitsetting_home_description'] = $this->request->post['recruitsetting_home_description'];
		} else {
			$data['recruitsetting_home_description'] = $this->config->get('recruitsetting_home_description');
		}
		
		if (isset($this->request->post['recruitsetting_home_meta_description'])) {
			$data['recruitsetting_home_meta_description'] = $this->request->post['recruitsetting_home_meta_description'];
		} else {
			$data['recruitsetting_home_meta_description'] = $this->config->get('recruitsetting_home_meta_description');
		}
		
		if (isset($this->request->post['recruitsetting_home_meta_keyword'])) {
			$data['recruitsetting_home_meta_keyword'] = $this->request->post['recruitsetting_home_meta_keyword'];
		} else {
			$data['recruitsetting_home_meta_keyword'] = $this->config->get('recruitsetting_home_meta_keyword');
		}
		
		$home_url = $this->model_recruit_recruit_setting->getHomeKeyword();
		
		if (isset($this->request->post['recruit_home_url'])) {
			$data['recruit_home_url'] = $this->request->post['recruit_home_url'];
		} else if (isset($home_url['keyword'])) {
			$data['recruit_home_url'] = $home_url['keyword'];
		} else {
			$data['recruit_home_url'] = false;
		}
		
		
		
		if (isset($this->request->post['recruitsetting_home_title'])) {
			$data['recruitsetting_home_title'] = $this->request->post['recruitsetting_home_title'];
		} else {
			$data['recruitsetting_home_title'] = $this->config->get('recruitsetting_home_title');
		}
		
		if (isset($this->request->post['recruitsetting_home_page_title'])) {
			$data['recruitsetting_home_page_title'] = $this->request->post['recruitsetting_home_page_title'];
		} else {
			$data['recruitsetting_home_page_title'] = $this->config->get('recruitsetting_home_page_title');
		}
		
		if (isset($this->request->post['recruitsetting_home_description'])) {
			$data['recruitsetting_home_description'] = $this->request->post['recruitsetting_home_description'];
		} else {
			$data['recruitsetting_home_description'] = $this->config->get('recruitsetting_home_description');
		}
		
		if (isset($this->request->post['recruitsetting_home_meta_description'])) {
			$data['recruitsetting_home_meta_description'] = $this->request->post['recruitsetting_home_meta_description'];
		} else {
			$data['recruitsetting_home_meta_description'] = $this->config->get('recruitsetting_home_meta_description');
		}
		
		if (isset($this->request->post['recruitsetting_home_meta_keyword'])) {
			$data['recruitsetting_home_meta_keyword'] = $this->request->post['recruitsetting_home_meta_keyword'];
		} else {
			$data['recruitsetting_home_meta_keyword'] = $this->config->get('recruitsetting_home_meta_keyword');
		}
		
		if (isset($this->request->post['recruitsetting_home_url'])) {
			$data['recruitsetting_home_url'] = $this->request->post['recruitsetting_home_url'];
		} else {
			$data['recruitsetting_home_url'] = $this->config->get('recruitsetting_home_url');
		}
		
		if (isset($this->request->post['recruitsetting_home_url'])) {
			$data['recruitsetting_home_url'] = $this->request->post['recruitsetting_home_url'];
		} else {
			$data['recruitsetting_home_url'] = $this->config->get('recruitsetting_home_url');
		}
		
		if (isset($this->request->post['recruitsetting_recruits_per_page'])) {
			$data['recruitsetting_recruits_per_page'] = $this->request->post['recruitsetting_recruits_per_page'];
		} else {
			$data['recruitsetting_recruits_per_page'] = $this->config->get('recruitsetting_recruits_per_page');
		}
		
		if (isset($this->request->post['recruitsetting_layout'])) {
			$data['recruitsetting_layout'] = $this->request->post['recruitsetting_layout'];
		} else {
			$data['recruitsetting_layout'] = $this->config->get('recruitsetting_layout');
		}
		
		if (isset($this->request->post['recruitsetting_thumbs_w'])) {
			$data['recruitsetting_thumbs_w'] = $this->request->post['recruitsetting_thumbs_w'];
		} else {
			$data['recruitsetting_thumbs_w'] = $this->config->get('recruitsetting_thumbs_w');
		}
		
		if (isset($this->request->post['recruitsetting_thumbs_h'])) {
			$data['recruitsetting_thumbs_h'] = $this->request->post['recruitsetting_thumbs_h'];
		} else {
			$data['recruitsetting_thumbs_h'] = $this->config->get('recruitsetting_thumbs_h');
		}
		
		if (isset($this->request->post['recruitsetting_post_thumbs_w'])) {
			$data['recruitsetting_post_thumbs_w'] = $this->request->post['recruitsetting_post_thumbs_w'];
		} else {
			$data['recruitsetting_post_thumbs_w'] = $this->config->get('recruitsetting_post_thumbs_w');
		}
		
		if (isset($this->request->post['recruitsetting_post_thumbs_h'])) {
			$data['recruitsetting_post_thumbs_h'] = $this->request->post['recruitsetting_post_thumbs_h'];
		} else {
			$data['recruitsetting_post_thumbs_h'] = $this->config->get('recruitsetting_post_thumbs_h');
		}
		
		if (isset($this->request->post['recruitsetting_date_added'])) {
			$data['recruitsetting_date_added'] = $this->request->post['recruitsetting_date_added'];
		} else {
			$data['recruitsetting_date_added'] = $this->config->get('recruitsetting_date_added');
		}
		
		if (isset($this->request->post['recruitsetting_comments_count'])) {
			$data['recruitsetting_comments_count'] = $this->request->post['recruitsetting_comments_count'];
		} else {
			$data['recruitsetting_comments_count'] = $this->config->get('recruitsetting_comments_count');
		}
		
		if (isset($this->request->post['recruitsetting_page_view'])) {
			$data['recruitsetting_page_view'] = $this->request->post['recruitsetting_page_view'];
		} else {
			$data['recruitsetting_page_view'] = $this->config->get('recruitsetting_page_view');
		}
		
		if (isset($this->request->post['recruitsetting_page_view'])) {
			$data['recruitsetting_page_view'] = $this->request->post['recruitsetting_page_view'];
		} else {
			$data['recruitsetting_page_view'] = $this->config->get('recruitsetting_page_view');
		}
		
		if (isset($this->request->post['recruitsetting_author'])) {
			$data['recruitsetting_author'] = $this->request->post['recruitsetting_author'];
		} else {
			$data['recruitsetting_author'] = $this->config->get('recruitsetting_author');
		}
		
		if (isset($this->request->post['recruitsetting_share'])) {
			$data['recruitsetting_share'] = $this->request->post['recruitsetting_share'];
		} else {
			$data['recruitsetting_share'] = $this->config->get('recruitsetting_share');
		}
		
		if (isset($this->request->post['recruitsetting_post_thumb'])) {
			$data['recruitsetting_post_thumb'] = $this->request->post['recruitsetting_post_thumb'];
		} else {
			$data['recruitsetting_post_thumb'] = $this->config->get('recruitsetting_post_thumb');
		}
		
		if (isset($this->request->post['recruitsetting_rel_characters'])) {
			$data['recruitsetting_rel_characters'] = $this->request->post['recruitsetting_rel_characters'];
		} else {
			$data['recruitsetting_rel_characters'] = $this->config->get('recruitsetting_rel_characters');
		}
		
		if (isset($this->request->post['recruitsetting_rel_recruit_per_row'])) {
			$data['recruitsetting_rel_recruit_per_row'] = $this->request->post['recruitsetting_rel_recruit_per_row'];
		} else {
			$data['recruitsetting_rel_recruit_per_row'] = $this->config->get('recruitsetting_rel_recruit_per_row');
		}
		
		if (isset($this->request->post['recruitsetting_rel_thumb'])) {
			$data['recruitsetting_rel_thumb'] = $this->request->post['recruitsetting_rel_thumb'];
		} else {
			$data['recruitsetting_rel_thumb'] = $this->config->get('recruitsetting_rel_thumb');
		}
		
		if (isset($this->request->post['recruitsetting_rel_thumbs_w'])) {
			$data['recruitsetting_rel_thumbs_w'] = $this->request->post['recruitsetting_rel_thumbs_w'];
		} else {
			$data['recruitsetting_rel_thumbs_w'] = $this->config->get('recruitsetting_rel_thumbs_w');
		}
		
		if (isset($this->request->post['recruitsetting_rel_thumbs_h'])) {
			$data['recruitsetting_rel_thumbs_h'] = $this->request->post['recruitsetting_rel_thumbs_h'];
		} else {
			$data['recruitsetting_rel_thumbs_h'] = $this->config->get('recruitsetting_rel_thumbs_h');
		}
		
		if (isset($this->request->post['recruitsetting_post_date_added'])) {
			$data['recruitsetting_post_date_added'] = $this->request->post['recruitsetting_post_date_added'];
		} else {
			$data['recruitsetting_post_date_added'] = $this->config->get('recruitsetting_post_date_added');
		}
		
		if (isset($this->request->post['recruitsetting_post_comments_count'])) {
			$data['recruitsetting_post_comments_count'] = $this->request->post['recruitsetting_post_comments_count'];
		} else {
			$data['recruitsetting_post_comments_count'] = $this->config->get('recruitsetting_post_comments_count');
		}
		
		if (isset($this->request->post['recruitsetting_post_page_view'])) {
			$data['recruitsetting_post_page_view'] = $this->request->post['recruitsetting_post_page_view'];
		} else {
			$data['recruitsetting_post_page_view'] = $this->config->get('recruitsetting_post_page_view');
		}
		
		if (isset($this->request->post['recruitsetting_post_author'])) {
			$data['recruitsetting_post_author'] = $this->request->post['recruitsetting_post_author'];
		} else {
			$data['recruitsetting_post_author'] = $this->config->get('recruitsetting_post_author');
		}
		
		if (isset($this->request->post['recruitsetting_comment_per_page'])) {
			$data['recruitsetting_comment_per_page'] = $this->request->post['recruitsetting_comment_per_page'];
		} else {
			$data['recruitsetting_comment_per_page'] = $this->config->get('recruitsetting_comment_per_page');
		}
		
		if (isset($this->request->post['recruitsetting_comment_approve'])) {
			$data['recruitsetting_comment_approve'] = $this->request->post['recruitsetting_comment_approve'];
		} else {
			$data['recruitsetting_comment_approve'] = $this->config->get('recruitsetting_comment_approve');
		}
		
		if (isset($this->request->post['recruitsetting_comment_notification'])) {
			$data['recruitsetting_comment_notification'] = $this->request->post['recruitsetting_comment_notification'];
		} else {
			$data['recruitsetting_comment_notification'] = $this->config->get('recruitsetting_comment_notification');
		}
		
		if (isset($this->request->post['recruitsetting_author_change'])) {
			$data['recruitsetting_author_change'] = $this->request->post['recruitsetting_author_change'];
		} else {
			$data['recruitsetting_author_change'] = $this->config->get('recruitsetting_author_change');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('recruit/recruit_setting', $data)); 
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'recruit/recruit_setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}