<?php
class ControllerExtensionModuleContentInfo extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/content_info');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
//                    echo "<pre>"; print_r($this->request->post); echo "</pre>";
//                    die();
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('content_info', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
                        $all_module_child=$this->model_extension_module->getModulesByCode("content_info");
                        $module_child_current=array('module_id'=>0);
                        foreach ($all_module_child as $key_module_child=>$item_module_child){
                            if($module_child_current['module_id']<$item_module_child['module_id'])
                                    $module_child_current=$item_module_child;
                        }
                        if(!empty($this->request->get['module_id']))
                            $module_child_current['module_id']=$this->request->get["module_id"];
			$data['success']=$this->session->data['success']= $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module/content_info', 'token=' . $this->session->data['token']."&module_id=".$module_child_current['module_id'], 'SSL'));
		}
                if(isset($this->session->data['success'])){
                    $data['success']=$this->session->data['success']= $this->language->get('text_success');
                    unset($this->session->data['success']);
                }
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title_des'] = $this->language->get('entry_title_des');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_list'] = $this->language->get('entry_list');
		$data['entry_class'] = $this->language->get('entry_class');
		$data['entry_remove_field'] = $this->language->get('entry_remove_field');
		$data['entry_remove_field_des'] = $this->language->get('entry_remove_field_des');
		$data['entry_des_class'] = $this->language->get('entry_des_class');
		$data['entry_show_title'] = $this->language->get('entry_show_title');
		$data['entry_yes'] = $this->language->get('text_yes');
		$data['entry_no'] = $this->language->get('text_no');
		$data['entry_column'] = $this->language->get('entry_column');
		$data['entry_column_dv'] = $this->language->get('entry_column_dv');
		$data['entry_column_select'] = $this->language->get('entry_column_select');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_field_image_des'] = $this->language->get('entry_field_image_des');
		$data['entry_link'] = $this->language->get('entry_link');
		$data['entry_setting_link'] = $this->language->get('entry_setting_link');
		$data['entry_link_title'] = $this->language->get('entry_link_title');
		$data['entry_link_item'] = $this->language->get('entry_link_item');
		$data['entry_for_title'] = $this->language->get('entry_for_title');
		$data['entry_for_item'] = $this->language->get('entry_for_item');
		$data['entry_for_icon'] = $this->language->get('entry_for_icon');
		$data['entry_order'] = $this->language->get('entry_order');
		$data['entry_action'] = $this->language->get('entry_action');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['text_tooltip_icon'] = $this->language->get('text_tooltip_icon');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_des_img'] = $this->language->get('entry_des_img');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['tab_icon'] = $this->language->get('tab_icon');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/content_info', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/extension', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/content_info', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('extension/module/content_info', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['show_title'])) {
			$data['show_title'] = $this->request->post['show_title'];
		} elseif (!empty($module_info)) {
			$data['show_title'] = $module_info['show_title'];
		} else {
			$data['show_title'] = 1;
		}
                // Hidden field
		if (isset($this->request->post['hidden_name'])) {
			$data['hidden-name'] = $this->request->post['hidden_name'];
		} elseif (!empty($module_info['hidden_name'])) {
			$data['hidden_name'] = $module_info['hidden_name'];
		} else {
			$data['hidden_name'] = 0;
		}
		if (isset($this->request->post['hidden_description'])) {
			$data['hidden_description'] = $this->request->post['hidden_description'];
		} elseif (!empty($module_info['hidden_description'])) {
			$data['hidden_description'] = $module_info['hidden_description'];
		} else {
			$data['hidden_description'] = 0;
		}
		if (isset($this->request->post['hidden_image'])) {
			$data['hidden_image'] = $this->request->post['hidden_image'];
		} elseif (!empty($module_info['hidden_image'])) {
			$data['hidden_image'] = $module_info['hidden_image'];
		} else {
			$data['hidden_image'] = 0;
		}
		if (isset($this->request->post['hidden_link'])) {
			$data['hidden_link'] = $this->request->post['hidden_link'];
		} elseif (!empty($module_info['hidden_link'])) {
			$data['hidden_link'] = $module_info['hidden_link'];
		} else {
			$data['hidden_link'] = 0;
		}

                if (isset($this->request->post['type'])) {
			$data['type'] = $this->request->post['type'];
		} elseif (!empty($module_info)) {
			$data['type'] = $module_info['type'];
		} else {
			$data['type'] = 'list';
		}

                if (isset($this->request->post['column'])) {
			$data['column'] = $this->request->post['column'];
		} elseif (!empty($module_info)) {
			$data['column'] = $module_info['column'];
		} else {
			$data['column'] = 1;
		}

                if (isset($this->request->post['class'])) {
			$data['class'] = $this->request->post['class'];
		} elseif (!empty($module_info)) {
			$data['class'] = $module_info['class'];
		} else {
			$data['class'] = '';
		}
                if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = '';
		}
                if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = '';
		}
                if (isset($this->request->post['class'])) {
			$data['class'] = $this->request->post['class'];
		} elseif (!empty($module_info)) {
			$data['class'] = $module_info['class'];
		} else {
			$data['class'] = '';
		}

                if (isset($this->request->post['setting_link'])) {
			$data['setting_link'] = $this->request->post['setting_link'];
		} elseif (!empty($module_info)) {
			$data['setting_link'] = $module_info['setting_link'];
		} else {
			$data['setting_link'] = 'title';
		}

                if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
                $this->load->model('tool/image');
                if (isset($this->request->post['info'])) {
			$data['info'] = $this->request->post['info'];
                        foreach ($this->request->post['info']['link'] as $key=>$item){
                            if(!empty($this->request->post['info']['image'][0][$key])){
                                $data['thumb']['image'][0][$key] = $this->model_tool_image->resize($this->request->post['info']['image'][0][$key], 70, 70);
                            }else {
                                $data['thumb']['image'][0][$key] = $this->model_tool_image->resize('no_image.png', 70, 70);
                            }
                        }
		} elseif (!empty($module_info)) {
			$data['info'] = $module_info['info'];
                        foreach ($module_info['info']['link'] as $key=>$item){
                            if(!empty($module_info['info']['image'][0][$key])){
                                $data['thumb']['image'][0][$key] = $this->model_tool_image->resize($module_info['info']['image'][0][$key], 70, 70);
                            }else {
                                $data['thumb']['image'][0][$key] = $this->model_tool_image->resize('no_image.png', 70, 70);
                            }
                        }
		} else {
			$data['info'] = '';
		}
                //var_dump($data['info']);
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 70, 70);

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/content_info', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/content_info')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		return !$this->error;
	}
}
