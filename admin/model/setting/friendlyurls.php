<?php
class ModelSettingFriendlyurls extends Model {
  
  public function getAvailableLangs() {
	return array_keys($this->urls);
  }
  
  public function getFriendlyUrls($lang) {
    if (strstr($lang, '-', true)) {
      $lang = strtolower(strstr($lang, '-', true));
    } else {
      $lang = strtolower($lang);
    }
    
    if(isset($this->urls[$lang]))
      return $this->urls[$lang];
    return $this->urls['en'];
  }
  
  public $urls = array(
    'en' => array(
      'account/account'       => 'account',
      'account/address'       => 'account/address',
      'account/download'      => 'account/download',
      'account/edit'          => 'account/edit',
      'account/forgotten'     => 'account/forgotten',
      'account/login'         => 'account/login',
      'account/logout'        => 'account/logout',
      'account/newsletter'    => 'account/newsletter',
      'account/order'         => 'account/order',
      'account/password'      => 'account/password',
      'account/register'      => 'account/register',
      'account/return'        => 'account/return',
      'account/return/insert' => 'account/return/insert',
      'account/reward'        => 'account/reward',
      'account/transaction'   => 'account/transaction',
      'account/voucher'       => 'account/voucher',
      'account/wishlist'      => 'account/wishlist',
      'information/contact'   => 'contact',
      'information/sitemap'   => 'sitemap',
      'checkout/checkout'     => 'checkout',
      'checkout/voucher'      => 'voucher',
      'product/compare'       => 'compare',
      'product/manufacturer'  => 'manufacturer',
      'product/special'       => 'special',
      'affiliate/account'     => 'affiliate/account',
      'affiliate/login'       => 'affiliate/login',
      'affiliate/logout'      => 'affiliate/logout',
      'affiliate/edit'        => 'affiliate/edit',
      'affiliate/forgotten'   => 'affiliate/forgotten',
      'affiliate/password'    => 'affiliate/password',
      'affiliate/register'    => 'affiliate/register',
      'affiliate/tracking'    => 'affiliate/tracking',
      'affiliate/transaction' => 'affiliate/transaction',
      //'checkout/cart'         => 'cart', // do not use it because opencart cannot handle it
      //'product/search'        => 'search', // do not use it because opencart cannot handle it
    ),
    
    'fr' => array(
      'account/account'       => 'compte',
      'account/address'       => 'compte/adresse',
      'account/download'      => 'compte/telechargements',
      'account/edit'          => 'compte/profil',
      'account/forgotten'     => 'compte/oubli',
      'account/login'         => 'compte/login',
      'account/logout'        => 'compte/logout',
      'account/newsletter'    => 'compte/newsletter',
      'account/order'         => 'compte/commandes',
      'account/password'      => 'compte/password',
      'account/register'      => 'compte/enregistrement',
      'account/return'        => 'compte/retours',
      'account/return/insert' => 'compte/retours/ajout',
      'account/reward'        => 'compte/recompense',
      'account/transaction'   => 'compte/transaction',
      'account/voucher'       => 'compte/cheque-cadeau',
      'account/wishlist'      => 'compte/wishlist',
      'information/contact'   => 'contact',
      'information/sitemap'   => 'sitemap',
      'checkout/checkout'     => 'commande',
      'checkout/voucher'      => 'cheque-cadeau',
      'product/compare'       => 'comparer',
      'product/manufacturer'  => 'marque',
      'product/special'       => 'special',
      'affiliate/account'     => 'affilié/compte',
      'affiliate/login'       => 'affilié/login',
      'affiliate/logout'      => 'affilié/logout',
      'affiliate/edit'        => 'affilié/profil',
      'affiliate/forgotten'   => 'affilié/oubli',
      'affiliate/password'    => 'affilié/password',
      'affiliate/register'    => 'affilié/enregistrement',
      'affiliate/tracking'    => 'affilié/suivi',
      'affiliate/transaction' => 'affilié/transaction',
      //'checkout/cart'         => 'panier',
      //'product/search'        => 'recherche',
    ),

    'pt' => array(
      'account/account' => 'conta',
      'account/address' => 'conta/morada',
      'account/download' => 'conta/download',
      'account/edit' => 'conta/editar',
      'account/forgotten' => 'conta/recuperar-password',
      'account/login' => 'conta/entrar',
      'account/logout' => 'conta/sair',
      'account/newsletter' => 'conta/newsletter',
      'account/order' => 'conta/encomendas',
      'account/password' => 'conta/password',
      'account/register' => 'conta/registar',
      'account/return' => 'conta/itens-retornados',
      'account/reward' => 'conta/classificacao',
      'account/transaction' => 'conta/transacoes',
      'account/voucher' => 'conta/voucher',
      'account/wishlist' => 'conta/lista-desejos',
      'information/contact' => 'contatos',
      'information/sitemap' => 'sitemap',
      'checkout/checkout' => 'fechar-pedido',
      'checkout/voucher' => 'voucher',
      'product/compare' => 'comparar',
      'product/manufacturer' => 'fabricantes',
      'product/special' => 'promocoes',
      'affiliate/account' => 'afiliada/conta',
      'affiliate/login' => 'afiliada/entrar',
      'affiliate/logout' => 'afiliada/sair',
      'affiliate/edit' => 'afiliada/editar',
      'affiliate/forgotten' => 'afiliada/recuperar-password',
      'affiliate/password' => 'afiliada/password',
      'affiliate/register' => 'afiliada/registar',
      'affiliate/tracking' => 'afiliada/localizar',
      'affiliate/transaction' => 'afiliada/transacoes',
      //'checkout/cart' => 'cesto',
      //'product/search' => 'pesquisa',
    ),

    'de' => array(
      'account/account'       => 'konto',
      'account/address'       => 'konto/anschrift',
      'account/download'      => 'konto/herunterladen',
      'account/edit'          => 'konto/bearbeiten',
      'account/forgotten'     => 'konto/vergessen',
      'account/login'         => 'konto/login',
      'account/logout'        => 'konto/logout',
      'account/newsletter'    => 'konto/newsletter',
      'account/order'         => 'konto/bestellung',
      'account/password'      => 'konto/passwort',
      'account/register'      => 'konto/registrierung',
      'account/return'        => 'konto/ruckgabe',
      'account/return/insert' => 'konto/ruckgabe/hinzufugen',
      'account/reward'        => 'konto/belohnung',
      'account/transaction'   => 'konto/geschaft',
      'account/voucher'       => 'konto/gutschein',
      'account/wishlist'      => 'konto/wishlist',
      'information/contact'   => 'ansprechpartner',
      'information/sitemap'   => 'sitemap',
      'checkout/checkout'     => 'kasse',
      'checkout/voucher'      => 'gutschein',
      'product/compare'       => 'vergleichen',
      'product/manufacturer'  => 'hersteller',
      'product/special'       => 'spezielle',
      'affiliate/account'     => 'affiliate/konto',
      'affiliate/login'       => 'affiliate/login',
      'affiliate/logout'      => 'affiliate/logout',
      'affiliate/edit'        => 'affiliate/bearbeiten',
      'affiliate/forgotten'   => 'affiliate/vergessen',
      'affiliate/password'    => 'affiliate/passwort',
      'affiliate/register'    => 'affiliate/registrierung',
      'affiliate/tracking'    => 'affiliate/verfolgung',
      'affiliate/transaction' => 'affiliate/geschaft',
      //'checkout/cart'       => 'einkaufswagen',
      //'product/search'      => 'suche',
    ),

    'it' => array(
      'account/account'       => 'conto',
      'account/address'       => 'conto/indirizzo',
      'account/download'      => 'conto/scaricamento',
      'account/edit'          => 'conto/modificare',
      'account/forgotten'     => 'conto/dimenticato',
      'account/login'         => 'conto/login',
      'account/logout'        => 'conto/logout',
      'account/newsletter'    => 'conto/newsletter',
      'account/order'         => 'conto/ordine',
      'account/password'      => 'conto/password',
      'account/register'      => 'conto/registro',
      'account/return'        => 'conto/ritorno',
      'account/return/insert' => 'conto/ritorno/aggiungendo',
      'account/reward'        => 'conto/ricompensa',
      'account/transaction'   => 'conto/transazione',
      'account/voucher'       => 'conto/buono',
      'account/wishlist'      => 'conto/wishlist',
      'information/contact'   => 'contatto',
      'information/sitemap'   => 'sitemap',
      'checkout/checkout'     => 'ordine',
      'checkout/voucher'      => 'buono',
      'product/compare'       => 'confrontare',
      'product/manufacturer'  => 'contrassegno',
      'product/special'       => 'speciale',
      'affiliate/account'     => 'affiliato/conto',
      'affiliate/login'       => 'affiliato/login',
      'affiliate/logout'      => 'affiliato/logout',
      'affiliate/edit'        => 'affiliato/modificare',
      'affiliate/forgotten'   => 'affiliato/dimenticato',
      'affiliate/password'    => 'affiliato/password',
      'affiliate/register'    => 'affiliato/registro',
      'affiliate/tracking'    => 'affiliato/seguire',
      'affiliate/transaction' => 'affiliato/transazione',
      //'checkout/cart'         => 'carrello',
      //'product/search'        => 'ricerca',
    ),

    'es' => array(
      'account/account'       => 'cuenta',
      'account/address'       => 'cuenta/direccion',
      'account/download'      => 'cuenta/descargar',
      'account/edit'          => 'cuenta/editar',
      'account/forgotten'     => 'cuenta/olvidado',
      'account/login'         => 'cuenta/login',
      'account/logout'        => 'cuenta/logout',
      'account/newsletter'    => 'cuenta/newsletter',
      'account/order'         => 'cuenta/pedido',
      'account/password'      => 'cuenta/password',
      'account/register'      => 'cuenta/registro',
      'account/return'        => 'cuenta/devolucion',
      'account/return/insert' => 'cuenta/devolucion/anadir',
      'account/reward'        => 'cuenta/recompensa',
      'account/transaction'   => 'cuenta/transaccion',
      'account/voucher'       => 'cuenta/vale',
      'account/wishlist'      => 'cuenta/wishlist',
      'information/contact'   => 'contacto',
      'information/sitemap'   => 'sitemap',
      'checkout/checkout'     => 'pedido',
      'checkout/voucher'      => 'vale',
      'product/compare'       => 'comparar',
      'product/manufacturer'  => 'marca',
      'product/special'       => 'especial',
      'affiliate/account'     => 'afiliado/cuenta',
      'affiliate/login'       => 'afiliado/login',
      'affiliate/logout'      => 'afiliado/logout',
      'affiliate/edit'        => 'afiliado/editar',
      'affiliate/forgotten'   => 'afiliado/olvidado',
      'affiliate/password'    => 'afiliado/password',
      'affiliate/register'    => 'afiliado/registro',
      'affiliate/tracking'    => 'afiliado/seguimiento',
      'affiliate/transaction' => 'afiliado/transaccion',
      //'checkout/cart'         => 'cesta',
      //'product/search'        => 'buscar',
    ),

    'nl' => array(
      'account/account'       => 'rekening',
      'account/address'       => 'rekening/adres',
      'account/download'      => 'rekening/downloaden',
      'account/edit'          => 'rekening/bewerken',
      'account/forgotten'     => 'rekening/vergeten',
      'account/login'         => 'rekening/login',
      'account/logout'        => 'rekening/logout',
      'account/newsletter'    => 'rekening/newsletter',
      'account/order'         => 'rekening/order',
      'account/password'      => 'rekening/password',
      'account/register'      => 'rekening/registratie',
      'account/return'        => 'rekening/terugkeer',
      'account/return/insert' => 'rekening/terugkeer/toevoegen',
      'account/reward'        => 'rekening/beloning',
      'account/transaction'   => 'rekening/transactie',
      'account/voucher'       => 'rekening/voucher',
      'account/wishlist'      => 'rekening/wishlist',
      'information/contact'   => 'contact',
      'information/sitemap'   => 'sitemap',
      'checkout/checkout'     => 'order',
      'checkout/voucher'      => 'voucher',
      'product/compare'       => 'vergelijken',
      'product/manufacturer'  => 'mark',
      'product/special'       => 'special',
      'affiliate/account'     => 'affiliate/rekening',
      'affiliate/login'       => 'affiliate/login',
      'affiliate/logout'      => 'affiliate/logout',
      'affiliate/edit'        => 'affiliate/bewerken',
      'affiliate/forgotten'   => 'affiliate/vergeten',
      'affiliate/password'    => 'affiliate/password',
      'affiliate/register'    => 'affiliate/registratie',
      'affiliate/tracking'    => 'affiliate/bijhouden',
      'affiliate/transaction' => 'affiliate/transactie',
      //'checkout/cart'         => 'winkelwagen',
      //'product/search'        => 'zoeken',
    ),
	
    'no' => array(
      'account/account'       => 'konto',
      'account/address'       => 'konto/adresse',
      'account/download'      => 'konto/download',
      'account/edit'          => 'konto/redigere',
      'account/forgotten'     => 'konto/glemt',
      'account/login'         => 'konto/login',
      'account/logout'        => 'konto/logout',
      'account/newsletter'    => 'konto/newsletter',
      'account/order'         => 'konto/ordre',
      'account/password'      => 'konto/password',
      'account/register'      => 'konto/registrering',
      'account/return'        => 'konto/retur',
      'account/return/insert' => 'konto/retur/tilsette',
      'account/reward'        => 'konto/belønning',
      'account/transaction'   => 'konto/transaksjon',
      'account/voucher'       => 'konto/bilag',
      'account/wishlist'      => 'konto/wishlist',
      'information/contact'   => 'kontakt',
      'information/sitemap'   => 'sitemap',
      'checkout/checkout'     => 'sjekk-ut',
      'checkout/voucher'      => 'bilag',
      'product/compare'       => 'sammenligne',
      'product/manufacturer'  => 'mark',
      'product/special'       => 'spesielle',
      'affiliate/account'     => 'tilsluttet/konto',
      'affiliate/login'       => 'tilsluttet/login',
      'affiliate/logout'      => 'tilsluttet/logout',
      'affiliate/edit'        => 'tilsluttet/redigere',
      'affiliate/forgotten'   => 'tilsluttet/glemt',
      'affiliate/password'    => 'tilsluttet/password',
      'affiliate/register'    => 'tilsluttet/registrering',
      'affiliate/tracking'    => 'tilsluttet/sporing',
      'affiliate/transaction' => 'tilsluttet/transaksjon',
      //'checkout/cart'         => 'handlekurven',
      //'product/search'        => 'søk',
    ),

    'se' => array(
      'account/account'       => 'konto',
      'account/address'       => 'konto/adress',
      'account/download'      => 'konto/nedladdning',
      'account/edit'          => 'konto/redigera',
      'account/forgotten'     => 'konto/glomt',
      'account/login'         => 'konto/login',
      'account/logout'        => 'konto/logout',
      'account/newsletter'    => 'konto/newsletter',
      'account/order'         => 'konto/order',
      'account/password'      => 'konto/password',
      'account/register'      => 'konto/registrering',
      'account/return'        => 'konto/retur',
      'account/return/insert' => 'konto/retur/insats',
      'account/reward'        => 'konto/beloning',
      'account/transaction'   => 'konto/transaktion',
      'account/voucher'       => 'konto/voucher',
      'account/wishlist'      => 'konto/wishlist',
      'information/contact'   => 'kontakta',
      'information/sitemap'   => 'sitemap',
      'checkout/checkout'     => 'checkout',
      'checkout/voucher'      => 'voucher',
      'product/compare'       => 'jamfora',
      'product/manufacturer'  => 'marke',
      'product/special'       => 'special',
      'affiliate/account'     => 'anslutna/konto',
      'affiliate/login'       => 'anslutna/login',
      'affiliate/logout'      => 'anslutna/logout',
      'affiliate/edit'        => 'anslutna/redigera',
      'affiliate/forgotten'   => 'anslutna/glomt',
      'affiliate/password'    => 'anslutna/password',
      'affiliate/register'    => 'anslutna/registrering',
      'affiliate/tracking'    => 'anslutna/spårning',
      'affiliate/transaction' => 'anslutna/transaktion',
      //'checkout/cart'         => 'varukorgen',
      //'product/search'        => 'sök',
    ),

    'ru' => array(
      'account/account'       => 'счет',
      'account/address'       => 'счет/адрес',
      'account/download'      => 'счет/скачать',
      'account/edit'          => 'счет/редактировать',
      'account/forgotten'     => 'счет/забыли',
      'account/login'         => 'счет/войти',
      'account/logout'        => 'счет/выход-из-системы',
      'account/newsletter'    => 'счет/бюллетень',
      'account/order'         => 'счет/заказ',
      'account/password'      => 'счет/пароль',
      'account/register'      => 'счет/регистр',
      'account/return'        => 'счет/возврат',
      'account/return/insert' => 'счет/возврат/добавлять',
      'account/reward'        => 'счет/вознаграждение',
      'account/transaction'   => 'счет/сделка',
      'account/voucher'       => 'счет/ваучер',
      'account/wishlist'      => 'счет/лист-желаний',
      'information/contact'   => 'контактная',
      'information/sitemap'   => 'карта-сайта',
      'checkout/checkout'     => 'выписка',
      'checkout/voucher'      => 'ваучер',
      'product/compare'       => 'сравнить',
      'product/manufacturer'  => 'знак',
      'product/special'       => 'специальные',
      'affiliate/account'     => 'аффилированным/счет',
      'affiliate/login'       => 'аффилированным/войти',
      'affiliate/logout'      => 'аффилированным/выход-из-системы',
      'affiliate/edit'        => 'аффилированным/редактировать',
      'affiliate/forgotten'   => 'аффилированным/забыли',
      'affiliate/password'    => 'аффилированным/пароль',
      'affiliate/register'    => 'аффилированным/регистр',
      'affiliate/tracking'    => 'аффилированным/слежение',
      'affiliate/transaction' => 'аффилированным/сделка',
      //'checkout/cart'         => 'поиск',
      //'product/search'        => 'поиск',
    ),

    'ko' => array(
      'account/account'       => 'gyejeong',
      'account/address'       => 'gyejeong/juso',
      'account/download'      => 'gyejeong/daunlodeu',
      'account/edit'          => 'gyejeong/pyeonjib',
      'account/forgotten'     => 'gyejeong/ij-eo-beolin',
      'account/login'         => 'gyejeong/logeu-in',
      'account/logout'        => 'gyejeong/logeu-aus',
      'account/newsletter'    => 'gyejeong/nyuseu-leteo',
      'account/order'         => 'gyejeong/jumun',
      'account/password'      => 'gyejeong/amho',
      'account/register'      => 'gyejeong/deunglog',
      'account/return'        => 'gyejeong/su-ig',
      'account/return/insert' => 'gyejeong/su-ig/chuga',
      'account/reward'        => 'gyejeong/bosang',
      'account/transaction'   => 'gyejeong/geolae',
      'account/voucher'       => 'gyejeong/baucheo',
      'account/wishlist'      => 'gyejeong/wisiliseuteu',
      'information/contact'   => 'jeobchog',
      'information/sitemap'   => 'saiteu-maeb',
      'checkout/checkout'     => 'chekeu-aus',
      'checkout/voucher'      => 'baucheo',
      'product/compare'       => 'bigyohada',
      'product/manufacturer'  => 'jejo-eobche',
      'product/special'       => 'teugbyeol',
      'affiliate/account'     => 'jehyu/gyejeong',
      'affiliate/login'       => 'jehyu/logeu-in',
      'affiliate/logout'      => 'jehyu/logeu-aus',
      'affiliate/edit'        => 'jehyu/pyeonjib',
      'affiliate/forgotten'   => 'jehyu/ij-eo-beolin',
      'affiliate/password'    => 'jehyu/amho',
      'affiliate/register'    => 'jehyu/deunglog',
      'affiliate/tracking'    => 'jehyu/chujeog',
      'affiliate/transaction' => 'jehyu/geolae',
      //'checkout/cart'         => 'jangbaguni',
      //'product/search'        => 'geomsaeg',
    ),

    'jp' => array(
      'account/account'       => 'akaunto',
      'account/address'       => 'akaunto/jusho',
      'account/download'      => 'akaunto/daunrodo',
      'account/edit'          => 'akaunto/henshu',
      'account/forgotten'     => 'akaunto/wasureta',
      'account/login'         => 'akaunto/roguin',
      'account/logout'        => 'akaunto/roguauto',
      'account/newsletter'    => 'akaunto/nyusureta',
      'account/order'         => 'akaunto/chumon',
      'account/password'      => 'akaunto/pasuwado',
      'account/register'      => 'akaunto/toroku',
      'account/return'        => 'akaunto/ritan',
      'account/return/insert' => 'akaunto/ritan/sonyu',
      'account/reward'        => 'akaunto/hoshu',
      'account/transaction'   => 'akaunto/toranzakushon',
      'account/voucher'       => 'akaunto/baucha',
      'account/wishlist'      => 'akaunto/u~isshurisuto',
      'information/contact'   => 'renrakusen',
      'information/sitemap'   => 'saito-mappu',
      'checkout/checkout'     => 'chekkuauto',
      'checkout/voucher'      => 'baucha',
      'product/compare'       => 'hikaku',
      'product/manufacturer'  => 'meka',
      'product/special'       => 'tokubetsu',
      'affiliate/account'     => 'afirieito/akaunto',
      'affiliate/login'       => 'afirieito/roguin',
      'affiliate/logout'      => 'afirieito/roguauto',
      'affiliate/edit'        => 'afirieito/henshu',
      'affiliate/forgotten'   => 'afirieito/wasureta',
      'affiliate/password'    => 'afirieito/pasuwado',
      'affiliate/register'    => 'afirieito/toroku',
      'affiliate/tracking'    => 'afirieito/torakkingu',
      'affiliate/transaction' => 'afirieito/toranzakushon',
      //'checkout/cart'         => 'kato',
      //'product/search'        => 'kensaku',
    ),

    'zh' => array(
      'account/account'       => 'zhanghu',
      'account/address'       => 'zhanghu/dizhi',
      'account/download'      => 'zhanghu/xiazai',
      'account/edit'          => 'zhanghu/bianji',
      'account/forgotten'     => 'zhanghu/wangji',
      'account/login'         => 'zhanghu/denglu',
      'account/logout'        => 'zhanghu/zhuxiao',
      'account/newsletter'    => 'zhanghu/tongxun',
      'account/order'         => 'zhanghu/dingdan',
      'account/password'      => 'zhanghu/mima',
      'account/register'      => 'zhanghu/zhuce',
      'account/return'        => 'zhanghu/tuihuo',
      'account/return/insert' => 'zhanghu/tuihuo/tianjia',
      'account/reward'        => 'zhanghu/jiangli',
      'account/transaction'   => 'zhanghu/jiaoyi',
      'account/voucher'       => 'zhanghu/pingzheng',
      'account/wishlist'      => 'zhanghu/xinyuan',
      'information/contact'   => 'lianxi',
      'information/sitemap'   => 'wangzhan-ditu',
      'checkout/checkout'     => 'tui-fang',
      'checkout/voucher'      => 'daijin-quan',
      'product/compare'       => 'bijiao',
      'product/manufacturer'  => 'zhizao-shang',
      'product/special'       => 'teshu',
      'affiliate/account'     => 'guanlian/zhanghu',
      'affiliate/login'       => 'guanlian/denglu',
      'affiliate/logout'      => 'guanlian/zhuxiao',
      'affiliate/edit'        => 'guanlian/bianji',
      'affiliate/forgotten'   => 'guanlian/wangji',
      'affiliate/password'    => 'guanlian/mima',
      'affiliate/register'    => 'guanlian/zhuce',
      'affiliate/tracking'    => 'guanlian/genzong',
      'affiliate/transaction' => 'guanlian/jiaoyi',
      //'checkout/cart'         => 'gouwu che',
      //'product/search'        => 'sousuo',
    ),

    'my' => array(
      'account/account'       => 'akaun',
      'account/address'       => 'akaun/alamat',
      'account/download'      => 'akaun/muat turun',
      'account/edit'          => 'akaun/edit',
      'account/forgotten'     => 'akaun/dilupakan',
      'account/login'         => 'akaun/login',
      'account/logout'        => 'akaun/logout',
      'account/newsletter'    => 'akaun/surat-berita',
      'account/order'         => 'akaun/kiriman',
      'account/password'      => 'akaun/kata-laluan',
      'account/register'      => 'akaun/daftar',
      'account/return'        => 'akaun/pulangan',
      'account/return/insert' => 'akaun/pulangan/menambah',
      'account/reward'        => 'akaun/ganjaran',
      'account/transaction'   => 'akaun/transaksi',
      'account/voucher'       => 'akaun/baucar',
      'account/wishlist'      => 'akaun/senarai-harapan',
      'information/contact'   => 'kenalan',
      'information/sitemap'   => 'sitemap',
      'checkout/checkout'     => 'checkout',
      'checkout/voucher'      => 'baucar',
      'product/compare'       => 'bandingkan',
      'product/manufacturer'  => 'pengilang',
      'product/special'       => 'khas',
      'affiliate/account'     => 'bergabung/akaun',
      'affiliate/login'       => 'bergabung/login',
      'affiliate/logout'      => 'bergabung/logout',
      'affiliate/edit'        => 'bergabung/edit',
      'affiliate/forgotten'   => 'bergabung/dilupakan',
      'affiliate/password'    => 'bergabung/kata-laluan',
      'affiliate/register'    => 'bergabung/daftar',
      'affiliate/tracking'    => 'bergabung/pengesanan',
      'affiliate/transaction' => 'bergabung/transaksi',
      //'checkout/cart'         => 'troli',
      //'product/search'        => 'carian',
    ),

  );
}