<?php
class ControllerProductCategory extends Controller {
	public function index() {

				// path manager - preserve bc
				if (isset($this->request->get['path']) && $this->config->get('mlseo_fpp_directcat')) {
					$cat_id = strrchr('_'.$this->request->get['path'], '_');
					$cat_id = str_replace('_', '', $cat_id);
          $this->load->model('tool/path_manager');
          $this->request->get['path'] = $this->model_tool_path_manager->getFullCategoryPath($cat_id);
				}
			
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}


			$this->load->language('extension/soconfig/soconfig');
			$data['text_stock'] 	= $this->language->get('text_stock');
			$data['text_price_old'] = $this->language->get('text_price_old');
			$data['text_price_save'] = $this->language->get('text_price_save');
			$data['text_price_sale'] = $this->language->get('text_price_sale');
			$data['text_viewdeals']  = $this->language->get('text_viewdeals');
			$data['direction'] = $this->language->get('direction');
			
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['path'])) {
			$url = '';

				if( ! empty( $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')] ) ) {
					$url .= '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' . $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')];
				}
			

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

				if( isset( $this->request->get['mfp_path'] ) ) {
					$parts = explode('_', (string)$this->request->get['mfp_path']);
				}
			

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			$this->document->setTitle(!empty($category_info['meta_title']) && $this->config->get('mlseo_enabled') ? $category_info['meta_title'] : $category_info['name']);
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);

			$data['heading_title'] = !empty($category_info['seo_h1']) && $this->config->get('mlseo_enabled') ? $category_info['seo_h1'] : $category_info['name'];
      if (version_compare(VERSION, '2', '>=')) {
        $data['seo_h1'] = !empty($category_info['seo_h1']) ? $category_info['seo_h1'] : '';
        $data['seo_h2'] = !empty($category_info['seo_h2']) ? $category_info['seo_h2'] : '';
        $data['seo_h3'] = !empty($category_info['seo_h3']) ? $category_info['seo_h3'] : '';
      } else {
        $this->data['seo_h1'] = !empty($category_info['seo_h1']) ? $category_info['seo_h1'] : '';
        $this->data['seo_h2'] = !empty($category_info['seo_h2']) ? $category_info['seo_h2'] : '';
        $this->data['seo_h3'] = !empty($category_info['seo_h3']) ? $category_info['seo_h3'] : '';
      }
      
      if ($this->config->get('mlseo_enabled')) {
        $this->load->model('tool/seo_package');
        
        if ($this->config->get('mlseo_microdata')) {
          if (version_compare(VERSION, '2', '>=')) {
            $this->document->addSeoMeta($this->model_tool_seo_package->rich_snippet('microdata', 'category', $data));
          } else {
            $this->document->addSeoMeta($this->model_tool_seo_package->rich_snippet('microdata', 'category', $this->data));
          }
        }
      }
      
      if ($this->config->get('mlseo_header_lm_category')) {
        $gkd_header_lm_date = strtotime($category_info['date_modified']);
        
        $this->response->addHeader('Last-Modified: '.date('D, d M Y H:i:s', $gkd_header_lm_date).' GMT');
      }
      


                /***theme's changes***/
                $data['store_id'] = $this->config->get('config_store_id');
                $data['lang'] = $this->config->get('config_language_id');
				$data['theme'] = $this->config->get('theme_default_directory');
				$data['registry'] = $this->registry;
				$data['our_url'] = $this->registry->get('url');
                $lang = $this->config->get('config_language_id');
                $store_id = $this->config->get('config_store_id');
                $data['category'] = $this->model_catalog_category->getCategory($category_id);

				$this->load->model('catalog/category');
				$this->load->model('soconfig/general');

                $soconfig_general 		= $this->config->get('soconfig_general_store');
                $soconfig_pages 		= $this->config->get('soconfig_pages_store');
                $soconfig_lang 			= $this->config->get('soconfig_lang_store');

                /* PAGE PRODUCT */
				$text_config = array(
					'product_catalog_refine',
					'product_catalog_refine_col_lg',
					'product_catalog_refine_col_md',
					'product_catalog_refine_col_sm',
					'product_catalog_refine_col_xs',
					'deals_today',
					'lsttitle_cate_status',
					'lstimg_cate_status',
					'product_catalog_mode',
					'product_catalog_column_lg',
					'product_catalog_column_md',
					'product_catalog_column_sm',
					'product_catalog_column_xs',
					'secondimg',
					'rating_status',
					'lstdescription_status',
					'sale_status',
					'new_status',
					'days',
					'quick_status',
					'discount_status',
					'countdown_status',
					'sale_text',
					'new_text',
					'quick_view_text',
					'scroll_animation',

				);
				foreach ($text_config as $text ) {
					$data[$text] = $this->soconfig->get_settings($text);
				}

				//Language Variables
				$this->load->language('extension/soconfig/soconfig');
				$data['objlang'] = $this->language;

				$data['lang_todaysdeal'] = $this->language->get('lang_todaysdeal');
				$data["view_details"]  	= $this->language->get('view_details');
				$data['countdown_title_day'] 	= $this->language->get('countdown_title_day');
				$data['countdown_title_hour'] 	= $this->language->get('countdown_title_hour');
				$data['countdown_title_minute'] = $this->language->get('countdown_title_minute');
				$data['countdown_title_second'] = $this->language->get('countdown_title_second');
				$data['text_sidebar'] = $this->language->get('text_sidebar');
                /***end theme's changes***/

                    
			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');
			$data['text_read_more'] = $this->language->get('text_read_more');
			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);

			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');

          $data['description'] = $this->shortcodes->do_shortcode($data['description']);
         
			$data['compare'] = $this->url->link('product/compare');

			$url = '';

				if( ! empty( $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')] ) ) {
					$url .= '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' . $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')];
				}
			

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


				$fmSettings = $this->config->get('mega_filter_settings');
				
				if( isset( $this->request->get['mfp_path'] ) && false !== ( $mfpPos = strpos( $url, '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' ) ) ) {
					$mfSt = mb_strpos( $url, '&', $mfpPos+1, 'utf-8');
					$mfp = $mfSt === false ? $url : mb_substr( $url, $mfpPos, $mfSt-1, 'utf-8' );
					$url = $mfSt === false ? '' : mb_substr($url, $mfSt, mb_strlen( $url, 'utf-8' ), 'utf-8');				
					$mfp = preg_replace( '#path(\[[^\]]+\],?|,[^/]+/?)#', '', urldecode( $mfp ) );
					$mfp = preg_replace( '#&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=&|&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=#', '', $mfp );
					
					if( $mfp ) {
						$url .= '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' . urlencode( $mfp );
					}
				}
				
				if( ! empty( $fmSettings['not_remember_filter_for_subcategories'] ) && false !== ( $mfpPos = strpos( $url, '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' ) ) ) {
					$mfUrlBeforeChange = $url;
					$mfSt = mb_strpos( $url, '&', $mfpPos+1, 'utf-8');
					$url = $mfSt === false ? '' : mb_substr($url, $mfSt, mb_strlen( $url, 'utf-8' ), 'utf-8');
				} else if( empty( $fmSettings['not_remember_filter_for_subcategories'] ) && false !== ( $mfpPos = strpos( $url, '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' ) ) ) {
					$mfUrlBeforeChange = $url;
					$url = preg_replace( '/,?path\[[0-9_]+\]/', '', $url );
				}
			
			$data['categories'] = array();

				$data['category_id'] = $this->request->get['path'];
			

			$results = $this->model_catalog_category->getCategories($category_id);

			foreach ($results as $result) {
				$filter_data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);


		    if ($result['image']) {
		     $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
		    } else {
		     $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
		    }
		   
				$data['categories'][] = array(

			'thumb'       => $image,
			  
					'name' => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
				);
			}


				if( isset( $mfUrlBeforeChange ) ) {
					$url = $mfUrlBeforeChange;
					unset( $mfUrlBeforeChange );
				}
			
			$data['products'] = array();

			$filter_data = array(
				'filter_category_id' => $category_id,
				'filter_filter'      => $filter,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);


				$fmSettings = $this->config->get('mega_filter_settings');
		
				if( ! empty( $fmSettings['show_products_from_subcategories'] ) ) {
					if( ! empty( $fmSettings['level_products_from_subcategories'] ) ) {
						$fmLevel = (int) $fmSettings['level_products_from_subcategories'];
						$fmPath = explode( '_', empty( $this->request->get['path'] ) ? '' : $this->request->get['path'] );

						if( $fmPath && count( $fmPath ) >= $fmLevel ) {
							$filter_data['filter_sub_category'] = '1';
						}
					} else {
						$filter_data['filter_sub_category'] = '1';
					}
				}
				
				if( ! empty( $this->request->get['manufacturer_id'] ) ) {
					$filter_data['filter_manufacturer_id'] = (int) $this->request->get['manufacturer_id'];
				}
			

				$filter_data['mfp_overwrite_path'] = true;
			
			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
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


				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$price_sale = $this->currency->format($this->tax->calculate($result['price']- $result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
					$price_sale = false;
				}

				$images = $this->model_catalog_product->getProductImages($result['product_id']);
				if(isset($images[0]['image']) && !empty($images[0]['image'])){
					$images =$images[0]['image'];
					} else {
					$images = false;
				}

				if ((float)$result['special']) {
                    $discount = '-'.round((($result['price'] - $result['special'])/$result['price'])*100, 0).'%';
                } else {
                    $discount = false;
                }

				if ($result['quantity'] <= 0) {
					$stock = $result['stock_status'];
				} elseif ($this->config->get('config_stock_display')) {
					$stock = $result['quantity'];
				} else {
					$stock = $this->language->get('text_instock');
				}


			   
				$data['products'][] = array(
					'product_id'  => $result['product_id'],

        'image_title' => isset($result['image_title']) ? $result['image_title'] : '',
        'image_alt' => isset($result['image_alt']) ? $result['image_alt'] : '',
        
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,

				'image_deal'      => $this->model_tool_image->resize($result['image'],240 ,240 ),
				'thumb2' 			=> $this->model_tool_image->resize($images, $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height')),
				'manufacturer'      => $result['manufacturer'],
				'manufacturers'     => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']),
				'model'      		=> $result['model'],
				'stock'      		=> $stock,
				'special_end_date'  => $this->model_soconfig_general->getDateEnd($result['product_id']),
				'price_sale'     	=> $price_sale,
				'date_available'  => $result['date_available'],
				'discount'  => $discount,
			   
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
				);
			}

			$url = '';

				if( ! empty( $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')] ) ) {
					$url .= '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' . $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')];
				}
			

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);

			$url = '';

				if( ! empty( $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')] ) ) {
					$url .= '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' . $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')];
				}
			

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';

				if( ! empty( $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')] ) ) {
					$url .= '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' . $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')];
				}
			

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


         $x = count($data['products']);
         if ($x) {
            $sc_products = array();
            for ($i=0; $i < $x; $i++) {
               $sc_products[$i] = $data['products'][$i];
               $sc_products[$i]['description'] = $this->shortcodes->do_shortcode($data['products'][$i]['description']);
            }
            $data['products'] = $sc_products;
         }
         
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html

      if ($page > 1) {
        $this->load->model('tool/path_manager'); $this->document->addLink($this->url->link('product/category', 'path=' . ($this->config->get('mlseo_fpp_cat_canonical') ? $this->model_tool_path_manager->getFullCategoryPath($category_info['category_id']) : $category_info['category_id']) . '&page='. $page, true), 'canonical');
      }
      
			if ($page == 1) {
			    $this->load->model('tool/path_manager'); $this->document->addLink($this->url->link('product/category', 'path=' . ($this->config->get('mlseo_fpp_cat_canonical') ? $this->model_tool_path_manager->getFullCategoryPath($category_info['category_id']) : $category_info['category_id']), true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . ($this->config->get('mlseo_enabled') && $this->config->get('mlseo_pagination_fix') ? $this->request->get['path'] : $category_info['category_id']), true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('product/category', 'path=' . ($this->config->get('mlseo_enabled') && $this->config->get('mlseo_pagination_fix') ? $this->request->get['path'] : $category_info['category_id']) . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . ($this->config->get('mlseo_enabled') && $this->config->get('mlseo_pagination_fix') ? $this->request->get['path'] : $category_info['category_id']) . '&page='. ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');

				if( class_exists( 'Mfilter_Helper' ) ) {
					Mfilter_Helper::createMetaLinks( $this, isset( $page ) ? $page : null, isset( $limit ) ? $limit : null, isset( $product_total ) ? $product_total : null );
				}
			
			$data['header'] = $this->load->controller('common/header');


				$this->load->model( 'module/mega_filter' );
				
				$data = $this->model_module_mega_filter->prepareData( $data );
			
			$this->response->setOutput($this->load->view('product/category', $data));
		} else {
			$url = '';

				if( ! empty( $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')] ) ) {
					$url .= '&'.($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp').'=' . $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')];
				}
			

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/category', $url)
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

				if( class_exists( 'Mfilter_Helper' ) ) {
					Mfilter_Helper::createMetaLinks( $this, isset( $page ) ? $page : null, isset( $limit ) ? $limit : null, isset( $product_total ) ? $product_total : null );
				}
			
			$data['header'] = $this->load->controller('common/header');


				$this->load->model( 'module/mega_filter' );
				
				$data = $this->model_module_mega_filter->prepareData( $data );
			
			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
}
