<?php 
class ControllerDieutriCategory extends Controller {
	
	public function index() {  
		
	$this->language->load('dieutri/dieutri');
	
	$this->load->model('dieutri/dieutri_category');
	
	$this->load->model('dieutri/dieutri');
	
	$data['breadcrumbs'] = array();

	$data['breadcrumbs'][] = array(
		'text'      => $this->language->get('text_home'),
		'href'      => $this->url->link('common/home')
	);

	$data['breadcrumbs'][] = array(
		'text'      => $this->language->get('text_dieutri'),
		'href'      => $this->url->link('dieutri/home')
	);	
		
				
	if (isset($this->request->get['dieutripath'])) {
		$path = '';
		
		$parts = explode('_', $this->request->get['dieutripath']);
		
		foreach ($parts as $path_id) {
			$dieutri_category_info = $this->model_dieutri_dieutri_category->getDieutriCategory($path_id);
				
			if ($dieutri_category_info) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

	       		$data['breadcrumbs'] [] = array(
   	    			'href'      => $this->url->link('dieutri/category', 'dieutripath=' . $path),
    	   			'text'      => $dieutri_category_info['name']
        		);
			}
		}
		
		$dieutri_category_id = array_pop($parts);
			} else {
		$dieutri_category_id = 0;
			}
		
		$dieutri_category_info = $this->model_dieutri_dieutri_category->getDieutriCategory($dieutri_category_id);
		
		if ($dieutri_category_info) {
			
			if ($dieutri_category_info['page_title']) {
			$this->document->setTitle($dieutri_category_info['page_title']);
			} else {
			$this->document->setTitle($dieutri_category_info['name']);
			}
			
			$this->document->setDescription($dieutri_category_info['meta_description']);
			$this->document->setKeywords($dieutri_category_info['meta_keywords']);
			
			$data['heading_title'] = $dieutri_category_info['name'];
			
			if ($dieutri_category_info['description'] == '&lt;p&gt;&lt;br&gt;&lt;/p&gt;') {
			$data['dieutri_category_description'] = '';
			} else {
			$data['dieutri_category_description'] = html_entity_decode($dieutri_category_info['description']);
			}
			
			$data['date_added_status'] = $this->config->get('dieutrisetting_date_added');
			$data['comments_count_status'] = $this->config->get('dieutrisetting_comments_count');
			$data['page_view_status'] = $this->config->get('dieutrisetting_page_view');
			$data['author_status'] = $this->config->get('dieutrisetting_author');
			$data['list_columns'] = $this->config->get('dieutrisetting_layout');
			
      		$data['text_posted_on'] = $this->language->get('text_posted_on');
			$data['text_read'] = $this->language->get('text_read');
			$data['text_posted_by'] = $this->language->get('text_posted_by');
			$data['text_comments'] = $this->language->get('text_comments');
			$data['text_posted_on'] = $this->language->get('text_posted_on');
			
      		$data['text_no_results'] = $this->language->get('text_no_results');
         	$data['text_read_more'] = $this->language->get('text_read_more');

			
			$data['description'] = html_entity_decode($dieutri_category_info['description'], ENT_QUOTES, 'UTF-8');
			
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}  
			
			$this->load->model('dieutri/dieutri');
			$this->load->model('tool/image');
				
			$data['dieutris'] = array();
			
			$dieutris = array(
				'start' => ($page - 1) * $this->config->get('dieutrisetting_dieutris_per_page'),
				'limit' => $this->config->get('dieutrisetting_dieutris_per_page')
			);
        		
			$results = $this->model_dieutri_dieutri->getDieutrisByDieutriCategoryId($dieutri_category_id, ($page - 1) * $this->config->get('dieutrisetting_dieutris_per_page'), $this->config->get('dieutrisetting_dieutris_per_page'));
			foreach ($results as $result) {
      		
			$data['dieutris'][] = array(
				'count_read' => $result['count_read'],
        		'title' => $result['title'],
				'author' => $result['author'],
				'comment_total' => $this->model_dieutri_dieutri->getTotalCommentsByDieutriId($result['dieutri_id']),
        		'date_added_full' => $result['date_added'],
        		'description' => html_entity_decode($result['description']),
        		'short_description' => html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8'),
        		'image' => $this->model_tool_image->resize($result['image'], $this->config->get('dieutrisetting_thumbs_w'), $this->config->get('dieutrisetting_thumbs_h')),
				'href'  => $this->url->link('dieutri/dieutri', 'dieutripath=' . $this->request->get['dieutripath'] . '&dieutri_id=' . $result['dieutri_id'])
				
      		);
    		}
					
			$dieutri_total = $this->model_dieutri_dieutri->getTotalDieutrisByDieutriCategoryId($dieutri_category_id);
			
			$url = '';
			
			$pagination = new Pagination();
			$pagination->total = $dieutri_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('dieutrisetting_dieutris_per_page'); 
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('dieutri/category', 'dieutripath=' . $this->request->get['dieutripath'] . $url . '&page={page}');
			
			$limit = $this->config->get('dieutrisetting_dieutris_per_page');
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($dieutri_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($dieutri_total - $limit)) ? $dieutri_total : ((($page - 1) * $limit) + $limit), $dieutri_total, ceil($dieutri_total / $limit));
			
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			$this->response->setOutput($this->load->view('dieutri/dieutri_category', $data));
			
		} else {
		
			$this->language->load('error/not_found');
			
			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}	
			
			if (isset($this->request->get['dieutripath'])) {	
				$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('dieutri/category', 'dieutripath=' . $path)
			);
			}
			
			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
      	
      		$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
	
}
