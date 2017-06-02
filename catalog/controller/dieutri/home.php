<?php
class ControllerDieutriHome extends Controller {
	private $error = array();

	public function index() {

    $this->response->redirect($this->url->link('common/home'));
		$this->language->load('dieutri/dieutri');

		$this->load->model('dieutri/dieutri');

		$this->load->model('tool/image');

		$data['breadcrumbs'] = array();

      	$data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home')
      	);

      	$data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_dieutri'),
			'href'      => $this->url->link('dieutri/home')
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

		$data['dieutris'] = array();

		$filter_data = array(
			'start' => ($page - 1) * $this->config->get('dieutrisetting_dieutris_per_page'),
			'limit' => $this->config->get('dieutrisetting_dieutris_per_page'),
			'filter_tag'  => $filter_tag,
		);




		$limit = $this->config->get('dieutrisetting_dieutris_per_page');

		$dieutri_total = $this->model_dieutri_dieutri->getTotalDieutris($filter_data);

		$results = $this->model_dieutri_dieutri->getDieutris($filter_data, ($page - 1) * $this->config->get('dieutrisetting_dieutris_per_page'), $this->config->get('dieutrisetting_dieutris_per_page'));

    	foreach ($results as $result) {

			$data['dieutris'][] = array(
			'count_read' => $result['count_read'],
			'comment_total' => $this->model_dieutri_dieutri->getTotalCommentsByDieutriId($result['dieutri_id']),
			'dieutri_id' => $result['dieutri_id'],
			'title'      => $result['title'],
			'short_description'      => html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8'),
			'date_added_full' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
			'author' => $result['author'],
			'image'   		=> $this->model_tool_image->resize($result['image'], $this->config->get('dieutrisetting_thumbs_w'), $this->config->get('dieutrisetting_thumbs_h')),
			'href' => $this->url->link('dieutri/dieutri', 'dieutri_id=' . $result['dieutri_id'])
			);
		}

		$dieutri_title = $this->config->get('dieutrisetting_home_title');

		if( $filter_tag ){
				$data['heading_title'] = $this->language->get('text_filter_by') . $filter_tag;
			} else {
				$data['heading_title'] = $dieutri_title[$this->config->get('config_language_id')];
			}

		$dieutri_page_title = $this->config->get('dieutrisetting_home_page_title');
		if ($dieutri_page_title[$this->config->get('config_language_id')]) {
		$this->document->setTitle($dieutri_page_title[$this->config->get('config_language_id')]);
		} else {
		$this->document->setTitle($dieutri_title[$this->config->get('config_language_id')]);
		}

		$dieutri_page_meta_description = $this->config->get('dieutrisetting_home_meta_description');
		if ($dieutri_page_meta_description[$this->config->get('config_language_id')]) {
		$this->document->setDescription($dieutri_page_meta_description[$this->config->get('config_language_id')]);
		}

		$dieutri_page_meta_keyword = $this->config->get('dieutrisetting_home_meta_keyword');
		if ($dieutri_page_meta_keyword[$this->config->get('config_language_id')]) {
		$this->document->setKeywords($dieutri_page_meta_keyword[$this->config->get('config_language_id')]);
		}


		$dieutri_description = $this->config->get('dieutrisetting_home_description');

		if ($dieutri_description[$this->config->get('config_language_id')] == '&lt;p&gt;&lt;br&gt;&lt;/p&gt;') {
			$data['description'] = false;
			} else {
			$data['description'] = html_entity_decode(($dieutri_description[$this->config->get('config_language_id')]), ENT_QUOTES, 'UTF-8');
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

		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_read_more'] = $this->language->get('text_read_more');

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		$pagination = new Pagination();
		$pagination->total = $dieutri_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('dieutrisetting_dieutris_per_page');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('dieutri/home', $url . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($dieutri_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($dieutri_total - $limit)) ? $dieutri_total : ((($page - 1) * $limit) + $limit), $dieutri_total, ceil($dieutri_total / $limit));

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('dieutri/dieutri_home', $data));

	}


}
