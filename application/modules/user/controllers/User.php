<?php
defined('BASEPATH') OR exit('No direct script access allowed');




class User extends MX_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('user_model');
		$bool = $this->session->userdata('authorized');
		if($bool != 1)
		{
			//echo $bool; die;
			redirect('admin');
		}
	}
	public function index()
	{
    $users = $this->user_model->get_all_users();
	//echo "<pre>";print_r($users);die;
    $data['users'] =$users;
    $data['page'] ='user_view';
		//$this->template->load('template', 'user_view',$data);
		_layout($data);
	}

	public function get_user_car_details()
	{
		$id = $this->input->get('id');;
		$car_detail = $this->user_model->get_car_details($id);

		$user_personal_detail = $this->user_model->get_user_detai($id);
		$data['personal_detail'] = $user_personal_detail;

		//echo "<pre>";print_r($car_detail);die;
		$data['user_detail'] = $car_detail;
		 $data['page'] ='user_car_view';
		//$this->template->load('template', 'user_view',$data);
		_layout($data);
		//$this->template->load('template', 'user_car_view',$data);
		//echo "<pre>";print_r($car_detail); die;
	}
	public function purchase_history()
	{
		$id= $this->input->get('id');
		$user_id= $this->input->get('u_id');
		$row = $this->user_model->get_purchase_history($id,$user_id);
		$data['purchase_history'] = $row;
		$data['page'] ='purchase_history';
		_layout($data);

		//$this->template->load('template', 'purchase_history',$data);
	}
	public function delete_user()
	{
		$user_id = $this->input->get('id');
		if($user_id)
		{
			$bool = $this->user_model->update_status_as_inactive($user_id);
			if($bool)
			{
				$this->session->set_flashdata('user_deleted','User Deleted Succesfully');
				redirect('user');
			}
			else
			{
				$this->session->set_flashdata('user_deleted','Error In Deletion');
				redirect('user');

			}
		}
		else
		{
			$this->session->set_flashdata('get_error','Id Not Found');
			redirect('user');
		}
	}
	public function excel_export()
	{

		$users = $this->user_model->get_all_users_for_excel();
		//echo $this->db->last_query(); die;
		// echo"<pre>";print_r($users); 
		// // $data[] = array('x'=> 1, 'y'=> 2, 'z'=> 2, 'a'=> 4);
		// header("Content-type: application/csv");
		// header("Content-Disposition: attachment; filename=\"test".".csv\"");
		// header("Pragma: no-cache");
		// header("Expires: 0");

		// $handle = fopen('php://output', 'w');

		// foreach ($users as $data) {
		// fputcsv($handle, $data);
		// }
		// fclose($handle);
		// exit;
		$heading = 'User Report';
		$count = 1;
      header('Content-Type: text/csv; charset=utf-8');
      header('Content-Disposition: attachment; filename=' . $heading . '.csv');
      $output = fopen('php://output', 'w');
      fputcsv($output, array('Sr.no','Date','Name','Phone Number','Email','City','locality','Street','Appt_no','Car Brand','Car Model','Plate No','Color','Package','Status','Amount','Comment'));
		foreach ($users as $key => $value)
		{
			if($value['status']==2)
			{
				$status = "Collected";
			}
			elseif($value['status']==1)
			{
				$status = "Pending";
			}
			else
			{
				$status == "";
			}
		$arr['Sr.no'] = $count;
		$arr['Date'] = $value['created_at'];
		$arr['Name'] = $value['name'];
		$arr['Phone_Number'] = $value['phone_number'];
		$arr['Email'] = $value['email'];
		$arr['City'] = $value['city'];
		$arr['Locality'] = $value['locality'];
		$arr['Street'] = $value['street'];
		$arr['appt_no'] = $value['apartment_number'];
		$arr['Brand'] = $value['brand'];
		$arr['Model'] = $value['model'];
		$arr['Plate_no'] = $value['reg_no'];
		$arr['Color'] = $value['color'];
		$arr['Package'] = $value['package_name'];
		$arr['Payment_Status'] = $status;
		$arr['Amount'] = $value['amount'];
		$arr['Coment'] = "";

		fputcsv($output, $arr);
		$count++;
		}
		fclose($output);
		exit;
	}



	public function filter_function()
	{
		$flag = $this->input->get('flag');
		if($flag==1)
		{
			redirect('user');
		}
		else
		{
			$users = $this->user_model->get_filtered_user($flag);
			$data['users'] =$users;
			$data['page'] ='user_view';
			//$this->template->load('template', 'user_view',$data);
			_layout($data);
		}
	}
}   
  

	

