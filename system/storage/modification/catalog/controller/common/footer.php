<?php
class ControllerCommonFooter extends Controller {
	public function index() {

			// Add New Position For Footer
			$data['footertop'] 	= $this->load->controller('extension/soconfig/content_footertop');

			$data['footer_block1'] 	= $this->load->controller('extension/soconfig/footer_block1');
			$data['footer_block2'] 	= $this->load->controller('extension/soconfig/footer_block2');
			$data['footer_block3'] 	= $this->load->controller('extension/soconfig/footer_block3');
			$data['footer_block4'] 	= $this->load->controller('extension/soconfig/footer_block4');
			$data['footer_block5'] 	= $this->load->controller('extension/soconfig/footer_block5');
			$data['footer_block6'] 	= $this->load->controller('extension/soconfig/footer_block6');
			$data['footer_block7'] 	= $this->load->controller('extension/soconfig/footer_block7');
			$data['footer_block8'] 	= $this->load->controller('extension/soconfig/footer_block8');
			$data['footer_block9'] 	= $this->load->controller('extension/soconfig/footer_block9');
			$data['footer_block10'] = $this->load->controller('extension/soconfig/footer_block10');
			$data['footer_block11'] = $this->load->controller('extension/soconfig/footer_block11');
			$data['footer_block12'] = $this->load->controller('extension/soconfig/footer_block12');
			$data['footer_block13'] = $this->load->controller('extension/soconfig/footer_block13');
			$data['footer_block14'] = $this->load->controller('extension/soconfig/footer_block14');
			$data['footerbottom'] 	= $this->load->controller('extension/soconfig/content_footerbottom');
		

			// Add New Position For Footer
			$data['footertop'] 	= $this->load->controller('extension/soconfig/content_footertop');

			$data['footer_block1'] 	= $this->load->controller('extension/soconfig/footer_block1');
			$data['footer_block2'] 	= $this->load->controller('extension/soconfig/footer_block2');
			$data['footer_block3'] 	= $this->load->controller('extension/soconfig/footer_block3');
			$data['footer_block4'] 	= $this->load->controller('extension/soconfig/footer_block4');
			$data['footer_block5'] 	= $this->load->controller('extension/soconfig/footer_block5');
			$data['footer_block6'] 	= $this->load->controller('extension/soconfig/footer_block6');
			$data['footer_block7'] 	= $this->load->controller('extension/soconfig/footer_block7');
			$data['footer_block8'] 	= $this->load->controller('extension/soconfig/footer_block8');
			$data['footer_block9'] 	= $this->load->controller('extension/soconfig/footer_block9');
			$data['footer_block10'] = $this->load->controller('extension/soconfig/footer_block10');
			$data['footer_block11'] = $this->load->controller('extension/soconfig/footer_block11');
			$data['footer_block12'] = $this->load->controller('extension/soconfig/footer_block12');
			$data['footer_block13'] = $this->load->controller('extension/soconfig/footer_block13');
			$data['footer_block14'] = $this->load->controller('extension/soconfig/footer_block14');
			$data['footerbottom'] 	= $this->load->controller('extension/soconfig/content_footerbottom');
		
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

				/*
				**********************
				** Page Form Starts **
				**********************
				*/

				$this->load->model('page/form');
				$data['page_forms'] = array();
				foreach ($this->model_page_form->getPageForms() as $result) {
					if ($result['bottom']) {
						$data['page_forms'][] = array(
							'title' => $result['title'],
							'href'  => $this->url->link('page/form', 'page_form_id=' . $result['page_form_id'])
						);
					}
				}

				/*
				**********************
				*** Page Form Ends ***
				**********************
				*/
			

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

	
				/***theme's changes***/
				$data['theme'] = $this->config->get('theme_default_directory');
				$data['store_id'] = $this->config->get('config_store_id');
				$data['lang'] = $this->config->get('config_language_id');
				$data['registry'] = $this->registry;
				$store_id = $this->config->get('config_store_id');
				$lang = $this->config->get('config_language_id');
				$data['direction'] = $this->language->get('direction');
				
				/* Array Config  */
				$text_config = array(
					'backtop',
					'copyright',
					'socials_status',
					'imgpayment_status',
					'imgpayment',
					'footerpayment_status',
					'customblock_status',
					'social_fb_status',
					'social_twitter_status',
					'social_custom_status',
					'facebook',
					'twitter',
					'video_code',
					
					'footer_socials',
					'footerpayment',
					'customblock' ,
					'mutiColorTheme' ,
					'themecolor' ,
					'typefooter' 	,
				);
				
				/*You CAN NOT remove (or unreadable) those links without permission. Removing the link and template sponsor Please visit opencartworks.com or contact with e-mail (contact@ytcvn.com) If you don't want to link back to smartaddons.com, you can always pay a link removal donation. This will allow you to use the template link free on one domain name. Also, kindly send me the site's url so I can include it on my list of verified users. */
				$opencartworks = '';
				foreach ($text_config as $text ) {
					$data[$text] = $this->soconfig->get_settings($text);
					if($text=='copyright') $data[$text] = $data[$text].$opencartworks;
				}
				
				/***end theme's changes***/
		

				/***theme's changes***/
				$data['theme'] = $this->config->get('theme_default_directory');
				$data['store_id'] = $this->config->get('config_store_id');
				$data['lang'] = $this->config->get('config_language_id');
				$data['registry'] = $this->registry;
				$store_id = $this->config->get('config_store_id');
				$lang = $this->config->get('config_language_id');
				$data['direction'] = $this->language->get('direction');

				/* Array Config  */
				$text_config = array(
					'backtop',
					'copyright',
					'socials_status',
					'imgpayment_status',
					'imgpayment',
					'footerpayment_status',
					'customblock_status',
					'social_fb_status',
					'social_twitter_status',
					'social_custom_status',
					'facebook',
					'twitter',
					'video_code',

					'footer_socials',
					'footerpayment',
					'customblock' ,
					'mutiColorTheme' ,
					'themecolor' ,
					'typefooter' 	,
				);

				/*You CAN NOT remove (or unreadable) those links without permission. Removing the link and template sponsor Please visit opencartworks.com or contact with e-mail (contact@ytcvn.com) If you don't want to link back to smartaddons.com, you can always pay a link removal donation. This will allow you to use the template link free on one domain name. Also, kindly send me the site's url so I can include it on my list of verified users. */
				$opencartworks = '';
				foreach ($text_config as $text ) {
					$data[$text] = $this->soconfig->get_settings($text);
					if($text=='copyright') $data[$text] = $data[$text].$opencartworks;
				}

				/***end theme's changes***/
		

				// Menu Mobile
				$this->load->model('catalog/category');
				$this->load->model('catalog/product');
				$this->load->language('extension/soconfig/mobile');
				$data['objlang'] = $this->language;
				$data['categories'] = array();
				$data['mobile'] = $this->config->get('mobile_general');
				$data['text_account'] = $this->language->get('text_account');
				$data['text_register'] = $this->language->get('text_register');
				$data['text_login'] = $this->language->get('text_login');
				
				$categories = $this->model_catalog_category->getCategories(0);
				
				
				foreach ($categories as $category) {
					if ($category['top']) {
						// Level 2
						$children_data = array();

						$children = $this->model_catalog_category->getCategories($category['category_id']);

						foreach ($children as $child) {
							$filter_data = array(
								'filter_category_id'  => $child['category_id'],
								'filter_sub_category' => true
							);

							$children_data[] = array(
								'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
								'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
							);
						}

						// Level 1
						$data['categories'][] = array(
							'name'     => $category['name'],
							'children' => $children_data,
							'column'   => $category['column'] ? $category['column'] : 1,
							'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
						);
					}
				}

				$data['language'] = $this->load->controller('common/language');
				$data['currency'] = $this->load->controller('common/currency');
				$data['search'] = $this->load->controller('common/search');
				$data['cart'] = $this->load->controller('common/cart');
				$data['wishlist'] = $this->url->link('account/wishlist', '', true);
				$data['compare'] = $this->url->link('product/compare', '', 'SSL');
				$data['text_compare']  = sprintf($this->language->get('text_compare'),(isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
				$data['logged'] = $this->customer->isLogged();
				$data['account'] = $this->url->link('account/account', '', true);
				$data['register'] = $this->url->link('account/register', '', true);
				$data['login'] = $this->url->link('account/login', '', true);
				
			
			
		return $this->load->view('common/footer', $data);
	}
}
