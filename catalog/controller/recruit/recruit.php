<?php
class ControllerRecruitRecruit extends Controller {

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

		$this->load->model('recruit/recruit_category');

		if (isset($this->request->get['recruitpath'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['recruitpath']);

			$recruit_category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_recruit_recruit_category->getRecruitCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('recruit/category', 'recruitpath=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_recruit_recruit_category->getRecruitCategory($recruit_category_id);

			if ($category_info) {
				$url = '';

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('recruit/category', 'recruitpath=' . $this->request->get['recruitpath'] . $url)
				);
			}
		}

		if (isset($this->request->get['recruit_id'])) {
			$recruit_id = $this->request->get['recruit_id'];
		} else {
			$recruit_id = 0;
		}

		$filter_data = array();

		$data['recruits'] = $this->model_recruit_recruit->getRecruits($filter_data,0,100);

		$recruit_info = $this->model_recruit_recruit->getRecruit($recruit_id);

		if ($recruit_info) {
			$url = '';

			if (isset($this->request->get['recruitpath'])) {
				$url .= '&recruitpath=' . $this->request->get['recruitpath'];
			}

			$data['breadcrumbs'][] = array(
			'text'      => $recruit_info['title'],
			'href' => $this->url->link('recruit/recruit', $url . '&recruit_id=' . $this->request->get['recruit_id'])
			);

			$data['new_read_counter_value'] = $recruit_info['count_read']+1;
			$this->model_recruit_recruit->updateRecruitReadCounter($this->request->get['recruit_id'], $data['new_read_counter_value']);
			$data['comment_total'] = $this->model_recruit_recruit->getTotalCommentsByRecruitId($this->request->get['recruit_id']);

			if (isset($this->request->get['recruit_id'])) {

			$data['post_date_added_status'] = $this->config->get('recruitsetting_post_date_added');
			$data['post_comments_count_status'] = $this->config->get('recruitsetting_post_comments_count');
			$data['post_page_view_status'] = $this->config->get('recruitsetting_post_page_view');
			$data['post_author_status'] = $this->config->get('recruitsetting_post_author');
			$data['share_status'] = $this->config->get('recruitsetting_share');
			$data['main_thumb'] = $this->config->get('recruitsetting_post_thumb');

			// Related posts
			$data['date_added_status'] = $this->config->get('recruitsetting_date_added');
			$data['comments_count_status'] = $this->config->get('recruitsetting_comments_count');
			$data['page_view_status'] = $this->config->get('recruitsetting_page_view');
			$data['author_status'] = $this->config->get('recruitsetting_author');
			$data['rel_thumb_status'] = $this->config->get('recruitsetting_rel_thumb');
			$data['rel_per_row'] = $this->config->get('recruitsetting_rel_recruit_per_row');


			$data['related_recruits'] = array();

			$related_recruits = $this->model_recruit_recruit->getRelatedRecruit($this->request->get['recruit_id']);

			foreach ($related_recruits as $result) {
      			$data['related_recruits'][] = array(
        		'title' => $result['title'],
				'count_read' => $result['count_read'],
				'short_description' => utf8_substr(strip_tags(html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('recruitsetting_rel_characters')) . '..',
				'author' => $result['author'],
				'comment_total' => $this->model_recruit_recruit->getTotalCommentsByRecruitId($result['recruit_id']),
        		'date_added_full' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_added' => $result['date_added'],
        		'image' => $this->model_tool_image->resize($result['image'], $this->config->get('recruitsetting_rel_thumbs_w'), $this->config->get('recruitsetting_rel_thumbs_h')),
	    		'href'  => $this->url->link('recruit/recruit', 'recruit_id=' . $result['recruit_id'])
      			);
    		  }
    		}


			if ($recruit_info['page_title']) {
			$this->document->setTitle($recruit_info['page_title']);
			} else {
			$this->document->setTitle($recruit_info['title']);
			}

			$this->document->setDescription($recruit_info['meta_description']);
			$this->document->setKeywords($recruit_info['meta_keyword']);

			$this->document->addLink($this->url->link('recruit/recruit', 'recruit_id=' . $this->request->get['recruit_id']), 'canonical');

      		$data['heading_title'] = $recruit_info['title'];

			$data['description'] = html_entity_decode($recruit_info['description'], ENT_QUOTES, 'UTF-8');

			$data['recruitsetting_post_thumb'] = $this->model_tool_image->resize($recruit_info['image'], $this->config->get('recruitsetting_post_thumbs_w'), $this->config->get('recruitsetting_post_thumbs_h'));

			$data['tags'] = array();

			if ($recruit_info['tags']) {
				$tags = explode(',', $recruit_info['tags']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('recruit/home', 'tag=' . trim($tag))
					);
				}
			}

			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_posted_on'] = $this->language->get('text_posted_on');
			$data['text_posted_by'] = $this->language->get('text_posted_by');
			$data['text_read'] = $this->language->get('text_read');
			$data['text_share_this'] = $this->language->get('text_share_this');

      		$data['text_related_recruit'] = $this->language->get('text_related_recruit');
      		$data['text_read_more'] = $this->language->get('text_read_more');

      		$data['text_write_comment'] = $this->language->get('text_write_comment');

      		$data['entry_name'] = $this->language->get('entry_name');
      		$data['entry_email'] = $this->language->get('entry_email');
			$data['entry_comment'] = $this->language->get('entry_comment');
      		$data['text_comments'] = $this->language->get('text_comments');
			$data['text_write_comment'] = $this->language->get('text_write_comment');

      		$data['entry_captcha'] = $this->language->get('entry_captcha');
      		$data['button_send'] = $this->language->get('button_send');

			$data['post_date_added_status'] = $this->config->get('recruitsetting_post_date_added');
			$data['post_comments_count_status'] = $this->config->get('recruitsetting_post_comments_count');
			$data['post_page_view_status'] = $this->config->get('recruitsetting_post_page_view');
			$data['post_author_status'] = $this->config->get('recruitsetting_post_author');

			$data['date_added_full'] = date($this->language->get('date_format_short'), strtotime($recruit_info['date_added']));
			$data['date_added'] = $recruit_info['date_added'];

			$data['author'] = $recruit_info['author'];

			$data['allow_comment'] = $recruit_info['allow_comment'];

			$data['continue'] = $this->url->link('common/home');

			$data['recruit_id'] = (int)$this->request->get['recruit_id'];


	  		$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('recruit/recruit', $data));

    	} else {

			$url = '';

      		$data['breadcrumbs'] [] = array(
        		'href'      => $this->url->link('recruit/recruit', $url . '&recruit_id=' . $this->request->get['recruit_id']),
        		'text'      => $this->language->get('text_error')
      		);

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


		public function comment() {

		$this->load->language('recruit/recruit');

		$this->load->model('recruit/recruit');

		$data['text_comments'] = $this->language->get('text_comments');

		$data['text_no_comment'] = $this->language->get('text_no_comment');

		if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}

		$data['comments'] = array();

		$comment_total = $this->model_recruit_recruit->getTotalCommentsByRecruitId($this->request->get['recruit_id']);

		$limit = $this->config->get('recruitsetting_comment_per_page');

		$results = $this->model_recruit_recruit->getCommentsByRecruitId($this->request->get['recruit_id'], ($page - 1) * $limit, $limit);

		foreach ($results as $result) {
        		$data['comments'][] = array(
        			'name'     => $result['name'],
					'email'     => $result['email'],
					'comment'       => strip_tags($result['comment']),
        			'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
        		);
      		}


        $pagination = new Pagination();
			$pagination->total = $comment_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('recruitsetting_comment_per_page');
			$pagination->url = $this->url->link('recruit/recruit/comment', 'recruit_id=' . $this->request->get['recruit_id'] . '&page={page}');

			$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($comment_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($comment_total - $limit)) ? $comment_total : ((($page - 1) * $limit) + $limit), $comment_total, ceil($comment_total / $limit));


		$this->response->setOutput($this->load->view('recruit/comment', $data));

}




		public function write() {
		$this->load->language('recruit/recruit');

		$data['entry_comment'] = $this->language->get('entry_comment');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {



			if ((utf8_strlen($this->request->post['comment']) < 5) || (utf8_strlen($this->request->post['comment']) > 3000)) {
				$json['error'] = $this->language->get('error_comment');
			}

			if (!isset($this->request->post['cv']) || (utf8_strlen($this->request->post['cv']) < 1) || (utf8_strlen($this->request->post['cv']) > 255)) {
				$json['error'] = $this->language->get('error_cv');
			}

			if (!isset($this->request->post['vitri']) || (utf8_strlen($this->request->post['vitri']) < 1) || (utf8_strlen($this->request->post['vitri']) > 33)) {
				$json['error'] = $this->language->get('error_vitri');
			}

			if (!isset($this->request->post['country']) || (utf8_strlen($this->request->post['country']) < 1) || (utf8_strlen($this->request->post['country']) > 33)) {
				$json['error'] = $this->language->get('error_country');
			}

			if (!isset($this->request->post['gender']) || (utf8_strlen($this->request->post['gender']) < 1) || (utf8_strlen($this->request->post['gender']) > 33)) {
				$json['error'] = $this->language->get('error_gender');
			}

			if ((utf8_strlen($this->request->post['date_available']) < 3) || (utf8_strlen($this->request->post['date_available']) > 20)) {
				$json['error'] = $this->language->get('error_date_available');
			}

			if ((utf8_strlen($this->request->post['address']) < 3) || (utf8_strlen($this->request->post['address']) > 55)) {
				$json['error'] = $this->language->get('error_address');
			}

			if ((utf8_strlen($this->request->post['telephone']) < 9) || (utf8_strlen($this->request->post['telephone']) > 12)) {
				$json['error'] = $this->language->get('error_telephone');
			}

			if ((utf8_strlen($this->request->post['email']) < 1) || (utf8_strlen($this->request->post['email']) > 100)) {
				$json['error'] = $this->language->get('error_email');
			}


			if ((utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 100)) {
				$json['error'] = $this->language->get('error_name');
			}


			unset($this->session->data['captcha_comment']);


			if (!isset($json['error'])) {

				if($this->config->get('recruitsetting_comment_approve')){
				$json['success'] = $this->language->get('text_success_approve');
				}else{
				$json['success'] = $this->language->get('text_success');
				}

				if($this->config->get('recruitsetting_comment_notification')){
					$message = "Info CV" . "\n";
					$message .= "Tên: ".$this->request->post['name'] . "\n";
					$message .= "Email: ".$this->request->post['email'] . "\n";
					$message .= "Số ĐT: ".$this->request->post['telephone'] . "\n";
					$message .= "Địa chỉ: ".$this->request->post['address'] . "\n";
					$message .= "Giới tính: ".$this->request->post['gender'] . "\n";
					$message .= "Quốc tịch: ".$this->request->post['country'] . "\n";
					$message .= "Vị trí ứng tuyển: ".$this->request->post['vitri'] . "\n";
					$message .= "Thư: ".$this->request->post['comment'] . "\n";

					$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));

					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

					$mail->setTo($this->config->get('config_email'));
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
					$mail->setSubject('Ứng tuyển');

					if($this->request->post['cv']){
						$this->load->model('tool/upload');
						$upload_info = $this->model_tool_upload->getUploadByCode($this->request->post['cv']);
						$phyname = DIR_UPLOAD.$upload_info['filename'];
						$temp_name = DIR_UPLOAD.$upload_info['name'];
						copy($phyname,$temp_name);
						$mail->AddAttachment($temp_name);
					}


					$mail->setText($message);
					$mail->send();
					if(isset($temp_name)){
					 unlink( $temp_name );
					}
					if($this->request->post['cv']){
						if ($upload_info && is_file(DIR_UPLOAD . $upload_info['filename'])) {
							unlink(DIR_UPLOAD . $upload_info['filename']);
						}

						$this->model_tool_upload->deleteUpload($upload_info['upload_id']);
					}
				}

			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}


	public function captcha() {
		$num1=rand(2,6); //Generate First number between 1 and 9
		$num2=rand(2,6); //Generate Second number between 1 and 9
		$this->session->data['captcha_comment'] = $num1+$num2;
		$image = imagecreatetruecolor(58, 22);
		$width = imagesx($image);
		$height = imagesy($image);
		$black = imagecolorallocate($image, 50, 50, 50);
		$white = imagecolorallocate($image, 255, 255, 255);
		imagefilledrectangle($image, 0, 0, $width, $height, $white);
		imagestring($image, 4, 0, 3, "$num1"." + "."$num2"." =", $black);
		header('Content-type: image/png');
		imagepng($image);
		imagedestroy($image);
	}


}
