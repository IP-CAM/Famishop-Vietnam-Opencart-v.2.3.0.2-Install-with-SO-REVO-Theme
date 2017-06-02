<?php
class ControllerDieutriDieutriSetting extends Controller { 
	private $error = array();

	public function index() {
		
		$this->load->language('dieutri/dieutri_setting');

		$this->document->setTitle($this->language->get('heading_title'));
		 
		$this->load->model('dieutri/dieutri_setting');
		
		$this->model_dieutri_dieutri_setting->install();
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_dieutri_dieutri_setting->editDieutriSetting('dieutrisetting', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('dieutri/dieutri_setting', 'token=' . $this->session->data['token'], true));
		}
	
		$data['error_missing'] = $this->language->get('error_missing');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_dieutri_home'] = $this->language->get('heading_dieutri_home');
		$data['heading_dieutri_listing'] = $this->language->get('heading_dieutri_listing');
		$data['heading_dieutri_listing_h'] = $this->language->get('heading_dieutri_listing_h');
		$data['heading_dieutri_post'] = $this->language->get('heading_dieutri_post');
		$data['heading_related'] = $this->language->get('heading_related');
		$data['heading_comments'] = $this->language->get('heading_comments');
		$data['heading_author'] = $this->language->get('heading_author');

		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		
		$data['entry_dieutrisetting_home_title'] = $this->language->get('entry_dieutrisetting_home_title');
		$data['entry_dieutrisetting_home_page_title'] = $this->language->get('entry_dieutrisetting_home_page_title');
		$data['entry_dieutrisetting_home_description'] = $this->language->get('entry_dieutrisetting_home_description');
		$data['entry_dieutrisetting_home_meta_description'] = $this->language->get('entry_dieutrisetting_home_meta_description');
		$data['entry_dieutrisetting_home_meta_keyword'] = $this->language->get('entry_dieutrisetting_home_meta_keyword');
		$data['entry_dieutrisetting_home_url'] = $this->language->get('entry_dieutrisetting_home_url');
		$data['entry_dieutrisetting_home_url_h'] = $this->language->get('entry_dieutrisetting_home_url_h');
		$data['entry_dieutrisetting_dieutris_per_page'] = $this->language->get('entry_dieutrisetting_dieutris_per_page');
		$data['entry_dieutrisetting_layout'] = $this->language->get('entry_dieutrisetting_layout');
		$data['entry_dieutrisetting_thumbs_w'] = $this->language->get('entry_dieutrisetting_thumbs_w');
		$data['entry_dieutrisetting_thumbs_h'] = $this->language->get('entry_dieutrisetting_thumbs_h');
		$data['entry_dieutrisetting_date_added'] = $this->language->get('entry_dieutrisetting_date_added');
		$data['entry_dieutrisetting_comments_count'] = $this->language->get('entry_dieutrisetting_comments_count');
		$data['entry_dieutrisetting_page_view'] = $this->language->get('entry_dieutrisetting_page_view');
		$data['entry_dieutrisetting_author'] = $this->language->get('entry_dieutrisetting_author');
		$data['entry_dieutrisetting_share'] = $this->language->get('entry_dieutrisetting_share');
		$data['entry_dieutrisetting_post_thumb'] = $this->language->get('entry_dieutrisetting_post_thumb');
		$data['entry_dieutrisetting_rel_characters'] = $this->language->get('entry_dieutrisetting_rel_characters');
		$data['entry_dieutrisetting_rel_dieutri_per_row'] = $this->language->get('entry_dieutrisetting_rel_dieutri_per_row');
		$data['entry_dieutrisetting_rel_thumb'] = $this->language->get('entry_dieutrisetting_rel_thumb');
		$data['entry_dieutrisetting_rel_thumbs_w'] = $this->language->get('entry_dieutrisetting_rel_thumbs_w');
		$data['entry_dieutrisetting_rel_thumbs_h'] = $this->language->get('entry_dieutrisetting_rel_thumbs_h');
		$data['entry_dieutrisetting_post_date_added'] = $this->language->get('entry_dieutrisetting_post_date_added');
		$data['entry_dieutrisetting_post_comments_count'] = $this->language->get('entry_dieutrisetting_post_comments_count');
		$data['entry_dieutrisetting_post_page_view'] = $this->language->get('entry_dieutrisetting_post_page_view');
		$data['entry_dieutrisetting_post_author'] = $this->language->get('entry_dieutrisetting_post_author');
		$data['entry_dieutrisetting_comment_per_page'] = $this->language->get('entry_dieutrisetting_comment_per_page');
		$data['entry_dieutrisetting_comment_approve'] = $this->language->get('entry_dieutrisetting_comment_approve');
		$data['entry_dieutrisetting_comment_approve_h'] = $this->language->get('entry_dieutrisetting_comment_approve_h');
		$data['entry_dieutrisetting_comment_notification'] = $this->language->get('entry_dieutrisetting_comment_notification');
		$data['entry_dieutrisetting_comment_notification_h'] = $this->language->get('entry_dieutrisetting_comment_notification_h');
		$data['entry_dieutrisetting_author_change'] = $this->language->get('entry_dieutrisetting_author_change');
		$data['entry_dieutrisetting_author_change_h'] = $this->language->get('entry_dieutrisetting_author_change_h');
		$data['entry_dieutrisetting_thumb_size'] = $this->language->get('entry_dieutrisetting_thumb_size');
		$data['entry_dieutrisetting_rel_thumbs'] = $this->language->get('entry_dieutrisetting_rel_thumbs');

		
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
			'href'      => $this->url->link('dieutri/dieutri_setting', 'token=' . $this->session->data['token'] . $url, true)
   		);
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
							
		$data['action'] = $this->url->link('dieutri/dieutri_setting', 'token=' . $this->session->data['token'], true);
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['dieutrisetting_home_title'])) {
			$data['dieutrisetting_home_title'] = $this->request->post['dieutrisetting_home_title'];
		} else {
			$data['dieutrisetting_home_title'] = $this->config->get('dieutrisetting_home_title');
		}
		
		if (isset($this->request->post['dieutrisetting_home_page_title'])) {
			$data['dieutrisetting_home_page_title'] = $this->request->post['dieutrisetting_home_page_title'];
		} else {
			$data['dieutrisetting_home_page_title'] = $this->config->get('dieutrisetting_home_page_title');
		}
		
		if (isset($this->request->post['dieutrisetting_home_description'])) {
			$data['dieutrisetting_home_description'] = $this->request->post['dieutrisetting_home_description'];
		} else {
			$data['dieutrisetting_home_description'] = $this->config->get('dieutrisetting_home_description');
		}
		
		if (isset($this->request->post['dieutrisetting_home_meta_description'])) {
			$data['dieutrisetting_home_meta_description'] = $this->request->post['dieutrisetting_home_meta_description'];
		} else {
			$data['dieutrisetting_home_meta_description'] = $this->config->get('dieutrisetting_home_meta_description');
		}
		
		if (isset($this->request->post['dieutrisetting_home_meta_keyword'])) {
			$data['dieutrisetting_home_meta_keyword'] = $this->request->post['dieutrisetting_home_meta_keyword'];
		} else {
			$data['dieutrisetting_home_meta_keyword'] = $this->config->get('dieutrisetting_home_meta_keyword');
		}
		
		$home_url = $this->model_dieutri_dieutri_setting->getHomeKeyword();
		
		if (isset($this->request->post['dieutri_home_url'])) {
			$data['dieutri_home_url'] = $this->request->post['dieutri_home_url'];
		} else if (isset($home_url['keyword'])) {
			$data['dieutri_home_url'] = $home_url['keyword'];
		} else {
			$data['dieutri_home_url'] = false;
		}
		
		
		
		if (isset($this->request->post['dieutrisetting_home_title'])) {
			$data['dieutrisetting_home_title'] = $this->request->post['dieutrisetting_home_title'];
		} else {
			$data['dieutrisetting_home_title'] = $this->config->get('dieutrisetting_home_title');
		}
		
		if (isset($this->request->post['dieutrisetting_home_page_title'])) {
			$data['dieutrisetting_home_page_title'] = $this->request->post['dieutrisetting_home_page_title'];
		} else {
			$data['dieutrisetting_home_page_title'] = $this->config->get('dieutrisetting_home_page_title');
		}
		
		if (isset($this->request->post['dieutrisetting_home_description'])) {
			$data['dieutrisetting_home_description'] = $this->request->post['dieutrisetting_home_description'];
		} else {
			$data['dieutrisetting_home_description'] = $this->config->get('dieutrisetting_home_description');
		}
		
		if (isset($this->request->post['dieutrisetting_home_meta_description'])) {
			$data['dieutrisetting_home_meta_description'] = $this->request->post['dieutrisetting_home_meta_description'];
		} else {
			$data['dieutrisetting_home_meta_description'] = $this->config->get('dieutrisetting_home_meta_description');
		}
		
		if (isset($this->request->post['dieutrisetting_home_meta_keyword'])) {
			$data['dieutrisetting_home_meta_keyword'] = $this->request->post['dieutrisetting_home_meta_keyword'];
		} else {
			$data['dieutrisetting_home_meta_keyword'] = $this->config->get('dieutrisetting_home_meta_keyword');
		}
		
		if (isset($this->request->post['dieutrisetting_home_url'])) {
			$data['dieutrisetting_home_url'] = $this->request->post['dieutrisetting_home_url'];
		} else {
			$data['dieutrisetting_home_url'] = $this->config->get('dieutrisetting_home_url');
		}
		
		if (isset($this->request->post['dieutrisetting_home_url'])) {
			$data['dieutrisetting_home_url'] = $this->request->post['dieutrisetting_home_url'];
		} else {
			$data['dieutrisetting_home_url'] = $this->config->get('dieutrisetting_home_url');
		}
		
		if (isset($this->request->post['dieutrisetting_dieutris_per_page'])) {
			$data['dieutrisetting_dieutris_per_page'] = $this->request->post['dieutrisetting_dieutris_per_page'];
		} else {
			$data['dieutrisetting_dieutris_per_page'] = $this->config->get('dieutrisetting_dieutris_per_page');
		}
		
		if (isset($this->request->post['dieutrisetting_layout'])) {
			$data['dieutrisetting_layout'] = $this->request->post['dieutrisetting_layout'];
		} else {
			$data['dieutrisetting_layout'] = $this->config->get('dieutrisetting_layout');
		}
		
		if (isset($this->request->post['dieutrisetting_thumbs_w'])) {
			$data['dieutrisetting_thumbs_w'] = $this->request->post['dieutrisetting_thumbs_w'];
		} else {
			$data['dieutrisetting_thumbs_w'] = $this->config->get('dieutrisetting_thumbs_w');
		}
		
		if (isset($this->request->post['dieutrisetting_thumbs_h'])) {
			$data['dieutrisetting_thumbs_h'] = $this->request->post['dieutrisetting_thumbs_h'];
		} else {
			$data['dieutrisetting_thumbs_h'] = $this->config->get('dieutrisetting_thumbs_h');
		}
		
		if (isset($this->request->post['dieutrisetting_post_thumbs_w'])) {
			$data['dieutrisetting_post_thumbs_w'] = $this->request->post['dieutrisetting_post_thumbs_w'];
		} else {
			$data['dieutrisetting_post_thumbs_w'] = $this->config->get('dieutrisetting_post_thumbs_w');
		}
		
		if (isset($this->request->post['dieutrisetting_post_thumbs_h'])) {
			$data['dieutrisetting_post_thumbs_h'] = $this->request->post['dieutrisetting_post_thumbs_h'];
		} else {
			$data['dieutrisetting_post_thumbs_h'] = $this->config->get('dieutrisetting_post_thumbs_h');
		}
		
		if (isset($this->request->post['dieutrisetting_date_added'])) {
			$data['dieutrisetting_date_added'] = $this->request->post['dieutrisetting_date_added'];
		} else {
			$data['dieutrisetting_date_added'] = $this->config->get('dieutrisetting_date_added');
		}
		
		if (isset($this->request->post['dieutrisetting_comments_count'])) {
			$data['dieutrisetting_comments_count'] = $this->request->post['dieutrisetting_comments_count'];
		} else {
			$data['dieutrisetting_comments_count'] = $this->config->get('dieutrisetting_comments_count');
		}
		
		if (isset($this->request->post['dieutrisetting_page_view'])) {
			$data['dieutrisetting_page_view'] = $this->request->post['dieutrisetting_page_view'];
		} else {
			$data['dieutrisetting_page_view'] = $this->config->get('dieutrisetting_page_view');
		}
		
		if (isset($this->request->post['dieutrisetting_page_view'])) {
			$data['dieutrisetting_page_view'] = $this->request->post['dieutrisetting_page_view'];
		} else {
			$data['dieutrisetting_page_view'] = $this->config->get('dieutrisetting_page_view');
		}
		
		if (isset($this->request->post['dieutrisetting_author'])) {
			$data['dieutrisetting_author'] = $this->request->post['dieutrisetting_author'];
		} else {
			$data['dieutrisetting_author'] = $this->config->get('dieutrisetting_author');
		}
		
		if (isset($this->request->post['dieutrisetting_share'])) {
			$data['dieutrisetting_share'] = $this->request->post['dieutrisetting_share'];
		} else {
			$data['dieutrisetting_share'] = $this->config->get('dieutrisetting_share');
		}
		
		if (isset($this->request->post['dieutrisetting_post_thumb'])) {
			$data['dieutrisetting_post_thumb'] = $this->request->post['dieutrisetting_post_thumb'];
		} else {
			$data['dieutrisetting_post_thumb'] = $this->config->get('dieutrisetting_post_thumb');
		}
		
		if (isset($this->request->post['dieutrisetting_rel_characters'])) {
			$data['dieutrisetting_rel_characters'] = $this->request->post['dieutrisetting_rel_characters'];
		} else {
			$data['dieutrisetting_rel_characters'] = $this->config->get('dieutrisetting_rel_characters');
		}
		
		if (isset($this->request->post['dieutrisetting_rel_dieutri_per_row'])) {
			$data['dieutrisetting_rel_dieutri_per_row'] = $this->request->post['dieutrisetting_rel_dieutri_per_row'];
		} else {
			$data['dieutrisetting_rel_dieutri_per_row'] = $this->config->get('dieutrisetting_rel_dieutri_per_row');
		}
		
		if (isset($this->request->post['dieutrisetting_rel_thumb'])) {
			$data['dieutrisetting_rel_thumb'] = $this->request->post['dieutrisetting_rel_thumb'];
		} else {
			$data['dieutrisetting_rel_thumb'] = $this->config->get('dieutrisetting_rel_thumb');
		}
		
		if (isset($this->request->post['dieutrisetting_rel_thumbs_w'])) {
			$data['dieutrisetting_rel_thumbs_w'] = $this->request->post['dieutrisetting_rel_thumbs_w'];
		} else {
			$data['dieutrisetting_rel_thumbs_w'] = $this->config->get('dieutrisetting_rel_thumbs_w');
		}
		
		if (isset($this->request->post['dieutrisetting_rel_thumbs_h'])) {
			$data['dieutrisetting_rel_thumbs_h'] = $this->request->post['dieutrisetting_rel_thumbs_h'];
		} else {
			$data['dieutrisetting_rel_thumbs_h'] = $this->config->get('dieutrisetting_rel_thumbs_h');
		}
		
		if (isset($this->request->post['dieutrisetting_post_date_added'])) {
			$data['dieutrisetting_post_date_added'] = $this->request->post['dieutrisetting_post_date_added'];
		} else {
			$data['dieutrisetting_post_date_added'] = $this->config->get('dieutrisetting_post_date_added');
		}
		
		if (isset($this->request->post['dieutrisetting_post_comments_count'])) {
			$data['dieutrisetting_post_comments_count'] = $this->request->post['dieutrisetting_post_comments_count'];
		} else {
			$data['dieutrisetting_post_comments_count'] = $this->config->get('dieutrisetting_post_comments_count');
		}
		
		if (isset($this->request->post['dieutrisetting_post_page_view'])) {
			$data['dieutrisetting_post_page_view'] = $this->request->post['dieutrisetting_post_page_view'];
		} else {
			$data['dieutrisetting_post_page_view'] = $this->config->get('dieutrisetting_post_page_view');
		}
		
		if (isset($this->request->post['dieutrisetting_post_author'])) {
			$data['dieutrisetting_post_author'] = $this->request->post['dieutrisetting_post_author'];
		} else {
			$data['dieutrisetting_post_author'] = $this->config->get('dieutrisetting_post_author');
		}
		
		if (isset($this->request->post['dieutrisetting_comment_per_page'])) {
			$data['dieutrisetting_comment_per_page'] = $this->request->post['dieutrisetting_comment_per_page'];
		} else {
			$data['dieutrisetting_comment_per_page'] = $this->config->get('dieutrisetting_comment_per_page');
		}
		
		if (isset($this->request->post['dieutrisetting_comment_approve'])) {
			$data['dieutrisetting_comment_approve'] = $this->request->post['dieutrisetting_comment_approve'];
		} else {
			$data['dieutrisetting_comment_approve'] = $this->config->get('dieutrisetting_comment_approve');
		}
		
		if (isset($this->request->post['dieutrisetting_comment_notification'])) {
			$data['dieutrisetting_comment_notification'] = $this->request->post['dieutrisetting_comment_notification'];
		} else {
			$data['dieutrisetting_comment_notification'] = $this->config->get('dieutrisetting_comment_notification');
		}
		
		if (isset($this->request->post['dieutrisetting_author_change'])) {
			$data['dieutrisetting_author_change'] = $this->request->post['dieutrisetting_author_change'];
		} else {
			$data['dieutrisetting_author_change'] = $this->config->get('dieutrisetting_author_change');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('dieutri/dieutri_setting', $data)); 
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'dieutri/dieutri_setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}