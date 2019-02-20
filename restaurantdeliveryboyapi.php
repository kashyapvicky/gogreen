<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
//  echo "ffff";die;
/* ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);*/
 
class restaurantdeliveryboyapi extends MY_Controller {
  public function __construct(){   
    parent::__construct();
    $this->load->model('standard_model');
    $this->load->model('responseconstant');
    $postData =  file_get_contents('php://input');
    if(isset($_POST) && !empty($_POST)){
      $postData = $_POST;
      $postData = (object) $postData;
    }
   if($postData->method == 'updateProfile' || $postData->method == 'updateProfileOptVerify'){
      $postDataArray = $postData;
    }
    else{
      $postDataArray = json_decode($postData);
    }

    if(!empty($postDataArray->method)) {
      $method = $postDataArray->method; 
      if(!empty($postDataArray->app_key)){
        //Verify AppKey
        $checkAppKey = $this->checkAppKey($postDataArray->app_key);
        if (!$checkAppKey) {
          $Code = ResponseConstant::HEADER_UNAUTHORIZED;
          $Message = ResponseConstant::message('HEADER_UNAUTHORIZED');
          $this->sendResponse($Code, $Message); // return data                                 
        }
      }
     else{
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('APPKEY_NOT_FOUND');
        $this->sendResponse($Code, $Message); // return data    
      }
    }
    else{ 
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('METHOD_NOT_FOUND');
      $this->sendResponse($Code, $Message); // return data      
    }

    switch($method){
      case 'restaurant_orders':
      $this->restaurant_orders($postDataArray);
      break;
      case 'logout':
      $this->logout($postDataArray);
      break;
      case 'updateLocation':
      $this->updateLocation($postDataArray);
      break;
      case 'todaysOrders':
      $this->todaysOrders($postDataArray);
      break;
      case 'updateRestaurantStatus':
      $this->updateRestaurantStatus($postDataArray);
      break;
      case 'earning':
      $this->earning($postDataArray);
      break;
      case 'deliveryBoyLogout':
      $this->deliveryBoyLogout($postDataArray);
      break;
      case 'changePassword':
      $this->changePassword($postDataArray);
      break;
      case 'deliveryAssign':
      $this->deliveryAssign($postDataArray);
      break;
      case 'pastOrders':
      $this->pastOrders($postDataArray);
      break;
      case 'deliveryBoyIncentive':
      $this->deliveryBoyIncentive($postDataArray);
      break;
      case 'attendance':
      $this->attendance($postDataArray);
      break;
      case 'liveTask':
      $this->liveTask($postDataArray);
      break;
      case 'assignTask':
      $this->assignTask($postDataArray);
      break;
      case 'orderStatus':
      $this->orderStatus($postDataArray);
      break;
      case 'ownerDashboard':
      $this->ownerDashboard($postDataArray);
      break;
      case 'forgotPassword':
      $this->forgotPassword($postDataArray);
      break;
      case 'updatePassword':
      $this->updatePassword($postDataArray);
      break;
      case 'config':
      $this->config($postDataArray);
      break;
      case 'configDelivery':
      $this->configDelivery($postDataArray);
      break;
      
    }
 }
 function orderStatus($postDataArray){
  //echo "string";die;
  error_reporting(E_ALL);
ini_set('display_errors', 1);
  $order_id = (isset($postDataArray->order_id) && !empty($postDataArray->order_id)) ? $postDataArray->order_id : '';
  $status = (isset($postDataArray->order_status) && !empty($postDataArray->order_status)) ? $postDataArray->order_status : '';
  $d_boy_id= (isset($postDataArray->delivery_boy_id) && !empty($postDataArray->delivery_boy_id)) ? $postDataArray->delivery_boy_id : '';
  $user_id= (isset($postDataArray->user_id) && !empty($postDataArray->user_id)) ? $postDataArray->user_id : '';
 // echo $order_id."---".$status;die;
  if (empty($order_id) || empty($status)) {
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    $this->load->model('user'); 
    $table_dboy ='delivery_boy_details';
    $where = array('id'=>$d_boy_id);
    $column = array('is_deleted');
    $flag = 'd_a';
    $dboy_status = $this->user->getArrayData($table_dboy,$where,$column,$flag);
    /*when delivery boy blocked by admin and try to accept order the this code will run*/
    if($dboy_status->is_deleted=='2'){
      $object = new stdclass();
       $Code = ResponseConstant::BLOCK_BY_ADMIN;
       $Message = ResponseConstant::message('SUCCESS');
       $this->sendResponse($Code, $Message,$object); 
    }
    /*********end*********/
   if($status=='4'){  
     $table = 'assign_delivery';
     $column = array('status'=>$status);
     $where = array('order_id'=>$order_id,'delivery_boy_id'=>$d_boy_id);
     $response = $this->user->update($table,$column,$where);

     $time = date("Y-m-d H:i:s");
     $table = 'orders';
     //echo $restaurant_id;die;
     $column = array('status'=>$status,'food_delivered_time'=>$time);
     $where = array('id'=>$order_id);
     $response = $this->user->update($table,$column,$where);
     /*************Sending push notification*****************/
    //echo $device_token;die;
     /************getting user device token*********/
     //echo "eee".$user_id;die;
      $table ='users';
      $where = array('id'=>$user_id);
      $column = array('device_token');
      $flag = 'd_a';
      $user_token = $this->user->getArrayData($table,$where,$column,$flag);
      /********end*****/
      $title = 'Order Delivered';//order_id
      $token = $user_token->device_token;
     // echo $token;die;
      $body = "Your Order has been delivered. Please click here to submit the review.";
      //$notification = array('title' =>$title , 'text' => $body, 'sound' => 'default', 'badge' => '1','unique_id'=>'3');  
      //echo "<pre>";print_r($notification);die;    
      $next_level = $this->user->sendPush($body,$title,$token);
      if($next_level || $user_token){
        $res['order_status'] = "$status";
        $res['order_id'] = "$order_id";
        $Code = ResponseConstant::SUCCESS;
        $Message = ResponseConstant::message('SUCCELULLY_DELIVERED');
        $this->sendResponse($Code, $Message,$res); // return data 
      }
      else{
        $object = new stdclass();
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('UNSUCCESS');
        $this->sendResponse($Code, $Message,$object); // return data 
      }
      //echo $next_level."dddddddd";die;
    /**********************END*****************************/  
   }

  else{
    $time = date("Y-m-d H:i:s");
    $table = 'orders';
    //echo $restaurant_id;die;
    if($status==1){
     $column = array('status'=>$status,'being_prepared_time'=>$time);
    }
    elseif($status==2){
      $column = array('status'=>$status,'order_collected_time'=>$time);
    }
    elseif($status==3){
      $column = array('status'=>$status,'out_delivery_time'=>$time);
    }

    $where = array('id'=>$order_id);
    $response = $this->user->update($table,$column,$where);
    if($response){
      $res['order_status'] = "$status";
      $res['order_id'] = "$order_id";
      $Code = ResponseConstant::SUCCESS;
       $Message = ResponseConstant::message('STATUS_UPDATED');
       $this->sendResponse($Code, $Message,$res); // return data 
    }
    else{
       $object = new stdclass();
       $Code = ResponseConstant::UNSUCCESS;
       $Message = ResponseConstant::message('FAIL_TO_UPDATE');
       $this->sendResponse($Code, $Message,$object); // return data 
    }
   }
 }

function liveTask($postDataArray){
   $delivery_boy_id = (isset($postDataArray->delivery_boy_id) && !empty($postDataArray->delivery_boy_id)) ? $postDataArray->delivery_boy_id : '';
    $latitude = (isset($postDataArray->latitude) && !empty($postDataArray->latitude)) ? $postDataArray->latitude : '';
    $longitude = (isset($postDataArray->longitude) && !empty($postDataArray->longitude)) ? $postDataArray->longitude : '';
   
        $this->load->model('user');
        $table = 'delivery_boy_details';        
        $column = array('latitude','longitude','is_deleted'); 
        $where = array('id'=>$delivery_boy_id);
        $flag = 'd_a';
        $dboy_loc = $this->user->getArrayData($table,$where,$column,$flag);
        if($dboy_loc->is_deleted=='2'){
         $object = new stdclass();
         $Code = ResponseConstant::BLOCK_BY_ADMIN;
         $Message = ResponseConstant::message('SUCCESS');
         $this->sendResponse($Code, $Message,$object); 
        }
        //echo "<pre>";print_r($dboy_loc);die;
        $table = 'orders';        
        $column = array('lat'=>$dboy_loc->latitude,'long'=>$dboy_loc->longitude,'delivery_boy_id'=>$delivery_boy_id); 
        //$where = array('delivery_boy_id'=>0,'status'=>-1);
        
        $where = '';
        $flag = 'assigned_task_db';
        $assign_task = $this->user->getArrayData($table,$where,$column,$flag);
        //echo "<pre>";print_r($assign_task);die;
        $where = '';
        $flag = 'task_assign';
        $orders_res = $this->user->getArrayData($table,$where,$column,$flag);
      //echo "<pre>order"; print_r($orders_res);die;
        if(!empty($orders_res)){
          $index = 0;
          $index2 = 0;
          foreach ($orders_res as $key => $value) {
            if($value['status']==-1){
                $order_date_time = $value['order_date_time'];
                $order_date_time = explode(' ',$order_date_time);
                //echo"<pre>" ;print_r($order_date_time);die;
                $order_date = $order_date_time[0];
                $order_time = $order_date_time[1];
               // echo $order_date;die;
                $dis = $this->GetDrivingDistance($dboy_loc->latitude,$value['restaurant_latitude'],$dboy_loc->longitude,$value['restaurant_longitude']);
                //echo "<pre>";print_r($dis);die;
                $distance = explode(",",$dis['distance']);
                $distance = $distance[0].".".$distance[1];
                $res['pending_order'][$index]['order_base_id'] = (int)$value['order_id'];
                $res['pending_order'][$index]['order_date'] = $order_date;
                $res['pending_order'][$index]['order_time'] = $order_time;
                $res['pending_order'][$index]['order_status'] = (int)$value['status']; 
                $res['pending_order'][$index]['delivery_address'] = $value['delivery_address'];
                $res['pending_order'][$index]['user_name'] = $value['user_name'];
                $res['pending_order'][$index]['user_phone_no'] = $value['phone_no'];
                $res['pending_order'][$index]['restaurant_name'] = $value['restaurant_name'];
                $res['pending_order'][$index]['resturant_adds'] = $value['resturant_adds'];
                $res['pending_order'][$index]['collect_cash'] = round($value['total_amount']+$value['delivery_charge'] - $value['discount_amount']+$value['total_gst_amount']);
                $res['pending_order'][$index]['total_item'] = (int)$value['total_item'];
                $res['pending_order'][$index]['restaurant_id'] = (int)$value['restaurant_id'];
                $res['pending_order'][$index]['payment_mode'] = $value['payment_mode'];                                            
                $res['pending_order'][$index]['user_latitude'] = $value['latitude'];
                $res['pending_order'][$index]['user_longitude'] = $value['longitude'];
                $res['pending_order'][$index]['restaurant_latitude'] = $value['restaurant_latitude'];
                $res['pending_order'][$index]['restaurant_longitude'] = $value['restaurant_longitude'];
                $res['pending_order'][$index]['user_id'] = (int)$value['user_id'];
                $res['pending_order'][$index]['distance'] = $distance;//.", Time : ".$dis['time'];
                $res['pending_order'][$index]['dis_que'] = number_format($value['distance'],2)." KM";
                $index++;
            }
          }

           $column = array_column($res['pending_order'], 'distance');

          //array_multisort(arr)
           array_multisort( $column, SORT_ASC, $res['pending_order']);
         // arsort($res);
           //$aa = sortBy('distance',   $res, 'desc');
          //echo "<pre>";print_r($res);die;

        }
        else{
           
            $res['pending_order'] = array();
        }

       if(!empty($assign_task)){
            $index2 = 0;
            foreach ($assign_task as $key => $value) {
                $order_date_time = $value['order_date_time'];
                $order_date_time = explode(' ',$order_date_time);
                $order_date = $order_date_time[0];
                $order_time = $order_date_time[1];
                $res['accepted_order'][$index2]['order_base_id'] = (int)$value['order_id'];
                $res['accepted_order'][$index2]['order_date'] = $order_date;
                $res['accepted_order'][$index2]['order_time'] = $order_time;
                $res['accepted_order'][$index2]['order_status'] = (int)$value['status']; 
                $res['accepted_order'][$index2]['delivery_address'] = $value['delivery_address'];
                $res['accepted_order'][$index2]['user_name'] = $value['user_name'];
                $res['accepted_order'][$index2]['user_phone_no'] = $value['phone_no'];
                $res['accepted_order'][$index2]['restaurant_name'] = $value['restaurant_name'];
                $res['accepted_order'][$index2]['resturant_adds'] = $value['resturant_adds'];
                $res['accepted_order'][$index2]['collect_cash'] = round($value['total_amount']+$value['delivery_charge'] - $value['discount_amount']+$value['total_gst_amount']);
                $res['accepted_order'][$index2]['total_item'] = (int)$value['total_item'];
                $res['accepted_order'][$index2]['restaurant_id'] = (int)$value['restaurant_id'];
                $res['accepted_order'][$index2]['payment_mode'] = $value['payment_mode'];                                            
                $res['accepted_order'][$index2]['user_latitude'] = $value['latitude'];
                $res['accepted_order'][$index2]['user_longitude'] = $value['longitude'];
                $res['accepted_order'][$index2]['restaurant_latitude'] = $value['restaurant_latitude'];
                $res['accepted_order'][$index2]['restaurant_longitude'] = $value['restaurant_longitude'];
                $res['accepted_order'][$index2]['user_id'] = (int)$value['user_id'];
                $res['accepted_order'][$index2]['distance'] =""; 
                $res['accepted_order'][$index2]['dis_que'] = number_format($value['distance'],2)." KM";
                $index2++;
            }

       }
      
       else{
          // echo 'elsl';die;
           $res['accepted_order']=array();
        }
        
        if(empty($assign_task) AND empty($orders_res)){
          $res['pending_order'] = array();
             $res['accepted_order']=array();
            $Code = ResponseConstant::UNSUCCESS;
            $Message = ResponseConstant::message('NO_TASK');
            $this->sendResponse($Code, $Message,$res);  
        }
        else{
          //rsort($res);
           $Code = ResponseConstant::SUCCESS;
           $Message = ResponseConstant::message('SUCCESS');
           $this->sendResponse($Code, $Message,$res); 
        }

//            if($index==0){
//              $res['pending_order'] = array();
//             }     
//          //echo $index2;die;
//             if($index2==0){
//                $res['accepted_order']=array();
//              }                    
              // return data 
        //}
         // else{
//            $res['pending_order'] = array();
//             $res['accepted_order']=array();
//            $Code = ResponseConstant::UNSUCCESS;
//            $Message = ResponseConstant::message('NO_TASK');
//            $this->sendResponse($Code, $Message,$res); // return data  
          //}
             //$this->fetchdataforliveTask($delivery_boy_id);
        }

function GetDrivingDistance($lat1, $lat2, $long1, $long2)
           {
           //echo "Lat1  :".$lat1."Lat2  :".$lat2."Long1 :".$long1."long2 :".$long2;
              $url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$lat1.",".$long1."&destinations=".$lat2.",".$long2."&mode=driving&language=pl-PL&key=AIzaSyD96yuqfrhDNBZl4D1tq8L1j8-GSXc6SRU";
             // echo $url;die;
              $ch = curl_init();
              curl_setopt($ch, CURLOPT_URL, $url);
              curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
              curl_setopt($ch, CURLOPT_PROXYPORT, 3128);
              curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
              curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
              $response = curl_exec($ch);
              curl_close($ch);
              //echo "<pre>";print_r($response);die;
              $response_a = json_decode($response, true);
              $dist = $response_a['rows'][0]['elements'][0]['distance']['text'];
              $time = $response_a['rows'][0]['elements'][0]['duration']['text'];

              return array('distance' => $dist, 'time' => $time);
          }
 
 
/* function fetchdataforliveTask($delivery_boy_id)
 {
        $this->load->model('user');
        $table = 'orders';        
        $column = array('id as order_id','restaurant_latitude','restaurant_longitude','restaurant_id','delivery_address','user_name','phone_no','total_amount',
            'delivery_charge','discount_amount','payment_mode','latitude','longitude','restaurant_latitude','restaurant_longitude','user_id'); 
        $where = array('delivery_boy_id'=>$delivery_boy_id ,'status <'=>4);
        $flag = '';
        $orders_res = $this->user->getArrayData($table,$where,$column,$flag);
       // echo "<pre>ccc"; print_r($orders_res); die;
        if(!empty($orders_res)){
                $value = $orders_res[0];
                 //get status (task_status) form assign_delivery table
                $table = 'resturant';
                $column = array('resturant_name','resturant_adds');
                $where = array('id'=>$value['restaurant_id']);
                $flag = '';
                $resturant_res = $this->user->getArrayData($table,$where,$column,$flag);
//echo "<pre>ccc"; print_r($resturant_res); die;
                // get item count form ordes_item
                $table = 'ordes_item';
                $column = array('count(order_base_id) as total_item');
                $where = array('order_base_id'=>$value['order_id']);
                $flag = '';
                $order_item_res = $this->user->getArrayData($table,$where,$column,$flag);
//                getting order status from ordre table
                 $table = 'orders';
                $column = array('status');
                $where = array('id'=>$value['order_id']);
                $flag = '';
                $order_status_data = $this->user->getArrayData($table,$where,$column,$flag);
                $order_status = $order_status_data[0]['status'];
                 $res['order_status'] = "$order_status"; 
                $res['task_status'] = "1"; 
                $res['order_base_id'] = $value['order_id'];
                $res['order_id'] = $value['order_id'];
                $res['delivery_address'] = $value['delivery_address'];
                $res['user_name'] = $value['user_name'];
                $res['user_phone_no'] = $value['phone_no'];
                $res['restaurant_name'] = $resturant_res[0]['resturant_name'];
                $res['resturant_adds'] = $resturant_res[0]['resturant_adds'];
                $res['collect_cash'] = $value['total_amount']+$value['delivery_charge'] - $value['discount_amount'];
                $res['total_item'] = $order_item_res[0]['total_item'];
                $res['restaurant_id'] = $value['restaurant_id'];
                $res['payment_mode'] = $value['payment_mode'];                                            
                $res['user_latitude'] = $value['latitude'];
                $res['user_longitude'] = $value['longitude'];
                $res['restaurant_latitude'] = $value['restaurant_latitude'];
                $res['restaurant_longitude'] = $value['restaurant_longitude'];
                $res['user_id'] = $value['user_id'];
                                         
              $Code = ResponseConstant::SUCCESS;
              $Message = ResponseConstant::message('SUCCESS');
              $this->sendResponse($Code, $Message,$res); // return data 
                       
        }
        else{
            $object = new stdclass();
            $Code = ResponseConstant::UNSUCCESS;
            $Message = ResponseConstant::message('NO_TASK');
            $this->sendResponse($Code, $Message,$object); // return data  
        }
 }*/
 function assignTask($postDataArray){
  $delivery_boy_id = (isset($postDataArray->delivery_boy_id) && !empty($postDataArray->delivery_boy_id)) ? $postDataArray->delivery_boy_id : '';
  $order_id = (isset($postDataArray->order_id) && !empty($postDataArray->order_id)) ? $postDataArray->order_id : '';
   $this->load->model('user');
   //echo "dd";die;
   //echo $order_id."----".$delivery_boy_id;die;
    if (empty($delivery_boy_id) || empty($order_id)) {
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    $this->load->model('user');

      $table_dboy ='delivery_boy_details';
      $where = array('id'=>$delivery_boy_id);
      $column = array('is_deleted');
      $flag = 'd_a';
      $dboy_status = $this->user->getArrayData($table_dboy,$where,$column,$flag);
      /*when delivery boy blocked by admin and try to accept order the this code will run*/
      if($dboy_status->is_deleted=='2'){
        $object = new stdclass();
        $Code = ResponseConstant::BLOCK_BY_ADMIN;
        $Message = ResponseConstant::message('SUCCESS');
        $this->sendResponse($Code, $Message,$object); 
      }

    $table = 'orders';
    $accepted_orders = $this->user->countOrders($table,$delivery_boy_id);
    //echo "<pre>";print_r($accepted_orders);die;
    if($accepted_orders->total_accepted_orders==5){
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('exced_limit');
      $this->sendResponse($Code, $Message,$object);
    }
    $column = array('id');
    $where = array('status'=>-1,'delivery_boy_id'=>0);
    $flag = 'd_a';
    $pending_order = $this->user->getArrayData($table,$where,$column,$flag);
    //echo "<pre>";print_r($pending_order);die;
    if($pending_order){
      /*to prevent confliction during accept insert in assign_delivery table where */
      $table = 'assign_delivery';
      $column = array('id');
      $where = array('order_id'=>$order_id,);
      $flag = 'd_a';
      $order_id_exist = $this->user->getArrayData($table,$where,$column,$flag);
      if($order_id_exist){
         $object = new stdclass();
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('already_assigned');
        $this->sendResponse($Code, $Message,$object);
      }
      $column = array('order_id'=>$order_id,'delivery_boy_id'=>$delivery_boy_id,'status'=>2);
      $where = array('id'=>$order_id); 
      $inserted = $this->user->insert($table,$column);   
      if($inserted){   
        /*getting delivery boy incentive*/  
        $table = 'delivery_boy_details';
        $column = array('incentive');
        $where = array('id'=>$delivery_boy_id);
        $flag = 'd_a';
        $dboy_incentive = $this->user->getArrayData($table,$where,$column,$flag);
        $incentive = $dboy_incentive->incentive;
        //echo "<pre>";print_r($dboy_incentive);die;
        $date_time = date("Y-m-d H:i:s");
        $table = 'orders';
        $column = array('delivery_boy_id'=>$delivery_boy_id,'delivery_boy_commission'=>$incentive,'status'=>0,
          'order_accept_time'=>$date_time);
        $where = array('id'=>$order_id);
        $response = $this->user->update($table,$column,$where);
        $object = new stdclass();
        $Code = ResponseConstant::SUCCESS;
        $Message = ResponseConstant::message(SUCCESS);
        $this->sendResponse($Code, $Message,$object);
      }
      else{
        $object = new stdclass();
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('already_assigned');
        $this->sendResponse($Code, $Message,$object);
      }
    }
    else{
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('already_assigned');
      $this->sendResponse($Code, $Message,$object);
    }

 }
 
 function attendance($postDataArray){
   $delivery_boy_id = (isset($postDataArray->delivery_boy_id) && !empty($postDataArray->delivery_boy_id)) ? $postDataArray->delivery_boy_id : '';
   $month = (isset($postDataArray->month) && !empty($postDataArray->month)) ? $postDataArray->month : '';
   $year = (isset($postDataArray->year) && !empty($postDataArray->year)) ? $postDataArray->year : '';
   $page = (isset($postDataArray->page) && !empty($postDataArray->page)) ? $postDataArray->page : 0;
   $this->load->model('user');
   $date = $year."-".$month;
   $attendance = $this->user->getAttendence($delivery_boy_id,$date,$page);
   //echo "<pre>";print_r($attendance);die;
    if(!empty($attendance[0]['logine_time'])){
     foreach ($attendance as $key => $value) {
      if(!empty($value['logout_date'])){

       $working_hour = abs(floor((strtotime($value['logout_date'])-strtotime($value['logine_time']))/3600));
       $working_minute = abs(floor(((strtotime($value['logout_date'])-strtotime($value['logine_time']))/60)%60));
       $totoal_working_hour[] = strtotime($value['logout_date'])-strtotime($value['logine_time']);
      }
      else{
         $value22['logout_date'] = date('Y-m-d H:i:s');
         $working_hour = abs(floor((strtotime($value22['logout_date'])-strtotime($value['logine_time']))/3600));
         $working_minute = abs(floor(((strtotime($value22['logout_date'])-strtotime($value['logine_time']))/60)%60));
         $totoal_working_hour[] = strtotime($value22['logout_date'])-strtotime($value['logine_time']);
      }
      //echo "<pre>";print_r($value);
       //echo $working_hour;
        $total_working_hour = floor(array_sum($totoal_working_hour)/3600);
        $total_working_minute = floor((array_sum($totoal_working_hour)/60)%60);
       if(empty($value['no_of_delivery'])){
         $no_of_delivery = 0;
       }
       else{
         $no_of_delivery = $value['no_of_delivery'];
       }
        $dt = explode(' ', $value['logine_time']);
        $date = $dt[0];
        $login_time = $dt[1];
        if(empty($value['logout_date'])){
         // echo "<pre>";print_r($value);die;
          $logout_dt = " ";
        }
        else{
          $logout_dt = explode(' ', $value['logout_date']);
          $logout_dt =  $logout_dt[1];
        }

       $res['login_time'][$key]['order_base_id'] = $value['id'];
       $res['login_time'][$key]['login_time'] = "$login_time";
       $res['login_time'][$key]['logout_time'] = "$logout_dt";
       $res['login_time'][$key]['date'] = "$date";
       $res['login_time'][$key]['no_of_delivery'] = "$no_of_delivery";
       $res['login_time'][$key]['working_time'] = "$working_hour "."Hrs :"."$working_minute "."Min";
     }
     //die;
     $res['total_working_hour'] = $total_working_hour ." Hrs " .$total_working_minute ." Min";
    // echo $total_working_minute;die;
     $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data
   }
   else{

         $res['login_time'] = array();
           $res['total_working_hour'] =   "00 Hrs 00 Min";;
        

     $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('NO_RECORDS');
      $this->sendResponse($Code, $Message,$res); // return data
   }
 }


  function restaurant_orders($postDataArray){
   $restaurant_id = (isset($postDataArray->restaurant_id) && !empty($postDataArray->restaurant_id)) ? $postDataArray->restaurant_id : '';
   $date_from = (isset($postDataArray->date_from) && !empty($postDataArray->date_from)) ? $postDataArray->date_from : '';
   $date_upto = (isset($postDataArray->date_upto) && !empty($postDataArray->date_upto)) ? $postDataArray->date_upto : '';
   $page = (isset($postDataArray->page) && !empty($postDataArray->page)) ? $postDataArray->page : '';
   $this->load->model('user');
   //echo "dd";die;
    if (empty($restaurant_id)) {
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
   $table ='orders';
  
   if(empty($date_from) || empty($date_upto)){
     $where = array('restaurant_id'=>$restaurant_id,'status ='=>4);
   }
   else{
      if($date_from==$date_upto){
        $where = array('restaurant_id'=>$restaurant_id,'order_date_time LIKE'=>$date_from."%",'status ='=>4); 
      }
      else{
        //echo "string";
        $date_from = $date_from." 00:00:00";
        $date_upto = $date_upto." 59:59:59";
        $where = array('restaurant_id'=>$restaurant_id,'order_date_time >='=>$date_from,'order_date_time <='=> $date_upto,'status ='=>4);     
      }   
   }
   $column = array('id','order_id','total_amount','discount_percent','order_date_time','delivery_address');
   $flag = 'order_past';
   $restaurant_details = $this->user->getArrayData($table,$where,$column,$flag);
    //echo "<pre>";print_r($restaurant_details);die;
   foreach ($restaurant_details as $key => $value) {
     $order_timing = explode(' ',$value['order_date_time']);
     $order_date = $order_timing[0];
     $order_time = $order_timing[1];
     $res['orders'][$key]['order_base_id'] = $value['id'];
     $res['orders'][$key]['order_id'] = $value['id'];
     $res['orders'][$key]['total_amount'] = $value['total_amount'];
     $res['orders'][$key]['discount_percent'] = $value['discount_percent'];
     $res['orders'][$key]['order_date'] = "$order_date";
     $res['orders'][$key]['order_time'] = "$order_time";
     $res['orders'][$key]['delivery_address'] = $value['delivery_address'];
     $res['orders'][$key]['delivery_address'] = $value['delivery_address'];
     $table ='ordes_item';
     $where = array('order_base_id'=>$value['id']);
     $column = array('item_name','price','item_quantity','item_varient');
     $flag = 'o_t';
     $restaurant_items = $this->user->getArrayData($table,$where,$column,$flag);
     if($restaurant_items){
       foreach ($restaurant_items as $key1 => $value){
         $res['orders'][$key]['varient'][$key1]['item_name'] = $value['item_name'];
         $res['orders'][$key]['varient'][$key1]['price'] = $value['price'];
         $res['orders'][$key]['varient'][$key1]['item_quantity'] = $value['item_quantity'];
         $res['orders'][$key]['varient'][$key1]['item_varient'] = $value['item_varient'];
         $res['orders'][$key]['varient'][$key1]['total_varient_price'] = $value['price']*$value['item_quantity'];
        }
      }
   }
   if($restaurant_details){
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data
   }
   else{
     // $object = new stdclass();
      $res['orders'] = [];
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('NO_PAST_ORDER');
      $this->sendResponse($Code, $Message,$res); // return data
   }
  }

  function logout($postDataArray){
    //echo "<pre>";print_r($postDataArray);die;
   $id = (isset($postDataArray->id) && !empty($postDataArray->id)) ? $postDataArray->id : '';
   $type = (isset($postDataArray->type) && !empty($postDataArray->type)) ? $postDataArray->type : '';
   $delivery_boy_id = (isset($postDataArray->delivery_boy_id) && !empty($postDataArray->delivery_boy_id)) ? $postDataArray->delivery_boy_id : '';
    $attendance_id = (isset($postDataArray->attendance_id) && !empty($postDataArray->attendance_id)) ? $postDataArray->attendance_id : '';
   //echo $status;die;
   if (empty($type)) {
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message); // return data
    }
   $this->load->model('user');
   if($type=='res'){  
     $table = 'resturant';
     $column = array('resturant_status'=>2);
     //echo $id;die;
     $where = array('id'=>$id);
     $response = $this->user->update($table,$column,$where);
     //echo $response;die;
     if($response){
       $Code = ResponseConstant::SUCCESS;
        $Message = ResponseConstant::message('LOGOUT_SUCCESS');
        $this->sendResponse($Code, $Message,$res); // return data
     }
     else{
       $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('FAIL_TO_LOGOUT');
        $this->sendResponse($Code, $Message,$res); // return data
     }
   }
   elseif($type == 'del'){
    //echo "dddd";die;
    //$date = date('Y-m-d :H:i');
    /*if a task assign to d boy but didnot decline or accept and logout*/
    $table ='orders';
    $where = array('delivery_boy_id'=>$id,'status'=>-1);
    $column = array('id');
    $flag = 'o_t';
    $dboy_task = $this->user->getArrayData($table,$where,$column,$flag);
    //echo "<pre>";print_r($dboy_task);die;
    if($dboy_task){
      $table = 'orders';
      $column = array('delivery_boy_id'=>0);
      $where = array('delivery_boy_id'=>$id,'status'=>-1);
      $removedboy = $this->user->update($table,$column,$where);
      $table = 'assign_delivery';
      $where = array('delivery_boy_id'=>$id,'order_id'=>$dboy_task[0]['id'],'status'=>1);
       $flag = 'd_d_a';
      $result = $this->user->Delete($where,$table,$flag);
      $table = 'decline_reason';
        $date_time = date('Y-m-d h:i');
        $reasion = 'Logout Without any action (Accept/Decline)';
       $column = array('order_id'=>$dboy_task[0]['id'],'delivery_boy_id'=>$id,'reason'=>$reasion,'decline_time'=>$date_time);
      /************updating delivery boy id in orders table after decline by other d boy *****/
      $decline_response = $this->user->insert($table,$column);
    }
   //echo "ddd";die;
    $table = 'delivery_boy_details';
    $column = array('online_status'=>2,'latitude'=>'0','longitude'=>'0','battery_status'=>'0');
    //echo $restaurant_id;die;
    $where = array('id'=>$id);
    $response = $this->user->update($table,$column,$where); 
    if($response){
      $table = 'attendance';
      $time = date("Y-m-d H:i:s");
      $column = array('logout_date'=>$time);
      $where = array('delivery_boy_id'=>$id,'id'=>$attendance_id);
      $this->user->update($table,$column,$where);
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('LOGOUT_SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data
    }
    else{
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('FAIL_TO_LOGOUT');
      $this->sendResponse($Code, $Message,$res); // return data
    }
   }
  }
  function updateLocation($postDataArray){
    $restaurant_id = (isset($postDataArray->restaurant_id) && !empty($postDataArray->restaurant_id)) ? $postDataArray->restaurant_id : '';
    $latitude = (isset($postDataArray->latitude) && !empty($postDataArray->latitude)) ? $postDataArray->latitude : '';
    $longitude = (isset($postDataArray->longitude) && !empty($postDataArray->longitude)) ? $postDataArray->longitude : '';
    if (empty($restaurant_id) || empty($latitude) || empty($longitude)) {
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message); // return data
    }
   $this->load->model('user');
   $table = 'resturant';
   $column = array('lat'=>$latitude,'lang'=>$longitude);
   //echo $restaurant_id;die;
   $where = array('id'=>$restaurant_id);
   $response = $this->user->update($table,$column,$where); 
   if($response){
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('LOCATION_UPDATED');
      $this->sendResponse($Code, $Message,$res); // return data
   }
   else{
     $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('FAIL_TO_UPDATE');
      $this->sendResponse($Code, $Message,$res); // return data
   }
  }
  function todaysOrders($postDataArray){
   $restaurant_id = (isset($postDataArray->restaurant_id) && !empty($postDataArray->restaurant_id)) ? $postDataArray->restaurant_id : '';
    if(empty($restaurant_id)) {
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    $this->load->model('user');
    $date = date('Y-m-d');
    $table = 'orders o';
    $flag = 'r_o';
    $column = 'o.id,o.order_id,o.total_amount,o.order_date_time,
    count(o_t.item_name) as total_items,o.status';
    //$where = array('o.restaurant_id'=>$restaurant_id,'o.order_date_time LIKE'=>$date."%",'o.status <'=>'4');
    $where = array('o.restaurant_id'=>$restaurant_id,'o.status <'=>'4');
    $todays_orders = $this->user->getJoinData($table,$column,$flag,$where,$page);
    //echo "<pre>";print_r($todays_orders);die;
    if($todays_orders){
      foreach ($todays_orders as $key => $value) {
        $order_timing = explode(' ',$value['order_date_time']);
        $order_date = $order_timing[0];
        $order_time = $order_timing[1];
        $res['orders'][$key]['order_base_id'] = $value['id'];
        $res['orders'][$key]['order_id'] = $value['id'];
        $res['orders'][$key]['total_amount'] = $value['total_amount'];
        $res['orders'][$key]['order_date'] = "$order_date";
        $res['orders'][$key]['order_time'] = "$order_time";
        $res['orders'][$key]['total_items'] = $value['total_items'];
        $res['orders'][$key]['delivery_time'] = "20Minute";
        $res['orders'][$key]['order_status'] = $value['status'];
      }
     $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data 
    }
    else{
      $res['orders'] = [];
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('NO_ORDERS');
      $this->sendResponse($Code, $Message,$res); // return data 
    }
  }
  function updateRestaurantStatus($postDataArray){
    $restaurant_id = (isset($postDataArray->restaurant_id) && !empty($postDataArray->restaurant_id)) ? $postDataArray->restaurant_id : '';
    $status = (isset($postDataArray->restaurant_status) && !empty($postDataArray->restaurant_status)) ? $postDataArray->restaurant_status : '';
    if(empty($restaurant_id) || empty($status)) {
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message); // return data
    }
    $this->load->model('user');
    $table = 'resturant';
    $column = array('resturant_status'=>$status,'resturant_status'=>$status);
    //echo $restaurant_id;die;
    $where = array('id'=>$restaurant_id);
    $response = $this->user->update($table,$column,$where);
    if($status=='1'){
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('RESTAURANT_ONLINE');
      $this->sendResponse($Code, $Message,$res); // return data 
    }
    else{
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('RESTAURANT_OFFLINE');
      $this->sendResponse($Code, $Message,$res); // return data
    }
  }
  function earning($postDataArray){
    $restaurant_id = (isset($postDataArray->restaurant_id) && !empty($postDataArray->restaurant_id)) ? $postDataArray->restaurant_id : '';
    $date_from = (isset($postDataArray->date_from) && !empty($postDataArray->date_from)) ? $postDataArray->date_from : '';
    $date_upto = (isset($postDataArray->date_upto) && !empty($postDataArray->date_upto)) ? $postDataArray->date_upto : '';
    if(empty($restaurant_id)) {
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    //echo $date_from;die;
   $this->load->model('user');
   $table ='orders';
   if(empty($date_from) || empty($date_upto)){
     $date = date('Y-m');
     $where = array('restaurant_id'=>$restaurant_id,'order_date_time LIKE'=>$date."%",'status ='=>4);
   }
   else{
    
    if($date_from==$date_upto){
      
      $where = array('restaurant_id'=>$restaurant_id,'order_date_time LIKE'=> $date_from."%",'status ='=>4);
    }
    else{
      $date_from = $date_from." 00:00:00";
      $date_upto = $date_upto." 59:59:59";
      $where = array('restaurant_id'=>$restaurant_id,'order_date_time >='=>$date_from,'order_date_time <='=> $date_upto,'status ='=>4);
    }
   }
   $column = array('id','order_id','total_amount','order_date_time','menos_commission','total_gst_amount','packaging');
   $flag = 'earning_d_boy';
   $earning_details = $this->user->getArrayData($table,$where,$column,$flag);
   //echo "<pre>";print_r($restaurant_details);die;
   if($earning_details){
     foreach ($earning_details as $key => $value) {
       // $earning = $value['total_amount']* $value['menos_commission']/100;
//        $menos_ammount_wi_gst = $value['total_amount']-$value['total_gst_amount'];
//        $menos_ammount = ($menos_ammount_wi_gst*$value['menos_commission'])/100;
//        $earning = $menos_ammount_wi_gst-$menos_ammount+$value['total_gst_amount'];
        
        
        $earning = $value['total_amount']-(($value['total_amount']*$value['menos_commission'])/100)+$value['total_gst_amount']+$value['packaging'];
        
        $order_timing = explode(' ',$value['order_date_time']);
        $order_date = $order_timing[0];
        $order_time = $order_timing[1];
        $amount[] = $earning;
        $res['orders'][$key]['order_base_id'] = $value['id'];
        $res['orders'][$key]['order_id'] = $value['id'];
        $res['orders'][$key]['total_amount'] = $value['total_amount'];
        $res['orders'][$key]['order_date'] = "$order_date";
        $res['orders'][$key]['order_time'] = "$order_time";
        $res['orders'][$key]['menos_margin'] = $value['menos_commission'];
        $res['orders'][$key]['earning'] = $earning;
     }
     $total_earning = array_sum($amount);
     $res['total_earning'] = "$total_earning";
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data 
    }
    else{
      $res['orders'] = [];
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('NO_ORDERS');
      $this->sendResponse($Code, $Message,$res); // return data
    }
  }

  function changePassword($postDataArray){
    //echo "<pre>";print_r($postDataArray);die;
    $id = (isset($postDataArray->id) && !empty($postDataArray->id)) ? $postDataArray->id : '';
    $oldPassword = (isset($postDataArray->oldPassword) && !empty($postDataArray->oldPassword)) ? $postDataArray->oldPassword : '';
    $newPassword = (isset($postDataArray->newPassword) && !empty($postDataArray->newPassword)) ? $postDataArray->newPassword : '';
    $user_statu = (isset($postDataArray->user_status) && !empty($postDataArray->user_status)) ? $postDataArray->user_status : '';
    $oldPasswordmd5 = md5($oldPassword);
    $newPasswordmd5 = md5($newPassword);
    //echo $oldPassword ."--".$newPassword."---".$dboy_id;die;
    if(empty($id) || empty($oldPassword) || empty($newPassword)){
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message); // return data
    }
    if($user_statu=='del'){ 
      $this->load->model('user');
      $table = 'delivery_boy_details';
      $where = array('id'=>$id,'password'=>$oldPasswordmd5);
      $column = array('id');
      $flag = 'o_t';
      $d_boy_details = $this->user->getArrayData($table,$where,$column,$flag);
      //echo "<pre>";print_r($d_boy_details);die;
      if($d_boy_details){
        $column =array('password'=>$newPasswordmd5);
        $response = $this->user->update($table,$column,$where);
        $Code = ResponseConstant::SUCCESS;
        $Message = ResponseConstant::message('password updated');
        $this->sendResponse($Code, $Message); // return data
      }
      else{
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('INVALID_OLD_PSWD');
        $this->sendResponse($Code, $Message); // return data
      }
    }
    elseif($user_statu=='res'){
      $this->load->model('user');
      $table = 'resturant';
      $where = array('id'=>$id,'password'=>$oldPasswordmd5);
      $column = array('id');
      $flag = 'o_t';
      $d_boy_details = $this->user->getArrayData($table,$where,$column,$flag);
      //echo "<pre>";print_r($d_boy_details);die;
      if($d_boy_details){
        $column =array('password'=>$newPasswordmd5);
        $response = $this->user->update($table,$column,$where);
        $Code = ResponseConstant::SUCCESS;
        $Message = ResponseConstant::message('password updated');
        $this->sendResponse($Code, $Message); // return data
      }
      else{
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('INVALID_OLD_PSWD');
        $this->sendResponse($Code, $Message); // return data
      }
    }
  }
  /*function deliveryAssign($postDataArray){
    $restaurant_id = (isset($postDataArray->restaurant_id) && !empty($postDataArray->restaurant_id)) ? $postDataArray->restaurant_id : '';
    $order_id = (isset($postDataArray->order_id) && !empty($postDataArray->order_id)) ? $postDataArray->order_id : '';
    $reasion = (isset($postDataArray->reason) && !empty($postDataArray->reason)) ? $postDataArray->reason : '';
    $status = (isset($postDataArray->status) && !empty($postDataArray->status)) ? $postDataArray->status : '';
    $delivery_boy_id = (isset($postDataArray->delivery_boy_id) && !empty($postDataArray->delivery_boy_id)) ? $postDataArray->delivery_boy_id : '';
    if(empty($restaurant_id) || empty($order_id)){
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message);
    }
    $this->load->model('user');
    if($status == '1'){
     $table = 'assign_delivery';
     $column = array('status'=>'2');
     $where = array('delivery_boy_id'=>$delivery_boy_id,'order_id'=>$order_id);
     $response = $this->user->update($table,$column,$where);
      $table ='delivery_boy_details';
      $where = array('id'=>$delivery_boy_id);
      $column = array('incentive');
      $flag = 'd_a';
      $restaurant_details = $this->user->getArrayData($table,$where,$column,$flag);
      $commission_d_boy = $restaurant_details->incentive;
      if(empty($commission_d_boy)){
        $commission_d_boy = 0;
      }
     
     $table = 'orders';
     $column = array('delivery_boy_id'=>$delivery_boy_id,'delivery_boy_commission'=>$commission_d_boy,'status'=>0);
     $where = array('id'=>$order_id);
     $this->user->update($table,$column,$where); 
     if($response){
       $res['order_status'] = "0";
       $res['task_status'] = "2";
       $Code = ResponseConstant::SUCCESS;
       $Message = ResponseConstant::message('SUCCESS');
       $this->sendResponse($Code, $Message,$res); // return data 
     }
    }


    else{
   
      $table = 'assign_delivery';
      $column = array('status'=>'3');
    
      $where = array('delivery_boy_id'=>$delivery_boy_id,'order_id'=>$order_id);
      $response = $this->user->update($table,$column,$where);
     

      $table = 'orders';
      $column = array('delivery_boy_id'=>0);

      $where = array('id'=>$order_id);
      $updatedboyid = $this->user->update($table,$column,$where);
  
        $table = 'decline_reason';
        $date_time = date('Y-m-d h:i');
       $column = array('order_id'=>$order_id,'delivery_boy_id'=>$delivery_boy_id,'reason'=>$reasion,'decline_time'=>$date_time);
      $decline_response = $this->user->insert($table,$column);
      if($response){
        $res['order_status'] = "0";
        $res['task_status'] = "3";
        $Code = ResponseConstant::SUCCESS;
        $Message = ResponseConstant::message('SUCCESS');
        $this->sendResponse($Code, $Message,$res);
      }
    }
  }*/
  function pastOrders($postDataArray){
   $date_from = (isset($postDataArray->date_from) && !empty($postDataArray->date_from)) ? $postDataArray->date_from : ''; 
   $date_to = (isset($postDataArray->date_to) && !empty($postDataArray->date_to)) ? $postDataArray->date_to : ''; 
   $delivery_boy_id = (isset($postDataArray->delivery_boy_id) && !empty($postDataArray->delivery_boy_id)) ? $postDataArray->delivery_boy_id : ''; 
   $page = (isset($postDataArray->page) && !empty($postDataArray->page)) ? $postDataArray->page : ''; 
  // echo $date_to."----".$date_to;die;
   if(empty($delivery_boy_id)){
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    $this->load->model('user');
    $table = 'orders';
    $flag = 'p_o';
    $column = array('id','order_id','delivery_address','restaurant_name','status','order_date_time');
    if(!empty($date_to) && !empty($date_from)){
      if($date_to==$date_from){
        $where = array('delivery_boy_id'=>$delivery_boy_id,'order_date_time LIKE'=>$date_to."%",'status ='=>4);
      }
      else{ 
        $date_from = $date_from." 00:00:00";
        $date_to = $date_to." 59:59:59";
        $where = array('delivery_boy_id'=>$delivery_boy_id,'order_date_time >='=>$date_from,'order_date_time <='=> $date_to,
       'status ='=>4);
      }
    }

    else{
      $date = date('Y-m-d');
      $where = array('delivery_boy_id'=>$delivery_boy_id,'order_date_time LIKE'=>$date."%",'status ='=>4);    
    }
    $result = $this->user->getArrayData($table,$where,$column,$flag);
    //echo "<pre>";print_r($result);die;
    if($result){
      foreach ($result as $key => $value) {
        $order_timing = explode(' ',$value['order_date_time']);
        $order_date = $order_timing[0];
        $order_time = $order_timing[1];
        $res['collected_orders'][$key]['order_base_id'] = $value['id'];
        $res['collected_orders'][$key]['order_id'] = $value['id'];
        $res['collected_orders'][$key]['delivery_address'] = $value['delivery_address'];
        $res['collected_orders'][$key]['restaurant_name'] = $value['restaurant_name'];
        $res['collected_orders'][$key]['delivered_time'] = "$order_time";
        $res['collected_orders'][$key]['delivered_date'] = "$order_date";
        $res['collected_orders'][$key]['status'] = $value['status'];
      }
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data 
    }
    else{
      //$object = new stdclass();
      $res['collected_orders'] = [];
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('NO_ORDER_DELIVERED');
      $this->sendResponse($Code, $Message,$res); // return data
    }
  }
  function deliveryBoyIncentive($postDataArray){
    $month = (isset($postDataArray->month) && !empty($postDataArray->month)) ? $postDataArray->month : '';
    $year = (isset($postDataArray->year) && !empty($postDataArray->year)) ? $postDataArray->year : '';
    $delivery_boy_id = (isset($postDataArray->delivery_boy_id) && !empty($postDataArray->delivery_boy_id)) ? $postDataArray->delivery_boy_id : '';
    $page = (isset($postDataArray->page) && !empty($postDataArray->page)) ? $postDataArray->page : '';
    if(empty($delivery_boy_id)){
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    $this->load->model('user');
    $table = 'orders o';
    $date = $year."-".$month;
    $flag = 'd_i';
    $column = 'o.id,o.order_id,o.order_date_time,o.delivery_boy_commission,d_d.basic_salary,sum(o.delivery_boy_commission) as total_incentive';
    if(!empty($month) || !empty($year)){
      $where = array('delivery_boy_id'=>$delivery_boy_id,'order_date_time LIKE'=>$date."%",'o.status !='=>'5');
    }
    else{
      $date = date('Y-m');
      $where = array('delivery_boy_id'=>$delivery_boy_id,'order_date_time LIKE'=>$date."%",'o.status !='=>'5');    
    }
    $response = $this->user->getJoinData($table,$column,$flag,$where);
   //echo "<pre>";print_r($response);die;
    if($response){
      foreach ($response as $key => $value) {
        $order_timing = explode(' ',$value['order_date_time']);
        $order_date = $order_timing[0];
        $order_time = $order_timing[1];
        $res['basic_salary'] = $value['basic_salary'];
        $res['total_incentive'] = $value['total_incentive']+$res['total_incentive'];
        $res['delivered_orders'][$key]['order_base_id'] = $value['id'];
        $res['delivered_orders'][$key]['order_id'] = $value['id'];
        $res['delivered_orders'][$key]['order_date'] = "$order_date";
        $res['delivered_orders'][$key]['order_time'] = "$order_time";
        $res['delivered_orders'][$key]['incentive'] = $value['delivery_boy_commission'];
      }
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data 
    }
    else{
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('NO_ORDER_DELIVERED');
      $this->sendResponse($Code, $Message,$object); // return data 
    }
  }
  function ownerDashboard($postDataArray){
    $restaurant_id = (isset($postDataArray->restaurant_id) && !empty($postDataArray->restaurant_id)) ? $postDataArray->restaurant_id : '';
    $year = (isset($postDataArray->year) && !empty($postDataArray->year)) ? $postDataArray->year : '';
    $month = (isset($postDataArray->month) && !empty($postDataArray->month)) ? $postDataArray->month : '';
    if(empty($restaurant_id)){
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    $this->load->model('user');
     $column = array('id'=>$restaurant_id, 'table'=>'resturant','left_table'=> 'orders');
     $flag = 'login_d_o';
     $date = $year."-".$month;
      if(empty($year) || empty($month)){
        $date = date('Y-m-d');
      }
     $response_data = $this->user->getDashboardData($flag,$column,$date);
   // echo "<pre>";print_r($response_data);die;
      /*getting delivered orderes*/
      $date = $year."-".$month;
      if(empty($year) || empty($month)){
        $date = date('Y-m');
      }
      /*$table = 'orders';
      $where = array('restaurant_id'=>$restaurant_id,'status !='=>5,'order_date_time LIKE'=>$date."%");
      $flag = 'o_t';
      $column = array('status');
      $status_data = $this->user->getArrayData($table,$where,$column,$flag);
     echo "<pre>";print_r($status_data);die;*/
     if($response_data){

   /*    $delivered_order = count($status_data);
       $total_order = $response_data->total_order;
       $inprogress = $total_order - $delivered_order;
       if(empty($response_data->total_amount)){
         $total_amount = 0;
        }
       else{
         $total_amount = $response_data->total_amount;
        }*/
        if(empty($response_data->total_amount)){
          $total_amount = 0;
        }
        else{
          $total_amount = $response_data->total_amount;
        }
        $res['id'] = $response_data->restaurant_id;
        $res['total_order'] = $response_data->total_order;
        $res['total_amount'] = $total_amount;
        $res['delivered_order'] = $response_data->delivered_order;
        $res['inprogress'] = $response_data->inprogress_order;
        $res['resturant_status'] = $response_data->resturant_status;
        // $res['order_amount'] = $response_data->order_amount;
        $Code = ResponseConstant::SUCCESS;
        $Message = ResponseConstant::message('SUCCESS');
        $this->sendResponse($Code, $Message,$res); // return data 
       }
      else{
        $object = new stdclass();
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('NO_RECORDS');
        $this->sendResponse($Code, $Message,$object); // return data  
      }
  }
 public function forgotPassword($postDataArray){
    $phone_no = (isset($postDataArray->phone) && !empty($postDataArray->phone)) ? $postDataArray->phone : '';
    if (empty($phone_no)){
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message); // return data
    }
    $this->load->model('user');
    $table = 'resturant';
    $where = array('phone'=>$phone_no);
    $flag = 'd_a';
    $column = array('phone','is_deleted');
    $response = $this->user->getArrayData($table,$where,$column,$flag);
    /*********checking  for restaurant owner in db and sending otp***********/
    if($response){  
      if($response->is_deleted=='2'){
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('BLOCKED_BY_ADMIN');
        $this->sendResponse($Code, $Message,$res); // return data 
      } 
      else{  
        $curl = curl_init();
        $random_otp = rand(1234,5678);
        $message ="Use ".$random_otp." as OTP to verify your mobile number with Menos";
        curl_setopt_array($curl, array(
          CURLOPT_URL =>"http://control.msg91.com/api/sendotp.php?authkey=223476ACc6mYfF5b585094&message=$message&sender=Menoss&mobile=$phone_no&otp=$random_otp",
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "POST",
          CURLOPT_POSTFIELDS => "",
          CURLOPT_SSL_VERIFYHOST => 0,
          CURLOPT_SSL_VERIFYPEER => 0,
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
          echo "cURL Error #:" . $err;
        } 
        else {
          //echo $response;
        
         $res['otp'] = $random_otp;
         $res['status'] = "owner";
         $otp = $random_otp;
         $table = 'resturant';
         $where = array('phone'=>$phone_no);
         $column =array('otp'=>$otp);
         $response = $this->user->update($table,$column,$where);
         $Code = ResponseConstant::SUCCESS;
         $Message = ResponseConstant::message('SUCCESS');
         $this->sendResponse($Code, $Message,$res); // return data  
        }
      }
    }
    /***********end********/
    else{
      /*********checking  for delivery boy owner in db and sending otp***********/

      $table = 'delivery_boy_details';
      $where = array('phone_no'=>$phone_no);
      $flag = 'd_a';
      $column = array('phone_no','is_deleted');
      $response_d_boy = $this->user->getArrayData($table,$where,$column,$flag);
      if($response_d_boy){
        if($response_d_boy->is_deleted=='2'){
          $Code = ResponseConstant::UNSUCCESS;
          $Message = ResponseConstant::message('BLOCKED_BY_ADMIN');
          $this->sendResponse($Code, $Message,$res); // return data 
        }
        else{
          $curl = curl_init();
          $random_otp = rand(1234,5678);
          $message ="Use ".$random_otp." as OTP to verify your mobile number with Menos";
          curl_setopt_array($curl, array(
            CURLOPT_URL =>"http://control.msg91.com/api/sendotp.php?authkey=223476ACc6mYfF5b585094&message=$message&sender=Menoss&mobile=$phone_no&otp=$random_otp",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => "",
            CURLOPT_SSL_VERIFYHOST => 0,
            CURLOPT_SSL_VERIFYPEER => 0,
          ));

          $response = curl_exec($curl);
          $err = curl_error($curl);

          curl_close($curl);

          if ($err) {
            echo "cURL Error #:" . $err;
          } 
          else {
            //echo $response;
          
           $res['otp'] = $random_otp;
           $res['status'] = "delivery_boy";
           $otp = $random_otp;
           $table = 'delivery_boy_details';
           $where = array('phone_no'=>$phone_no);
           $column =array('otp'=>$otp);
           $response = $this->user->update($table,$column,$where);
           $Code = ResponseConstant::SUCCESS;
           $Message = ResponseConstant::message('SUCCESS');
           $this->sendResponse($Code, $Message,$res); // return data
          } 
        }   
      }
      else{
        $object  = new stdclass();
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('Mobile No Not Registered');
        $this->sendResponse($Code, $Message,$object); // return data 
      }
    }
    /********End************/
  }
  function config($postDataArray){
    $version = (isset($postDataArray->version) && !empty($postDataArray->version)) ? $postDataArray->version : '';
    if (empty($version)){
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    $this->load->model('user');
    $table ='config';
    //$where = array('version'=>$version);
    $where = '( version>"'.$version.'" or version="'.$version.'")';
    $column = array('keys','value','force_upgrade','version','is_clear_data');
    $flag = 'o_t';
    $version_data = $this->user->getArrayData($table,$where,$column,$flag);
   
    if($version_data){
      foreach ($version_data as $key => $value) {
       $res['version'] = $value['version'];
       $res['key'] = $value['keys'];
       $res['value'] = $value['value'];
       $res['is_clear_data'] = $value['is_clear_data'];
       $res['force_upgrade'] = $value['force_upgrade'];
      }
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data
    }
    else{
      $table ='config';
      $where = array('version >'=>$version);
      $column = array('version','force_upgrade','is_clear_data');
      $flag = 'o_t';
      $version_data = $this->user->getArrayData($table,$where,$column,$flag);
      if(empty($version_data)){
        $column = array('version'=>$version,'force_upgrade'=>0,'keys'=>'delivery_distance','value'=>'10000','is_clear_data'=>0);
         $inserted = $this->user->insert($table,$column);   
      }
       $res['version'] = "$version";
       $res['key'] = "";
       $res['value'] = "10000";
       $res['is_clear_data'] = "0";
       $res['force_upgrade'] = "0";
       $Code = ResponseConstant::SUCCESS;
       $Message = ResponseConstant::message('SUCCESS');
       $this->sendResponse($Code, $Message,$res); // return data 
    }
  }
  function updatePassword($postDataArray){
    $phone_no = (isset($postDataArray->phone_no) && !empty($postDataArray->phone_no)) ? $postDataArray->phone_no : '';
    $otp = (isset($postDataArray->otp) && !empty($postDataArray->otp)) ? $postDataArray->otp : '';
    $new_password = (isset($postDataArray->new_password) && !empty($postDataArray->new_password)) ? $postDataArray->new_password : '';
    $status = (isset($postDataArray->status) && !empty($postDataArray->status)) ? $postDataArray->status : '';
    $new_password = md5($new_password);
     if (empty($phone_no) || empty($otp) || empty($new_password)){
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    $this->load->model('user');
    if($status=='delivery_boy'){    
      $table ='delivery_boy_details';
      $where = array('phone_no'=>$phone_no);
      $column = array('otp');
      $flag = 'd_a';
      $d_boy_details = $this->user->getArrayData($table,$where,$column,$flag);
      if($d_boy_details){
         if($d_boy_details->otp==$otp){
           $table = 'delivery_boy_details';
           $column = array('password'=>$new_password);
           $where = array('phone_no'=>$phone_no);
           $response = $this->user->update($table,$column,$where); 
           $Code = ResponseConstant::SUCCESS;
          $Message = ResponseConstant::message('SUCCESS');
          $this->sendResponse($Code, $Message,$res); // return data
         }
         else{
           $Code = ResponseConstant::UNSUCCESS;
           $Message = ResponseConstant::message('Invalid OTP');
           $this->sendResponse($Code, $Message); // return data 
         }
      }
      else{
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('Mobile No Not Registered');
        $this->sendResponse($Code, $Message); // return data 
      }
    }
    elseif($status=='owner'){
      $table ='resturant';
      $where = array('phone'=>$phone_no);
      $column = array('otp');
      $flag = 'd_a';
      $restaurant_details = $this->user->getArrayData($table,$where,$column,$flag);
      if($restaurant_details){
        if($restaurant_details->otp==$otp){
         $table = 'resturant';
         $column = array('password'=>$new_password);
         $where = array('phone'=>$phone_no);
         $response = $this->user->update($table,$column,$where); 
         $Code = ResponseConstant::SUCCESS;
         $Message = ResponseConstant::message('SUCCESS');
         $this->sendResponse($Code, $Message,$res); // return data
        }
        else{
          $Code = ResponseConstant::UNSUCCESS;
           $Message = ResponseConstant::message('Invalid OTP');
           $this->sendResponse($Code, $Message); // return data 
        }
      }
      else{
        $Code = ResponseConstant::UNSUCCESS;
        $Message = ResponseConstant::message('Mobile No Not Registered');
        $this->sendResponse($Code, $Message); // return data 
      }
    }
  }
  function configDelivery($postDataArray){
    $version = (isset($postDataArray->version) && !empty($postDataArray->version)) ? $postDataArray->version : '';
    if (empty($version)){
      $object = new stdclass();
      $Code = ResponseConstant::UNSUCCESS;
      $Message = ResponseConstant::message('REQUIRED_PARAMETER');
      $this->sendResponse($Code, $Message,$object); // return data
    }
    $this->load->model('user');
    $table ='configDelivery';
    //$where = array('version'=>$version);
    $where = '( version>"'.$version.'" or version="'.$version.'")';
    $column = array('version','force_upgrade','is_clear_data');
    $flag = 'o_t';
    $version_data = $this->user->getArrayData($table,$where,$column,$flag);
   //  echo "<pre>"; print_r($version_data); die;
    if($version_data){
      foreach ($version_data as $key => $value) {
       $res['version'] = $value['version'];
       $res['force_upgrade'] = $value['force_upgrade'];
       $res['is_clear_data'] = $value['is_clear_data'];
      }
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data
    }
    else{
      $table ='configDelivery';
      $where = array('version >'=>$version);
      $column = array('version','force_upgrade','is_clear_data');
      $flag = 'o_t';
      $version_data = $this->user->getArrayData($table,$where,$column,$flag);
      if(empty($version_data)){
        $column = array('version'=>$version,'force_upgrade'=>0,'is_clear_data'=>0);
         $inserted = $this->user->insert($table,$column);   
      }
      $res['version'] = "$version";
      $res['force_upgrade'] = "0";
      $res['is_clear_data'] = "0";
      $Code = ResponseConstant::SUCCESS;
      $Message = ResponseConstant::message('SUCCESS');
      $this->sendResponse($Code, $Message,$res); // return data
    }
  }
}
?>