<?php
class ControllerDieutriDieutri extends Controller {

	private $error = array();

	public function index() {
 
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

		$this->load->model('dieutri/dieutri_category');

		if (isset($this->request->get['dieutripath'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['dieutripath']);

			$dieutri_category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_dieutri_dieutri_category->getDieutriCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('dieutri/category', 'dieutripath=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_dieutri_dieutri_category->getDieutriCategory($dieutri_category_id);

			if ($category_info) {
				$url = '';

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('dieutri/category', 'dieutripath=' . $this->request->get['dieutripath'] . $url)
				);
			}
		}

		if (isset($this->request->get['dieutri_id'])) {
			$dieutri_id = $this->request->get['dieutri_id'];
		} else {
			$dieutri_id = 0;
		}

		$dieutri_info = $this->model_dieutri_dieutri->getDieutri($dieutri_id);

		if ($dieutri_info) {
			$url = '';
			$data['theme'] = $this->config->get('theme_default_directory');
			if (isset($this->request->get['dieutripath'])) {
				$url .= '&dieutripath=' . $this->request->get['dieutripath'];
			}

			$data['breadcrumbs'][] = array(
			'text'      => $dieutri_info['title'],
			'href' => $this->url->link('dieutri/dieutri', $url . '&dieutri_id=' . $this->request->get['dieutri_id'])
			);

			$data['new_read_counter_value'] = $dieutri_info['count_read']+1;
			$this->model_dieutri_dieutri->updateDieutriReadCounter($this->request->get['dieutri_id'], $data['new_read_counter_value']);
			$data['comment_total'] = $this->model_dieutri_dieutri->getTotalCommentsByDieutriId($this->request->get['dieutri_id']);

			if (isset($this->request->get['dieutri_id'])) {

			$data['post_date_added_status'] = $this->config->get('dieutrisetting_post_date_added');
			$data['post_comments_count_status'] = $this->config->get('dieutrisetting_post_comments_count');
			$data['post_page_view_status'] = $this->config->get('dieutrisetting_post_page_view');
			$data['post_author_status'] = $this->config->get('dieutrisetting_post_author');
			$data['share_status'] = $this->config->get('dieutrisetting_share');
			$data['main_thumb'] = $this->config->get('dieutrisetting_post_thumb');

			// Related posts
			$data['date_added_status'] = $this->config->get('dieutrisetting_date_added');
			$data['comments_count_status'] = $this->config->get('dieutrisetting_comments_count');
			$data['page_view_status'] = $this->config->get('dieutrisetting_page_view');
			$data['author_status'] = $this->config->get('dieutrisetting_author');
			$data['rel_thumb_status'] = $this->config->get('dieutrisetting_rel_thumb');
			$data['rel_per_row'] = $this->config->get('dieutrisetting_rel_dieutri_per_row');

			$data['image_before'] = $this->model_tool_image->resize($dieutri_info['image_before'], 800,700);
			$data['image_after'] = $this->model_tool_image->resize($dieutri_info['image_after'], 800,700);

			$data['related_dieutris'] = array();

			$related_dieutris = $this->model_dieutri_dieutri->getRelatedDieutri($this->request->get['dieutri_id']);

			foreach ($related_dieutris as $result) {
      			$data['related_dieutris'][] = array(
        		'title' => $result['title'],
				'count_read' => $result['count_read'],
				'short_description' => utf8_substr(strip_tags(html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('dieutrisetting_rel_characters')) . '..',
				'author' => $result['author'],
				'comment_total' => $this->model_dieutri_dieutri->getTotalCommentsByDieutriId($result['dieutri_id']),
        		'date_added_full' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_added' => $result['date_added'],
        		'image' => $this->model_tool_image->resize($result['image'], $this->config->get('dieutrisetting_rel_thumbs_w'), $this->config->get('dieutrisetting_rel_thumbs_h')),
	    		'href'  => $this->url->link('dieutri/dieutri', 'dieutri_id=' . $result['dieutri_id'])
      			);
    		  }

			$data['products'] = array();

			$related_products = $this->model_dieutri_dieutri->getRelatedProduct($this->request->get['dieutri_id']);
			$this->load->model('catalog/product');

					foreach ($related_products as $product) {
						$result = $this->model_catalog_product->getProduct($product['product_id']);
						if ($result) {

						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
						}

						if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
							$price = false;
						}

						if ((float)$result['special']) {
							$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
							$special = false;
						}

						if ($this->config->get('config_tax')) {
							$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
						} else {
							$tax = false;
						}

						if ($this->config->get('config_review_status')) {
							$rating = (int)$result['rating'];
						} else {
							$rating = false;
						}

						$data['products'][] = array(
							'product_id'  => $result['product_id'],
							'thumb'       => $image,
							'name'        => $result['name'],
							'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
							'price'       => $price,
							'special'     => $special,
							'tax'         => $tax,
							'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
							'rating'      => $rating,
							'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
						);
						}
    		  }

    	}


			if ($dieutri_info['page_title']) {
			$this->document->setTitle($dieutri_info['page_title']);
			} else {
			$this->document->setTitle($dieutri_info['title']);
			}

			$this->document->setDescription($dieutri_info['meta_description']);
			$this->document->setKeywords($dieutri_info['meta_keyword']);

			$this->document->addLink($this->url->link('dieutri/dieutri', 'dieutri_id=' . $this->request->get['dieutri_id']), 'canonical');

      		$data['heading_title'] = $dieutri_info['title'];

			$data['description'] = html_entity_decode($dieutri_info['description'], ENT_QUOTES, 'UTF-8');
			$data['short_description'] = html_entity_decode($dieutri_info['short_description'], ENT_QUOTES, 'UTF-8');
			$data['faq'] = html_entity_decode($dieutri_info['faq'], ENT_QUOTES, 'UTF-8');

			$data['dieutrisetting_post_thumb'] = $this->model_tool_image->resize($dieutri_info['image'], $this->config->get('dieutrisetting_post_thumbs_w'), $this->config->get('dieutrisetting_post_thumbs_h'));

			$data['tags'] = array();

			if ($dieutri_info['tags']) {
				$tags = explode(',', $dieutri_info['tags']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('dieutri/home', 'tag=' . trim($tag))
					);
				}
			}

			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_posted_on'] = $this->language->get('text_posted_on');
			$data['text_posted_by'] = $this->language->get('text_posted_by');
			$data['text_read'] = $this->language->get('text_read');
			$data['text_share_this'] = $this->language->get('text_share_this');
			$data['text_description'] = $this->language->get('text_description');
			$data['text_short_description'] = $this->language->get('text_short_description');
			$data['text_before_after'] = $this->language->get('text_before_after');
			$data['text_product_related'] = $this->language->get('text_product_related');
			$data['text_faq'] = $this->language->get('text_faq');

      		$data['text_related_dieutri'] = $this->language->get('text_related_dieutri');
      		$data['text_read_more'] = $this->language->get('text_read_more');

      		$data['text_write_comment'] = $this->language->get('text_write_comment');

      		$data['entry_name'] = $this->language->get('entry_name');
      		$data['entry_email'] = $this->language->get('entry_email');
			$data['entry_comment'] = $this->language->get('entry_comment');
      		$data['text_comments'] = $this->language->get('text_comments');
			$data['text_write_comment'] = $this->language->get('text_write_comment');

      		$data['entry_captcha'] = $this->language->get('entry_captcha');
      		$data['button_send'] = $this->language->get('button_send');

			$data['post_date_added_status'] = $this->config->get('dieutrisetting_post_date_added');
			$data['post_comments_count_status'] = $this->config->get('dieutrisetting_post_comments_count');
			$data['post_page_view_status'] = $this->config->get('dieutrisetting_post_page_view');
			$data['post_author_status'] = $this->config->get('dieutrisetting_post_author');

			$data['date_added_full'] = date($this->language->get('date_format_short'), strtotime($dieutri_info['date_added']));
			$data['date_added'] = $dieutri_info['date_added'];

			$data['author'] = $dieutri_info['author'];

			$data['allow_comment'] = $dieutri_info['allow_comment'];

			$data['continue'] = $this->url->link('common/home');

			$data['dieutri_id'] = (int)$this->request->get['dieutri_id'];


	  		$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('dieutri/dieutri', $data));

    	} else {

			$url = '';

      		$data['breadcrumbs'] [] = array(
        		'href'      => $this->url->link('dieutri/dieutri', $url . '&dieutri_id=' . $this->request->get['dieutri_id']),
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

		$this->load->language('dieutri/dieutri');

		$this->load->model('dieutri/dieutri');

		$data['text_comments'] = $this->language->get('text_comments');

		$data['text_no_comment'] = $this->language->get('text_no_comment');

		if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}

		$data['comments'] = array();

		$comment_total = $this->model_dieutri_dieutri->getTotalCommentsByDieutriId($this->request->get['dieutri_id']);

		$limit = $this->config->get('dieutrisetting_comment_per_page');

		$results = $this->model_dieutri_dieutri->getCommentsByDieutriId($this->request->get['dieutri_id'], ($page - 1) * $limit, $limit);

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
			$pagination->limit = $this->config->get('dieutrisetting_comment_per_page');
			$pagination->url = $this->url->link('dieutri/dieutri/comment', 'dieutri_id=' . $this->request->get['dieutri_id'] . '&page={page}');

			$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($comment_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($comment_total - $limit)) ? $comment_total : ((($page - 1) * $limit) + $limit), $comment_total, ceil($comment_total / $limit));


		$this->response->setOutput($this->load->view('dieutri/comment', $data));

}




		public function write() {
		$this->load->language('dieutri/dieutri');

		$data['entry_comment'] = $this->language->get('entry_comment');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if ((utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 100)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['email']) < 1) || (utf8_strlen($this->request->post['email']) > 100)) {
				$json['error'] = $this->language->get('error_email');
			}

			if ((utf8_strlen($this->request->post['comment']) < 5) || (utf8_strlen($this->request->post['comment']) > 3000)) {
				$json['error'] = $this->language->get('error_comment');
			}


			if (empty($this->session->data['captcha_comment']) || ($this->session->data['captcha_comment'] != $this->request->post['captcha_comment'])) {
				$json['error'] = $this->language->get('error_captcha');
			}

			unset($this->session->data['captcha_comment']);


			if (!isset($json['error'])) {
				$this->load->model('dieutri/dieutri');

				$this->model_dieutri_dieutri->addComment($this->request->get['dieutri_id'], $this->request->post);

				if($this->config->get('dieutrisetting_comment_approve')){
				$json['success'] = $this->language->get('text_success_approve');
				}else{
				$json['success'] = $this->language->get('text_success');
				}

				if($this->config->get('dieutrisetting_comment_notification')){
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_host');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

				$mail->setTo($this->config->get('config_email'));
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->request->post['name']);
				$mail->setSubject(sprintf($this->language->get('email_notification'), $this->request->post['name']));
				$mail->setText(strip_tags($this->request->post['comment']));
				$mail->send();
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
