<?php
class ControllerCommonHeader extends Controller {
	public function index() {

      $this->load->model('tool/seo_package');
      $this->model_tool_seo_package->metaRobots();
      $this->model_tool_seo_package->checkCanonical();
      $this->model_tool_seo_package->hrefLang();
      $this->model_tool_seo_package->richSnippets();
      
      if (version_compare(VERSION, '2', '>=')) {
        $data['mlseo_meta'] = $this->document->renderSeoMeta();
      } else {
        $this->data['mlseo_meta'] = $this->document->renderSeoMeta();
      }
      
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

 $this->document->addStyle('catalog/view/javascript/so_sociallogin/css/so_sociallogin.css');
 $this->load->model('setting/setting');
 $this->load->model('tool/image');
 $setting = $this->model_setting_setting->getSetting('so_sociallogin');
 
 if ($setting) {
 if(isset($this->session->data['route']))
 {
 $location = $this->url->link($this->session->data['route'], "", 'SSL');
 }
 else
 {
 $location = $this->url->link("account/account", "", 'SSL');
 }
 
 /* Facebook Library */
 require_once(DIR_SYSTEM . 'library/so_social/fb/facebook.php');
 
 /* Facebook Login link code */
 $fbconnect = new Facebook(array(
 'appId' => $setting['so_sociallogin_fbapikey'],
 'secret' => $setting['so_sociallogin_fbsecretapi'],
 ));
 
 $data['fblink'] = $fbconnect->getLoginUrl(
 array(
 'scope' => 'email,user_birthday,user_location,user_hometown',
 'redirect_uri' => $this->url->link('extension/module/so_sociallogin/FacebookLogin', '', 'SSL')
 )
 );
 /* Facebook Login link code */
 
 /* Google Libery file inculde */
 require_once DIR_SYSTEM.'library/so_social/src/Google_Client.php';
 require_once DIR_SYSTEM.'library/so_social/src/contrib/Google_Oauth2Service.php';
 
 /* Google Login link code */
 $gClient = new Google_Client();
 $gClient->setApplicationName($setting['so_sociallogin_googletitle']);
 $gClient->setClientId($setting['so_sociallogin_googleapikey']);
 $gClient->setClientSecret($setting['so_sociallogin_googlesecretapi']);
 $gClient->setRedirectUri($this->url->link('extension/module/so_sociallogin/GoogleLogin', '', 'SSL'));
 $google_oauthV2 = new Google_Oauth2Service($gClient);
 $data['googlelink'] = $gClient->createAuthUrl();
 
 /* Twitter Login */ 
 $data['twitlink'] = $this->url->link('extension/module/so_sociallogin/TwitterLogin', '', 'SSL');
 
 /* Linkedin Login */
 $data['linkdinlink'] = $this->url->link('extension/module/so_sociallogin/LinkedinLogin', '', 'SSL');
 
 /* Get Image */
 $sociallogin_width = 130;
 $sociallogin_height = 35;
 if (isset($setting['so_sociallogin_width']) && is_numeric($setting['so_sociallogin_width'])) {
 $sociallogin_width = $setting['so_sociallogin_width'];
 }
 if (isset($setting['so_sociallogin_height']) && is_numeric($setting['so_sociallogin_height'])) {
 $sociallogin_height = $setting['so_sociallogin_height'];
 }
 if ($setting['so_sociallogin_fbimage']) {
 $fbicon = $this->model_tool_image->resize($setting['so_sociallogin_fbimage'], $sociallogin_width, $sociallogin_height);
 } else {
 $fbicon = $this->model_tool_image->resize('placeholder.png', $sociallogin_width, $sociallogin_height);
 }
 
 if ($setting['so_sociallogin_twitimage']) {
 $twiticon = $this->model_tool_image->resize($setting['so_sociallogin_twitimage'], $sociallogin_width, $sociallogin_height);
 } else {
 $twiticon = $this->model_tool_image->resize('placeholder.png', $sociallogin_width, $sociallogin_height);
 }
 
 if ($setting['so_sociallogin_googleimage']) {
 $googleicon = $this->model_tool_image->resize($setting['so_sociallogin_googleimage'], $sociallogin_width, $sociallogin_height);
 } else {
 $googleicon = $this->model_tool_image->resize('placeholder.png', $sociallogin_width, $sociallogin_height);
 }
 
 if ($setting['so_sociallogin_linkdinimage']) {
 $linkdinicon = $this->model_tool_image->resize($setting['so_sociallogin_linkdinimage'], $sociallogin_width, $sociallogin_height);
 } else {
 $linkdinicon = $this->model_tool_image->resize('placeholder.png', $sociallogin_width, $sociallogin_height);
 }
 
 $data['iconwidth'] = $sociallogin_width;
 $data['iconheight'] = $sociallogin_height;
 $data['status'] = $setting['so_sociallogin_status'];
 $data['fbimage'] = $fbicon;
 $data['twitimage'] = $twiticon;
 $data['googleimage'] = $googleicon;
 $data['linkdinimage'] = $linkdinicon;
 
 $data['setting'] = $setting;
 
 $this->load->language('extension/module/so_sociallogin');
 $data['text_colregister'] = $this->language->get('text_colregister');
 $data['text_create_account'] = $this->language->get('text_create_account');
 $data['text_forgot_password'] = $this->language->get('text_forgot_password');
 $data['text_title_popuplogin'] = $this->language->get('text_title_popuplogin');
 $data['text_title_login_with_social'] = $this->language->get('text_title_login_with_social');
 }
 

				// Add Source CSS & JS For Header
				$this->document->addStyle('catalog/view/javascript/so_searchpro/css/so_searchpro.css');

				$this->document->addStyle('catalog/view/javascript/so_megamenu/so_megamenu.css');
				$this->document->addStyle('catalog/view/javascript/so_megamenu/wide-grid.css');
				$this->document->addScript('catalog/view/javascript/so_megamenu/so_megamenu.js');
			

				// Add Source CSS & JS For Header
				$this->document->addStyle('catalog/view/javascript/so_searchpro/css/so_searchpro.css'); 
				
				$this->document->addStyle('catalog/view/javascript/so_megamenu/so_megamenu.css');
				$this->document->addStyle('catalog/view/javascript/so_megamenu/wide-grid.css');
				$this->document->addScript('catalog/view/javascript/so_megamenu/so_megamenu.js'); 
			

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}


			// Add New Position For Header
			$data['content_search'] 	= $this->load->controller('extension/soconfig/content_search');
			$data['content_menu'] 	= $this->load->controller('extension/soconfig/content_menu');
			$data['content_menu1'] 	= $this->load->controller('extension/soconfig/content_menu1');
			$data['content_topbar'] 	= $this->load->controller('extension/soconfig/content_topbar');
			$data['text_items'] 	      = $this->language->get('text_items');
			$data['text_shop'] 	          = $this->language->get('text_shop');
			$data['text_shop_cart'] 	  = $this->language->get('text_shop_cart');
			$data['compare'] = $this->url->link('product/compare', '', 'SSL');
			$data['text_compare']  = sprintf($this->language->get('text_compare'),(isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		

			// Add New Position For Header
			$this->load->language('extension/soconfig/soconfig');
			$data['text_contact'] = $this->language->get('text_contact');
			$data['text_more'] 	  = $this->language->get('text_more');
			$data['text_menu'] 	  = $this->language->get('text_menu');
			$data['text_hotline'] 	  = $this->language->get('text_hotline');
			$data['text_compare'] 	  = $this->language->get('text_compare');
		

			// Add New Position For Header
			$data['content_search'] 	= $this->load->controller('extension/soconfig/content_search');
			$data['content_menu'] 	= $this->load->controller('extension/soconfig/content_menu');
			$data['content_menu1'] 	= $this->load->controller('extension/soconfig/content_menu1');
			$data['content_topbar'] 	= $this->load->controller('extension/soconfig/content_topbar');
			$data['header_block1'] 	= $this->load->controller('extension/soconfig/header_block1');
			$data['header_block2'] 	= $this->load->controller('extension/soconfig/header_block2');
			$data['text_items'] 	      = $this->language->get('text_items');
			$data['text_shop'] 	          = $this->language->get('text_shop');
			$data['text_shop_cart'] 	  = $this->language->get('text_shop_cart');
			$data['compare'] = $this->url->link('product/compare', '', 'SSL');
			$data['text_compare']  = sprintf($this->language->get('text_compare'),(isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		

			// Add New Position For Header
			$this->load->language('extension/soconfig/soconfig');
			$data['text_contact'] = $this->language->get('text_contact');
			$data['text_more'] 	  = $this->language->get('text_more');
			$data['text_menu'] 	  = $this->language->get('text_menu');
			$data['text_hotline'] 	  = $this->language->get('text_hotline');
			$data['text_compare'] 	  = $this->language->get('text_compare');
		
		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {

			/***theme's changes***/
			$data['theme'] = $this->config->get('theme_default_directory');
			$data['store_id'] = $this->config->get('config_store_id');
			$data['lang'] = $this->config->get('config_language_id');

			$store_id = $this->config->get('config_store_id');
			$lang = $this->config->get('config_language_id');
			$data['registry'] = $this->registry;

			/* Array Config  */
			$text_config = array(
				'preloader',
				'preloader_animation',
				'mutiColorTheme' ,
				'themecolor' ,
				'layouts',
				'typelayout',
				'type_banner',
				'scroll_animation',
				'toppanel_status' 	,
				'toppanel_type' 	,
				'phone_status' 		,
				'welcome_message_status' ,
				'wishlist_status' 	,
				'checkout_status' 	,
				'lang_status' 		,
				'socials_status' 	,
				'contact_number' 	,
				'welcome_message' 	,

				'typeheader' 		,
				'layoutstyle' 		,
				'general_bgcolor' 	,
				'pattern' 			,
				'contentbg',
				'content_bg_mode' 	,
				'content_attachment',

				'body_status' 		,
				'normal_body' 		,
				'url_body' 			,
				'family_body' 		,
				'selector_body' 	,
				'menu_status' 		,
				'normal_menu' 		,
				'url_menu' 			,
				'family_menu' 		,
				'selector_menu'		,
				'heading_status' 	,
				'normal_heading' 	,
				'url_heading' 		,
				'family_heading'  	,
				'selector_heading'	,

				'cssinput_status'	,
				'jsinput_status'	,
				'custom_css' 		,
				'custom_js' 		,
				'cssfile_status'	,
				'jsfile_status' 	,
				'cssfile' 	,
				'jsfile' 	,
			);

			foreach ($text_config as $text ) {
				$data[$text] = $this->soconfig->get_settings($text);
			}

			/***end theme's changes***/
		

			/***theme's changes***/
			$data['theme'] = $this->config->get('theme_default_directory');
			$data['store_id'] = $this->config->get('config_store_id');
			$data['lang'] = $this->config->get('config_language_id');

			$store_id = $this->config->get('config_store_id');
			$lang = $this->config->get('config_language_id');
			$data['registry'] = $this->registry;
					
			/* Array Config  */
			$text_config = array(
				'preloader',
				'preloader_animation',
				'mutiColorTheme' ,
				'themecolor' ,
				'layouts',
				'typelayout',
				'type_banner',
				'scroll_animation',
				'toppanel_status' 	,
				'toppanel_type' 	,
				'phone_status' 		,
				'welcome_message_status' ,
				'wishlist_status' 	,
				'checkout_status' 	,
				'lang_status' 		,
				'socials_status' 	,
				'contact_number' 	,
				'welcome_message' 	,
				
				'typeheader' 		,
				'layoutstyle' 		,
				'general_bgcolor' 	,
				'pattern' 			,
				'contentbg',
				'content_bg_mode' 	,
				'content_attachment',
				
				'body_status' 		,
				'normal_body' 		,
				'url_body' 			,
				'family_body' 		,
				'selector_body' 	,
				'menu_status' 		,
				'normal_menu' 		,
				'url_menu' 			,
				'family_menu' 		,
				'selector_menu'		,
				'heading_status' 	,
				'normal_heading' 	,
				'url_heading' 		,
				'family_heading'  	,
				'selector_heading'	,
				
				'cssinput_status'	,
				'jsinput_status'	,
				'custom_css' 		,
				'custom_js' 		,
				'cssfile_status'	,
				'jsfile_status' 	,
				'cssfile' 	,
				'jsfile' 	,
			);
			
			foreach ($text_config as $text ) {
				$data[$text] = $this->soconfig->get_settings($text);
			}
			
			/***end theme's changes***/
		
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
										
				'filter_sub_category' => true,
				'mfp_disabled' => true
			
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


				$this->load->language('extension/soconfig/mobile');
				$data['objlang'] = $this->language;
				$data['menu_search'] = $this->url->link('product/search', '', true);
				$data['mobile'] = $this->config->get('mobile_general');
				$data['text_items'] = sprintf($this->language->get('text_itemcount'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0));
				if($this->session->data['device']=='mobile'){
					$data['home'] = $this->url->link('mobile/home');
				}else{
					$data['home'] = $this->url->link('common/home');
				}
				if(isset($this->request->get['layoutmobile'])) $data['layoutmobile'] = $this->request->get['layoutmobile'];
		
		$data['language'] = $this->load->controller('common/language');

		/*
		**********************
		** Page Form Starts **
		**********************
		*/

		$this->load->model('page/form');
		$data['page_forms'] = array();
		foreach ($this->model_page_form->getPageForms() as $result) {
			if ($result['top']) {
				// Level 1
				$data['categories'][] = array(
					'name'     => $result['title'],
					'children' => array(),
					'column'   => 1,
					'href'     => $this->url->link('page/form', 'page_form_id=' . $result['page_form_id'])
				);
			}
		}

		/*
		**********************
		*** Page Form Ends ***
		**********************
		*/
			
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
