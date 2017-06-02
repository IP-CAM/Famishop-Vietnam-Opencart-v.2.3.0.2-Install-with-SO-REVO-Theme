<?php
class ControllerStartupMaintenance extends Controller {
	public function index() {

            //========= OpenCart Shortcodes
            //=== Default shortcodes
            $this->load->helper('shortcodes_default');

            $class = new ShortcodesDefault($this->registry);
            $scDefaults = get_class_methods($class);
            foreach ($scDefaults as $shortcode) {
                $this->shortcodes->add_shortcode($shortcode, $class);
            }

            //=== Extensions shortcodes : for extensions developer
            $files = glob(DIR_APPLICATION . '/view/shortcodes/*.php');
            if ($files) {
                foreach ($files as $file) {
                   require_once($file);

                   $file     = basename($file, ".php");
                   $extClass = 'Shortcodes' . preg_replace('/[^a-zA-Z0-9]/', '', $file);

                   $class = new $extClass($this->registry);
                   $scExtensions = get_class_methods($class);
                   foreach ($scExtensions as $shortcode) {
                      $this->shortcodes->add_shortcode($shortcode, $class);
                   }
                }
            }

            //--------------- OLD theme OpenCart 2 compatible
            $theme = $this->config->get('config_theme');
            if ($this->config->get('config_theme') == 'theme_default') {
              $theme = $this->config->get('theme_default_directory');
            }

            //=== Themes shortcodes : for theme developer
            $file = DIR_TEMPLATE . $theme . '/shortcodes_theme.php';
            if (file_exists($file)) {
                require_once($file);

                $class      = new ShortcodesTheme($this->registry);
                $scThemes   = get_class_methods($class);
                foreach ($scThemes as $shortcode) {
                   $this->shortcodes->add_shortcode($shortcode, $class);
                }
            }

            $this->event->trigger('shortcodes/themes/after', array(&$data));

            //=== Custom shortcodes : user power!
            $file = DIR_TEMPLATE . $theme . '/shortcodes_custom.php';
            if (file_exists($file)) {
                require_once($file);

                $class      = new ShortcodesCustom($this->registry);
                $scCustom   = get_class_methods($class);
                foreach ($scCustom as $shortcode) {
                   $this->shortcodes->add_shortcode($shortcode, $class);
                }
            }
            //========= End:: OpenCart Shortcodes
            
		if ($this->config->get('config_maintenance')) {
			// Route
			if (isset($this->request->get['route']) && $this->request->get['route'] != 'startup/router') {
				$route = $this->request->get['route'];
			} else {
				$route = $this->config->get('action_default');
			}			
			
			$ignore = array(
				'common/language/language',
				'common/currency/currency'
			);
			
			// Show site if logged in as admin
			$this->user = new Cart\User($this->registry);

			if ((substr($route, 0, 7) != 'payment' && substr($route, 0, 3) != 'api') && !in_array($route, $ignore) && !$this->user->isLogged()) {
				return new Action('common/maintenance');
			}
		}
	}
}
