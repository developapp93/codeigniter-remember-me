<?php

/* * ***
 * Version: V1.0.1
 *
 * Description of Auth Controller
 *
 * @author TechArise Team
 *
 * @email  info@techarise.com
 *
 * *** */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Auth extends CI_Controller {

    public function __construct() {
        parent::__construct();
        //load model
        $this->load->model('Auth_model', 'auth');
        $this->load->library('form_validation');
    }
    
    // index method
    public function login() {        
        $data = array();
        $data['metaDescription'] = 'Login';
        $data['metaKeywords'] = 'Login';
        $data['title'] = "Login - TechArise";
        $data['breadcrumbs'] = array('Login' => '#');
        
        $this->load->view('auth/login', $data);
    }
    
    // index method
    public function profile() {        
        $data = array();
        $data['metaDescription'] = 'Profile';
        $data['metaKeywords'] = 'Profile';
        $data['title'] = "Profile - TechArise";
        $data['breadcrumbs'] = array('Profile' => '#');
        $this->load->view('auth/index', $data);
    }

    // action login method
    function doLogin() {        
        // Check form  validation
        $this->load->library('form_validation');
        $this->form_validation->set_rules('user_name', 'User Name', 'trim|required');
        $this->form_validation->set_rules('password', 'Password', 'trim|required');
        if ($this->form_validation->run() == FALSE) {
            //Field validation failed.  User redirected to login page
            $this->login();
        } else {
          $sessArray = array();
            //Field validation succeeded.  Validate against database
            $username = $this->input->post('user_name');
            $password = $this->input->post('password');
            
            $this->auth->setUserName($username);
            $this->auth->setPassword($password);
            //query the database
            $result = $this->auth->login();

            if (!empty($result) && count($result) > 0) {
                foreach ($result as $row) {
                    $authArray = array(
                        'user_id' => $row->user_id,
                        'user_name' => $row->user_name,
                        'email' => $row->email
                    );
                    $this->session->set_userdata('ci_session_key_generate', TRUE);
                    $this->session->set_userdata('ci_seesion_key', $authArray);
                    // remember me
                    if(!empty($this->input->post("remember"))) {
	                    setcookie ("loginId", $username, time()+ (10 * 365 * 24 * 60 * 60));  
	                    setcookie ("loginPass",	$password,	time()+ (10 * 365 * 24 * 60 * 60));
                    } else {
	                    setcookie ("loginId",""); 
	                    setcookie ("loginPass","");
                    }                    
                }
                redirect('auth/profile');
            } else {
                $this->login();
            }
        }
    }
    //logout method
    public function logout() {
        $this->session->unset_userdata('ci_seesion_key');
        $this->session->unset_userdata('ci_session_key_generate');
        $this->session->sess_destroy();
        $this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate, no-transform, max-age=0, post-check=0, pre-check=0");
        $this->output->set_header("Pragma: no-cache");
        redirect('auth/login');
    }   

}

