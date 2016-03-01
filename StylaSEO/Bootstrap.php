<?php
class Shopware_Plugins_Frontend_StylaSEO_Bootstrap extends Shopware_Components_Plugin_Bootstrap {

    protected $_styla_username, $_magazin_basedir;

    public function getCapabilities(){
        return array(
            'install' => true,
            'update' => true,
            'enable' => true
        );
    }

    public function getLabel()
    {
        return 'Styla SEO Enhancements';
    }

    public function getVersion()
    {
        return '1.0.0';
    }


    public function getInfo()
    {
        return array(
            'version' => $this->getVersion(),
            'label' => $this->getLabel(),
            'author' => 'BSolut GmbH',
            'supplier' => 'Styla',
            'description' => 'Generates metadata corresponding to folder structure necessary to support Styla JS embed',
            'copyright' => '',
            'support' => 'Styla',
            'link' => 'http://www.styla.com'
        );
    }


    public function install(){
        $this->createDatabase();
        $this->registerEvents();
        $this->createConfigForm();
        return true;
    }

    protected function createDatabase(){

    }

    protected function createConfigForm(){
        $form = $this->Form();

        // Amazine settings
        $form->setElement('text', 'styla_username', array(
            'label' => 'Amazine/Styla Username',
            'required' => true,
        ));
        $form->setElement('text', 'styla_source_url', array(
            'label' => 'Styla Magazine Source URL',
            'required' => true,
            'value' => 'http://www.amazine.com/',
            'scope' => \Shopware\Models\Config\Element::SCOPE_SHOP
        ));
        $form->setElement('text', 'styla_js_url', array(
            'label' => 'Styla JS Snippet URL',
            'required' => true,
            'value' => 'http://www.amazine.com/',
            'scope' => \Shopware\Models\Config\Element::SCOPE_SHOP
        ));
        $form->setElement('text', 'styla_basedir', array(
            'label' => 'Amazine/Styla Base Folder',
            'required' => true,
            'value' => 'magazin',
            'scope' => \Shopware\Models\Config\Element::SCOPE_SHOP
        ));
    }

    protected function registerEvents(){
        $this->subscribeEvent('Enlight_Controller_Front_PreDispatch', 'onPreDispatch');
        $this->subscribeEvent('Enlight_Controller_Front_PostDispatch', 'onPostDispatch');
        $this->subscribeEvent('Enlight_Controller_Dispatcher_ControllerPath_Frontend_Magazin', 'onGetControllerPathFrontend');
        $this->subscribeEvent('Enlight_Controller_Dispatcher_ControllerPath_Frontend_StylaApi', 'onGetControllerPathFrontend');

        return array(
            'success' => true,
            'invalidateCache' => array('backend')
        );
    }

    public function onPreDispatch(Enlight_Controller_EventArgs $args){

        $request  = $args->getRequest();

        $this->_styla_username = $this->Config()->get('styla_username');
        $this->_magazin_basedir = $this->Config()->get('styla_basedir', 'magazin');

	    if (strpos($request->getRequestUri(), '/'.$this->_magazin_basedir) !== false)
	        $controllerName = 'magazin';
	    else if (strpos($request->getRequestUri(), '/stylaapi') !== false)
	        $controllerName = 'stylaapi';            
        else
	       return;

        if(!$this->_styla_username){
            die('No Amazine Username set in Plugin settings');
        }

        require_once $this->Path() . 'Components/Styla/Utils.php';
        require_once $this->Path() . 'Components/Styla/Curl.php';

        $action = StylaUtils::getActionFromUrl($controllerName);

        $this->registerTemplateDir();

	    $request->setControllerName($controllerName);
            $request->setActionName($action);
        }

    public function onPostDispatch(Enlight_Event_EventArgs $args){

        $action = $args->getSubject();
        $request = $action->Request();
        $response = $action->Response();

        if(!$request->isDispatched()||$response->isException()||$request->getModuleName()!='frontend') {
            return;
        }
    }

    public function onGetControllerPathFrontend(Enlight_Event_EventArgs $args){
        $request  = $args->getRequest();

        if ($request->getRequestUri() == '/'.$this->_magazin_basedir || strpos($request->getRequestUri(), '/'.$this->_magazin_basedir.'/') !== false)
            return $this->Path() . 'Controllers/Frontend/Magazin.php';
        else if ($request->getRequestUri() == '/stylaapi' || strpos($request->getRequestUri(), '/stylaapi/') !== false)
            return $this->Path() . 'Controllers/Frontend/StylaApi.php';
    }

    protected function registerTemplateDir(){
        $this->Application()->Template()->addTemplateDir(
            $this->Path() . 'Views/', 'styla'
        );
    }


}
