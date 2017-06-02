<?php 
class ControllerRecruitRecruitCategory extends Controller { 
	private $error = array();
 
	public function index() {
		$this->load->language('recruit/recruit_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('recruit/recruit_category');
		 
		$this->getList();
	}

	public function insert() {
		$this->load->language('recruit/recruit_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('recruit/recruit_category');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_recruit_recruit_category->addRecruitCategory($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('recruit/recruit_category', 'token=' . $this->session->data['token'], true));
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('recruit/recruit_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('recruit/recruit_category');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_recruit_recruit_category->editRecruitCategory($this->request->get['recruit_category_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('recruit/recruit_category', 'token=' . $this->session->data['token'], true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('recruit/recruit_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('recruit/recruit_category');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $recruit_category_id) {
				$this->model_recruit_recruit_category->deleteRecruitCategory($recruit_category_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('recruit/recruit_category', 'token=' . $this->session->data['token'], true));
		}

		$this->getList();
	}

	private function getList() {
   		$url = "";
		
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('recruit/recruit_category', 'token=' . $this->session->data['token'], true)
   		);
									
		$data['add'] = $this->url->link('recruit/recruit_category/insert', 'token=' . $this->session->data['token'], true);
		$data['delete'] = $this->url->link('recruit/recruit_category/delete', 'token=' . $this->session->data['token'], true);
		
		
		$data['recruit_categories'] = array();
		
		$results = $this->model_recruit_recruit_category->getRecruitCategories(0);

		foreach ($results as $result) {

			$data['recruit_categories'][] = array(
				'recruit_category_id' => $result['recruit_category_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
				'status'  => $result['status'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['recruit_category_id'], $this->request->post['selected']),
				'edit'        => $this->url->link('recruit/recruit_category/update', 'token=' . $this->session->data['token'] . '&recruit_category_id=' . $result['recruit_category_id'] . $url, true)
			);
		}
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_list'] = $this->language->get('heading_list');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');
		
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_edit'] = $this->language->get('button_edit');
		
		$data['text_confirm'] = $this->language->get('text_confirm');
 
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('recruit/recruit_category_list', $data)); 
	}

	private function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_form'] = $this->language->get('heading_form');
		
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
    	$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');
				
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_page_title'] = $this->language->get('entry_page_title');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_parent'] = $this->language->get('entry_parent');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_layout'] = $this->language->get('entry_layout');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

    	$data['tab_general'] = $this->language->get('tab_general');
    	$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_links'] = $this->language->get('tab_links');
		$data['tab_design'] = $this->language->get('tab_design');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
	
 		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('recruit/recruit_category', 'token=' . $this->session->data['token'], true)
   		);
		
		if (!isset($this->request->get['recruit_category_id'])) {
			$data['action'] = $this->url->link('recruit/recruit_category/insert', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('recruit/recruit_category/update', 'token=' . $this->session->data['token'] . '&recruit_category_id=' . $this->request->get['recruit_category_id']);
		}
		
		$data['cancel'] = $this->url->link('recruit/recruit_category', 'token=' . $this->session->data['token'], true);

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['recruit_category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$recruit_category_info = $this->model_recruit_recruit_category->getRecruitCategory($this->request->get['recruit_category_id']);
    	}
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['recruit_category_description'])) {
			$data['recruit_category_description'] = $this->request->post['recruit_category_description'];
		} elseif (isset($recruit_category_info)) {
			$data['recruit_category_description'] = $this->model_recruit_recruit_category->getRecruitCategoryDescriptions($this->request->get['recruit_category_id']);
		} else {
			$data['recruit_category_description'] = array();
		}

		$recruit_categories = $this->model_recruit_recruit_category->getRecruitCategories(0);

		// Remove own id from list
		if (isset($recruit_category_info)) {
			foreach ($recruit_categories as $key => $recruit_category) {
				if ($recruit_category['recruit_category_id'] == $recruit_category_info['recruit_category_id']) {
					unset($recruit_categories[$key]);
				}
			}
		}

		$data['recruit_categories'] = $recruit_categories;

		if (isset($this->request->post['parent_id'])) {
			$data['parent_id'] = $this->request->post['parent_id'];
		} elseif (isset($recruit_category_info)) {
			$data['parent_id'] = $recruit_category_info['parent_id'];
		} else {
			$data['parent_id'] = 0;
		}
						
		$this->load->model('setting/store');
		
		$data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['recruit_category_store'])) {
			$data['recruit_category_store'] = $this->request->post['recruit_category_store'];
		} elseif (isset($recruit_category_info)) {
			$data['recruit_category_store'] = $this->model_recruit_recruit_category->getRecruitCategoryStores($this->request->get['recruit_category_id']);
		} else {
			$data['recruit_category_store'] = array(0);
		}			
		
		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (isset($recruit_category_info)) {
			$data['keyword'] = $recruit_category_info['keyword'];
		} else {
			$data['keyword'] = '';
		}
				
		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($recruit_category_info)) {
			$data['sort_order'] = $recruit_category_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($recruit_category_info)) {
			$data['status'] = $recruit_category_info['status'];
		} else {
			$data['status'] = 1;
		}
				
		if (isset($this->request->post['recruit_category_layout'])) {
			$data['recruit_category_layout'] = $this->request->post['recruit_category_layout'];
		} elseif (isset($recruit_category_info)) {
			$data['recruit_category_layout'] = $this->model_recruit_recruit_category->getRecruitCategoryLayouts($this->request->get['recruit_category_id']);
		} else {
			$data['recruit_category_layout'] = array();
		}

		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
						
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('recruit/recruit_category_form', $data)); 
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'recruit/recruit_category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['recruit_category_description'] as $language_id => $value) {
			if ((strlen(utf8_decode($value['name'])) < 2) || (strlen(utf8_decode($value['name'])) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
					
		return !$this->error;
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'recruit/recruit_category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
 
		return !$this->error;
	}
	
	
	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('recruit/recruit_category');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_recruit_recruit_category->getRecruitCategories(0);

			foreach ($results as $result) {
				$json[] = array(
					'category_id' => $result['recruit_category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
}