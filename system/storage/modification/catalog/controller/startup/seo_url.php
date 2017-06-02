<?php
class ControllerStartupSeoUrl extends Controller {
	public function index() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}

      if ($this->config->get('mlseo_enabled')) {
        // redirection manager
        $url = urldecode('http' . (!empty($_SERVER['HTTPS']) ? 's' : '') . '://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
        $uri = urldecode($_SERVER['REQUEST_URI']);
        
        if ($this->config->get('mlseo_redirect_dynamic') && isset($this->request->get['route']) && !(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest')) {
          $redir_request = $this->request->get;
          $redir_route = $redir_request['route'];
          unset($redir_request['route']);
          
          if (!empty($_SERVER['HTTPS'])) {
            $redir_url = $this->url->link($redir_route, http_build_query($redir_request, '', '&'), $_SERVER['HTTPS']);
          } else {
            $redir_url = $this->url->link($redir_route, http_build_query($redir_request, '', '&'));
          }
          
          
          if (rtrim($redir_url, '/') != rtrim($url, '/') && !strpos($redir_url, 'route=')) {
            header('HTTP/1.1 301 Moved Permanently');
            header('Location: ' . $redir_url); 
            exit;
          }
        }
        
        $redirect = $this->db->query("SELECT redirect, language_id FROM " . DB_PREFIX . "url_redirect WHERE query = '" . $this->db->escape($url) . "' OR query = '" . $this->db->escape($uri) . "' LIMIT 1")->row;
        
        if(!empty($redirect['redirect'])) {
          $lang = $redirect['language_id'];
          $redirect = $redirect['redirect'];
          
          if ((substr($redirect, 0, 1) != '/') && (substr($redirect, 0, 4) != 'http')) {
            $this->load->model('localisation/language');
            $languagesArray = $this->model_localisation_language->getLanguages();
            
            if(count($languagesArray) > 1) {
              $languages = array();
              foreach ($languagesArray as $result) { $languages[$result['language_id']] = $result; }
              $this->config->set('config_language_id', $languages[$lang]['language_id']);
              $this->config->set('config_language', $languages[$lang]['code']);
              $this->session->data['language'] = $languages[$lang]['code'];
            }
          
            if ($params = strstr($redirect, '&')) {
              $route = str_replace(array($params, 'index.php?route='), '', $redirect);
            } else {
              $params = '';
            }
            
            $redirect = str_replace('&amp;', '&', $this->url->link($route, substr(str_replace('&amp;', '&', $params), 1)));
          }
          
          if ($redirect != $url) {
            header('HTTP/1.1 301 Moved Permanently');
            header('Location: ' . $redirect); 
            exit;
          }
        }
      }
      

		// Decode URL
		  /*if ($this->config->get('mlseo_flag') && !isset($this->request->get["_route_"]) && !isset($this->request->get["route"])) {
        if ($this->config->get('mlseo_default_lang') == substr($this->session->data['language'], 0, 2) || $this->config->get('mlseo_default_lang') == $this->session->data['language']) {
          if (version_compare(VERSION, '2', '>=')) return new Action('common/home');
          else return $this->forward('common/home');
        } else {
          if (version_compare(VERSION, '2', '>=')) $this->response->redirect($this->url->link('common/home'));
          else $this->redirect($this->url->link('common/home'));
        }
      }
      */
      if (!empty($this->request->get['_route_'])) {
        if ($this->config->get('mlseo_extension')) {
          $this->request->get['_route_'] = str_replace($this->config->get('mlseo_extension'), '', $this->request->get['_route_']);
        }
			$parts = explode('/', $this->request->get['_route_']);

			// remove any empty arrays from trailing
			if (utf8_strlen(end($parts)) == 0) {
				array_pop($parts);
			}

			$mfilterConfig = $this->config->get( 'mega_filter_seo' );

				if( ! empty( $mfilterConfig['enabled'] ) ) {
					$this->load->model( 'module/mega_filter' );
				
					if( class_exists( 'MegaFilterCore' ) ) {
						$parts = MegaFilterCore::prepareSeoParts( $this, $parts );
					}
				}
				
				
      $seoIsCategory = false;
      
			foreach ($parts as $part) {
      
        if ($this->config->get('mlseo_enabled') && $this->config->get('mlseo_pagination') && preg_match('/page-(\d+)/', $part, $page)) {
          $this->request->get['page'] = $page[1];
          continue;
        }
      				
					if( ! empty( $mfilterConfig['enabled'] ) && class_exists( 'MegaFilterCore' ) && MegaFilterCore::prepareSeoPart( $this, $part ) ) {
						continue;
					}
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "' OR keyword = '" . $this->db->escape($this->request->get['_route_']) . "'");
      
        if ($this->config->get('mlseo_enabled') && $this->config->get('mlseo_absolute') && $query->num_rows > 1) {
          foreach ($query->rows as $key => $row) {
            if (!$seoIsCategory && strpos($row['query'], 'category_id=') !== 0) {
              $query->row = $row;
              $query->rows = array($row);
              break;
            }
          }
        }
      

				$mfilterConfig = $this->config->get( 'mega_filter_seo' );
				
				if( ! empty( $mfilterConfig['enabled'] ) && ! $query->num_rows ) {
					$mfilter_query = $this->db->query( "SELECT * FROM `" . DB_PREFIX . "mfilter_url_alias` WHERE `alias` = '" . $this->db->escape( $part ) . "'");
				
					if( $mfilter_query->num_rows ) {
						if( ! isset( $this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')] ) ) {
							$this->request->get[($this->config->get('mfilter_url_param')?$this->config->get('mfilter_url_param'):'mfp')] = $mfilter_query->row['mfp'];
						}
						$this->request->get['mfp_seo_alias'] = $part;
				
						continue;
					}
				}				
			

				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);


          if ($url[0] == 'route') {
            $this->request->get['route'] = $url[1];
          }
          
          if (isset($url[1]) && !in_array($url[0], array('route', 'product_id', 'category_id', 'information_id', 'manufacturer_id', 'blog_article_id'))) {
            $this->request->get[$url[0]] = $url[1];
          }
      
					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}

					if ($url[0] == 'category_id') {

            $seoIsCategory = true;
            
            if ($this->config->get('mlseo_enabled') && $this->config->get('mlseo_absolute') && $query->num_rows > 1) {
              $parent_id = 0;
              
              if (!empty($this->request->get['path'])) {
            $parent_id = str_replace('_', '', strrchr($this->request->get['path'], '_'));
                
                if(!$parent_id) {
                  $parent_id = $this->request->get['path'];
                }
              }
            
              $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias u left join " . DB_PREFIX . "category c on c.category_id = REPLACE(u.query, 'category_id=', '') WHERE u.keyword = '" . $this->db->escape($part) . "' AND c.parent_id = '" . $this->db->escape($parent_id) . "'");
                    if (isset($query->row['query']))
              $url = explode('=', $query->row['query']);
            }
      
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}

					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];

        if ($this->config->get('mlseo_fpp_brand_parent') && isset($this->request->get['route']) && $this->request->get['route'] == 'product/manufacturer') {
          unset($this->request->get['route']);
				}
			
					}

					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}


			if ($url[0] == 'recruit_id') {$this->request->get['recruit_id'] = $url[1]; }
			if ($url[0] == 'recruit_category_id') {
			if (!isset($this->request->get['recruitpath'])) {
			$this->request->get['recruitpath'] = $url[1];
				} else {
				$this->request->get['recruitpath'] = '_' . $url[1];
			}}
			

			if ($url[0] == 'blog_id') {$this->request->get['blog_id'] = $url[1]; }
			if ($url[0] == 'blog_category_id') {
			if (!isset($this->request->get['blogpath'])) {
			$this->request->get['blogpath'] = $url[1];
				} else {
			$this->request->get['blogpath'] .= '_' . $url[1];
			}}
			

					if ($url[0] == 'page_form_id') {
						$this->request->get['page_form_id'] = $url[1];
					}
			
					if (empty($this->request->get['route']) && $url[0] != 'route' && !empty($query->row['query']) && $url[0] != 'page_form_id' &&  $url[0] != 'information_id' && $url[0] != 'manufacturer_id' && $url[0] 
			
			!= 'category_id' && $url[0] != 'blog_category_id' && $url[0] != 'blog_id' && $url[0]
			 != 'recruit_category_id' && $url[0] != 'recruit_id' && $url[0]
			 != 'product_id') {
						$this->request->get['route'] = $query->row['query'];
					}
				} else {
					$this->request->get['route'] = 'error/not_found';

					break;
				}
			}

			if (!isset($this->request->get['route'])) {
				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';

			} elseif (isset($this->request->get['blog_id'])) {
			$this->request->get['route'] = 'blog/blog';
			} elseif ($this->request->get['_route_'] ==  'blog_home') {
			$this->request->get['route'] = 'blog/home';
			

			} elseif (isset($this->request->get['recruit_id'])) {
			$this->request->get['route'] = 'recruit/recruit';
			} elseif ($this->request->get['_route_'] ==  'recruit_home') {
			$this->request->get['route'] = 'recruit/home';
			
				} elseif (isset($this->request->get['path'])) {
					$this->request->get['route'] = 'product/category';

			} elseif (isset($this->request->get['blogpath'])) {
			$this->request->get['route'] = 'blog/category';
			

			} elseif (isset($this->request->get['recruitpath'])) {
			$this->request->get['route'] = 'recruit/category';
			
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				
				} elseif (isset($this->request->get['page_form_id'])) {
					$this->request->get['route'] = 'page/form';
				} elseif (isset($this->request->get['information_id'])) {
			
					$this->request->get['route'] = 'information/information';
				}
			}

        if (isset($this->request->get['route']) && $this->config->get('mlseo_redirect_canonical')) {
          $url = urldecode('http' . (!empty($_SERVER['HTTPS']) ? 's' : '') . '://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
          $uri = urldecode($_SERVER['REQUEST_URI']);
          
          $redir_request = $this->request->get;
          $redir_route = $redir_request['route'];
          unset($redir_request['route'], $redir_request['_route_']);
          
          if (!empty($_SERVER['HTTPS'])) {
            if ($this->request->get['route'] == 'product/category' && $this->config->get('mlseo_redirect_canonical_cat')) {
              $this->load->model('tool/path_manager');
              
              $cat_id = strstr($redir_request['path'], '_') ? substr(strrchr($redir_request['path'], '_'), 1) : $redir_request['path'];
              
              $redir_url = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . ($this->config->get('mlseo_fpp_cat_canonical') ? $this->model_tool_path_manager->getFullCategoryPath($cat_id) : $cat_id), $_SERVER['HTTPS']));
            } else {
              $redir_url = str_replace('&amp;', '&', $this->url->link($redir_route, http_build_query($redir_request, '', '&'), $_SERVER['HTTPS']));
            }
          } else {
            if ($this->request->get['route'] == 'product/category' && $this->config->get('mlseo_redirect_canonical_cat')) {
              $this->load->model('tool/path_manager');
              
              $cat_id = strstr($redir_request['path'], '_') ? substr(strrchr($redir_request['path'], '_'), 1) : $redir_request['path'];
              
              $redir_url = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . ($this->config->get('mlseo_fpp_cat_canonical') ? $this->model_tool_path_manager->getFullCategoryPath($cat_id) : $cat_id)));
            } else {
              $redir_url = str_replace('&amp;', '&', $this->url->link($redir_route, http_build_query($redir_request, '', '&')));
            }
          }
          
          if (!strpos($redir_url, 'route=') && (($redir_url != str_replace('&amp;', '&', $url)) && (urldecode($redir_url) != str_replace('&amp;', '&', $url)))) {
            header('HTTP/1.1 301 Moved Permanently');
            header('Location: ' . $redir_url); 
            exit;
          }
        }
      
		}
	}

	public function rewrite($link) {

        if (isset($this->session->data['language']) && !($this->session->data['language'] == $this->config->get('config_language') || $this->session->data['language'] == strstr($this->config->get('config_language'), '-', true))) {
          $this->load->model('localisation/language');
          $languagesById = $this->model_localisation_language->getLanguages();
          $languages = array();
          foreach ($languagesById as $result) {
            $languages[$result['code']] = $result;
            if (strpos($result['code'], '-')) {
              $languages[strstr($result['code'], '-', true)] = $result;
            }
          }
          $this->config->set('config_language_id', $languages[ $this->session->data['language'] ]['language_id']);
        }
        
        $lang = isset($this->session->data['language']) ? $this->session->data['language'] : $this->config->get('config_language');
        
        if ($this->config->get('mlseo_ml_mode')) {
          $ml_mode = "AND (`language_id` = '" . (int)$this->config->get('config_language_id') . "' OR `language_id` = 0)";
        } else {
          $ml_mode = '';
        }
      
		$url_info = parse_url(str_replace('&amp;', '&', $link));

		$url = '';

		$data = array();

		parse_str($url_info['query'], $data);
      
				if($data['route'] == 'product/product') {
          if($this->config->get('mlseo_fpp_bypasscat') && isset($data['path'])) {
            unset($data['path']);
          }
          
          if(isset($data['manufacturer_id']) && $this->config->get('mlseo_fpp_mode') != '3') {
            unset($data['manufacturer_id']);
          }
          
          if(!isset($data['path']) && !isset($data['manufacturer_id']) && isset($data['product_id'])) {
            $this->load->model('tool/path_manager');
            $data = (array) $this->model_tool_path_manager->getFullProductPath($data['product_id']) + $data;
          }
				}
        
        $gkd_is_category = ($data['route'] == 'product/category') ? true : false;

		foreach ($data as $key => $value) {
			if (isset($data['route'])) {

      $url_cache = NULL;
      if ($this->config->get('mlseo_cache') && $this->config->get('mlseo_enabled'))
        $url_cache = Powercache::get('seo_rewrite.' . $this->config->get('config_language_id'), $this->db->escape($key . '=' . $value));
      if ($url_cache === NULL) {
        $old_url = $url;
      
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || 
			($data['route'] == 'information/information' && $key == 'information_id') || ($data['route'] == 'page/form' && $key == 'page_form_id') || ($data['route'] == 'recruit/recruit' && $key == 'recruit_id'))
			 {
					
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'" . $ml_mode);
      

					if ($query->num_rows && $query->row['keyword']) {

        if ($data['route'] == 'product/manufacturer/info' && $key == 'manufacturer_id' && $this->config->get('mlseo_fpp_brand_parent')) {
          $this->load->model('tool/path_manager');
          $url .= $this->model_tool_path_manager->getManufacturerKeyword();
        }
			
if ($this->config->get('mlseo_enabled') && !(($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id')) $url .= '/' . $query->row['keyword'] . $this->config->get('mlseo_extension'); else
						$url .= '/' . $query->row['keyword'];

						unset($data[$key]);
					}

			} elseif ($key == 'recruitpath') {
			$recruit_categories = explode('_', $value);
			foreach ($recruit_categories as $category) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'recruit_category_id=" . (int)$category . "'");
			if ($query->num_rows) {
			$url = '/' . $query->row['keyword'];
			} else {
			$url = '';
			break;
			}}
			unset($data[$key]);
			} elseif (isset($data['route']) && $data['route'] ==   'recruit/home') {
			$recruit_home = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'recruit/home'");
			if ($recruit_home->num_rows) {
			$url = '/' . $recruit_home->row['keyword'];
			} else {
			$url = '';
			}
			
				} 
          elseif ($this->config->get('mlseo_enabled') && $key == 'route' && $value == 'common/home') {
            $url .= '/';
          } elseif ($this->config->get('mlseo_enabled') && $this->config->get('mlseo_pagination') && $key == 'page') {
            $url .= '/page-'.$value;
            unset($data[$key]);
          } elseif ($key == 'path') {
      
					$categories = explode('_', $value);

          $last_cat = count($categories)-1;
          foreach ($categories as $cat_key => $cat_id) {
            if($cat_key != $last_cat && in_array($cat_id, (array) $this->config->get('mlseo_fpp_categories'))) {
              unset($categories[$cat_key]);
            }
          }
      

        if ($this->config->get('mlseo_fpp_directcat')) {
          $categories = array(array_pop($categories));
				}
			

					foreach ($categories as $category) {
						
              $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'" . $ml_mode);
      

						if ($query->num_rows && $query->row['keyword']) {
							$url .= '/' . $query->row['keyword'];
						} else {
							$url = '';

							break;
						}
					}

					unset($data[$key]);
				}

          elseif ($this->config->get('mlseo_enabled') && $this->config->get('mlseo_friendly') && $value != 'common/home'  && !in_array($key, array('path', 'product_id', 'category_id', 'manufacturer_id', 'information_id'))) {
            $query = $this->db->query("SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . $value) . "'" . $ml_mode);
            if ($query->num_rows) {
              $url .= '/' . $query->row['keyword'];
              $url .= $query->row['keyword'] ? $this->config->get('mlseo_extension') : '';
              if($key != 'route') unset($data[$key]);
            }
          }
          
        if ($this->config->get('mlseo_cache'))
          Powercache::add('seo_rewrite.' . $this->config->get('config_language_id'), $this->db->escape($key . '=' . $value), str_replace($old_url, '', $url));
      } else if ($url_cache) {
        $url .= $url_cache;
        unset($data[$key]);
      } //end cache
      
			}
		}

		if ($url) {

				if( ! isset( $this->model_module_mega_filter ) ) {
					$this->load->model( 'module/mega_filter' );
				}
				
				//if( method_exists( $this->model_module_mega_filter, 'rewrite' ) ) {
					list( $url, $url_data ) = $this->model_module_mega_filter->rewrite( $url, $data );
				//}
			
			unset($data['route']);

			$query = '';

			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . rawurlencode((string)$key) . '=' . rawurlencode((is_array($value) ? http_build_query($value) : (string)$value));
				}

				if ($query) {
					$query = '?' . str_replace('&', '&amp;', trim($query, '&'));
				}
			}


        
        if ($this->config->get('mlseo_enabled') && $this->config->get('mlseo_flag') && !($this->config->get('mlseo_flag_default') && ($this->config->get('mlseo_default_lang') == $lang))) {
          if ($this->config->get('mlseo_flag_short')) {
            $lang = substr($lang, 0, 2);
          }
          
          $url = ($this->config->get('mlseo_flag_upper')) ? '/'.strtoupper($lang).$url : '/'.$lang.$url;
        }
        
        $url = rtrim($url, '/');
        
        if ($this->config->get('mlseo_cat_slash') && !empty($gkd_is_category)) {
          $url .= '/';
        }
      
			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
			return $link;
		}
	}
}
