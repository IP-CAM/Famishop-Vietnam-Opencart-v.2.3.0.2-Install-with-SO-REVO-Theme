<?php
class ControllerRecruitHome extends Controller {
	private $error = array();

	public function index() {
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/vi.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');

    	$this->language->load('recruit/recruit');

		$this->load->model('recruit/recruit');

		$this->load->model('tool/image');

		$data['breadcrumbs'] = array();

      	$data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home')
      	);

      	$data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_recruit'),
			'href'      => $this->url->link('recruit/home')
      	);

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if( isset($this->request->get['tag']) ){
				$filter_tag = $this->request->get['tag'];
		}else {
				$filter_tag = '';
		}

		$data['recruits'] = array();

		$filter_data = array(
			'start' => ($page - 1) * $this->config->get('recruitsetting_recruits_per_page'),
			'limit' => $this->config->get('recruitsetting_recruits_per_page'),
			'filter_tag'  => $filter_tag,
		);




		$limit = $this->config->get('recruitsetting_recruits_per_page');

		$recruit_total = $this->model_recruit_recruit->getTotalRecruits($filter_data);

		$results = $this->model_recruit_recruit->getRecruits($filter_data, ($page - 1) * $this->config->get('recruitsetting_recruits_per_page'), $this->config->get('recruitsetting_recruits_per_page'));

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

		$recruit_title = $this->config->get('recruitsetting_home_title');

		if( $filter_tag ){
				$data['heading_title'] = $this->language->get('text_filter_by') . $filter_tag;
			} else {
				$data['heading_title'] = $recruit_title[$this->config->get('config_language_id')];
			}

		$recruit_page_title = $this->config->get('recruitsetting_home_page_title');
		if ($recruit_page_title[$this->config->get('config_language_id')]) {
		$this->document->setTitle($recruit_page_title[$this->config->get('config_language_id')]);
		} else {
		$this->document->setTitle($recruit_title[$this->config->get('config_language_id')]);
		}

		$recruit_page_meta_description = $this->config->get('recruitsetting_home_meta_description');
		if ($recruit_page_meta_description[$this->config->get('config_language_id')]) {
		$this->document->setDescription($recruit_page_meta_description[$this->config->get('config_language_id')]);
		}

		$recruit_page_meta_keyword = $this->config->get('recruitsetting_home_meta_keyword');
		if ($recruit_page_meta_keyword[$this->config->get('config_language_id')]) {
		$this->document->setKeywords($recruit_page_meta_keyword[$this->config->get('config_language_id')]);
		}


		$recruit_description = $this->config->get('recruitsetting_home_description');

		if ($recruit_description[$this->config->get('config_language_id')] == '&lt;p&gt;&lt;br&gt;&lt;/p&gt;') {
			$data['description'] = false;
			} else {
			$data['description'] = html_entity_decode(($recruit_description[$this->config->get('config_language_id')]), ENT_QUOTES, 'UTF-8');
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

		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_read_more'] = $this->language->get('text_read_more');

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		$pagination = new Pagination();
		$pagination->total = $recruit_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('recruitsetting_recruits_per_page');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('recruit/home', $url . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($recruit_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($recruit_total - $limit)) ? $recruit_total : ((($page - 1) * $limit) + $limit), $recruit_total, ceil($recruit_total / $limit));

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('recruit/recruit_home', $data));

	}


}
