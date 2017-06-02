<?php

class ControllerExtensionModuleContentInfo extends Controller {
    public function index($setting) {
        if (isset($setting['info'])) {
            $data['name'] = $setting['name'];
            $data['type'] = $setting['type'];
            $data['column'] = $setting['column'];
            $data['class'] = $setting['class'];
            $data['show_title'] = $setting['show_title'];
            $data['width'] = $setting['width']?$setting['width']:50;
            $data['height'] = $setting['height']?$setting['height']:50;

            $data['info'] = $setting['info'];
            $this->load->model('tool/image');
            foreach ($setting['info']['link'] as $key=>$item){
                if(!empty($setting['info']['image'][0][$key])){
                    $data['thumb']['image'][0][$key] = $this->model_tool_image->resize($setting['info']['image'][0][$key],$data['width'], $data['height']);
                }
            }
            $data['setting_link'] = $setting['setting_link'];
            $data['language_current']=$this->config->get('config_language_id');

            return $this->load->view('extension/module/content_info', $data);
        }
    }
}
