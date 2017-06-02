<?php
class ControllerExtensionModuleCurrencySwitch extends Controller {
        public function index() {
            $data['currency_switch']='';
            if($this->config->get('currency_switch_status')==1){
                $data['currency_switch'] = $this->load->controller('common/currency');
            }

				return $this->load->view('extension/module/currency_switch', $data);

        }
}
