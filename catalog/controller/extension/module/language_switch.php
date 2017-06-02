<?php
class ControllerExtensionModuleLanguageSwitch extends Controller {
        public function index() {
            $data['language']='';
            if($this->config->get('language_switch_status')==1){
                $data['language'] = $this->load->controller('common/language');
            }
          return $this->load->view('extension/module/language_switch', $data);
        }
}
