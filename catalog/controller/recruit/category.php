<?php
class ControllerRecruitCategory extends Controller {

	private $error = array();

	public function index() {

	$this->language->load('recruit/recruit');

	$this->load->model('recruit/recruit_category');

	$this->load->model('recruit/recruit');

	$data['breadcrumbs'] = array();

	$data['breadcrumbs'][] = array(
		'text'      => $this->language->get('text_home'),
		'href'      => $this->url->link('common/home')
	);

	$data['breadcrumbs'][] = array(
		'text'      => $this->language->get('text_recruit'),
		'href'      => $this->url->link('recruit/home')
	);

	$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
	$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
	$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/vi.js');
	$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');

	if (isset($this->request->get['recruitpath'])) {
		$path = '';

		$parts = explode('_', $this->request->get['recruitpath']);

		foreach ($parts as $path_id) {
			$recruit_category_info = $this->model_recruit_recruit_category->getRecruitCategory($path_id);

			if ($recruit_category_info) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

	       		$data['breadcrumbs'] [] = array(
   	    			'href'      => $this->url->link('recruit/category', 'recruitpath=' . $path),
    	   			'text'      => $recruit_category_info['name']
        		);
			}
		}

		$recruit_category_id = array_pop($parts);
			} else {
		$recruit_category_id = 0;
			}



		$recruit_category_info = $this->model_recruit_recruit_category->getRecruitCategory($recruit_category_id);

		if ($recruit_category_info) {

			if ($recruit_category_info['page_title']) {
			$this->document->setTitle($recruit_category_info['page_title']);
			} else {
			$this->document->setTitle($recruit_category_info['name']);
			}

			$this->document->setDescription($recruit_category_info['meta_description']);
			$this->document->setKeywords($recruit_category_info['meta_keywords']);

			$data['heading_title'] = $recruit_category_info['name'];

			if ($recruit_category_info['description'] == '&lt;p&gt;&lt;br&gt;&lt;/p&gt;') {
			$data['recruit_category_description'] = '';
			} else {
			$data['recruit_category_description'] = html_entity_decode($recruit_category_info['description']);
			}

			$data['date_added_status'] = $this->config->get('recruitsetting_date_added');
			$data['comments_count_status'] = $this->config->get('recruitsetting_comments_count');
			$data['page_view_status'] = $this->config->get('recruitsetting_page_view');
			$data['author_status'] = $this->config->get('recruitsetting_author');
			$data['list_columns'] = $this->config->get('recruitsetting_layout');

      		$data['text_posted_on'] = $this->language->get('text_posted_on');
			$data['text_read'] = $this->language->get('text_read');
			$data['text_posted_by'] = $this->language->get('text_posted_by');
			$data['text_comments'] = $this->language->get('text_comments');
			$data['text_posted_on'] = $this->language->get('text_posted_on');
  		$data['text_no_results'] = $this->language->get('text_no_results');
     	$data['text_read_more'] = $this->language->get('text_read_more');


			$data['description'] = html_entity_decode($recruit_category_info['description'], ENT_QUOTES, 'UTF-8');


			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}

			$this->load->model('recruit/recruit');
			$this->load->model('tool/image');

			$data['recruits'] = array();

			$recruits = array(
				'start' => ($page - 1) * $this->config->get('recruitsetting_recruits_per_page'),
				'limit' => $this->config->get('recruitsetting_recruits_per_page')
			);

			$results = $this->model_recruit_recruit->getRecruitsByRecruitCategoryId($recruit_category_id, ($page - 1) * $this->config->get('recruitsetting_recruits_per_page'), $this->config->get('recruitsetting_recruits_per_page'));
			foreach ($results as $result) {

			$data['recruits'][] = array(
						'count_read' => $result['count_read'],
        		'recruit_id' => $result['recruit_id'],
        		'title' => $result['title'],
						'author' => $result['author'],
						'comment_total' => $this->model_recruit_recruit->getTotalCommentsByRecruitId($result['recruit_id']),
        		'date_added_full' => $result['date_added'],
        		'date_timeout' => $result['date_timeout'],
        		'description' => html_entity_decode($result['description']),
        		'short_description' => html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8'),
        		'image' => $this->model_tool_image->resize($result['image'], $this->config->get('recruitsetting_thumbs_w'), $this->config->get('recruitsetting_thumbs_h')),
						'href'  => $this->url->link('recruit/recruit', '&recruit_id=' . $result['recruit_id'])

      		);
    		}

			$recruit_total = $this->model_recruit_recruit->getTotalRecruitsByRecruitCategoryId($recruit_category_id);


			$url = '';

			$pagination = new Pagination();
			$pagination->total = $recruit_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('recruitsetting_recruits_per_page');
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('recruit/category', 'recruitpath=' . $this->request->get['recruitpath'] . $url . '&page={page}');

			$limit = $this->config->get('recruitsetting_recruits_per_page');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($recruit_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($recruit_total - $limit)) ? $recruit_total : ((($page - 1) * $limit) + $limit), $recruit_total, ceil($recruit_total / $limit));

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('recruit/recruit_category', $data));

		} else {

			$this->language->load('error/not_found');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['recruitpath'])) {
				$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('recruit/category', 'recruitpath=' . $path)
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
