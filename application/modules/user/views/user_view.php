<?php

/* * ***********************
 * PAGE: TO Listing The User.
 * #COPYRIGHT: Ripenapps
 * @AUTHOR: vicky kashyap
 * CREATOR: 04/06/2018.
 * UPDATED: --/--/----.
 * codeigniter framework
 * *** */
?>
<style>
.for_hover:hover
{
 text-decoration: underline;
}
</style>
<div class="right_col" id="cool" role="main">
  <div class="page-title">
    <div class="title_left">
      <h3>Users</h3>
      <a href="<?php echo base_url()?>user/excel_export" class="btn btn-info">Export Data</a>
    </div>

    <div class="title_right">
      
    </div>
  </div>
  <div class="row">

    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
        <div class="x_title">
          <h2>Users </h2>
          <!-- <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Settings 1</a>
                </li>
                <li><a href="#">Settings 2</a>
                </li>
              </ul>
            </li>
            <li><a class="close-link"><i class="fa fa-close"></i></a>
            </li>
          </ul> -->
          <div class="row">
            <div class="col-md-3"></div>  
            <div class="col-md-4">
               <select  class="form-control" id="filter_id" onchange="location = this.value;">
                  <option value="<?php echo base_url()?>user">All Users</option>
                 <option value="<?php echo base_url()?>user/filter_function?flag=2">Active Users</option>
                 <option value="<?php echo base_url()?>user/filter_function?flag=3">Inactive Users</option>
                 <option value="<?php echo base_url()?>user/filter_function?flag=4">Users With No Car</option>
               </select>

            </div>  
            <div class="col-md-5"></div>  

          </div>
         
          <div class="clearfix"></div>
        </div>
        <div class="x_content">
          
          <table id="datatable" class="table table-striped table-bordered">
            <thead>
              <tr>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>City</th>
                <th>Locality</th>
                <th>Street</th>
                <th>Number Of Cars</th>
                <th>Active Cars</th>
                <th> Date</th>
                <th>Operation</th>
              </tr>
            </thead>


            <tbody id="">
              <?php
                   // echo"<pre>";print_r($users); die;
                 foreach($users as $key => $user)
                 {
                    if($users[$key]['is_payment']==2)
                    {
                      $disabled="disabled";
                      $href="#";
                    }
                    else
                    {
                      $disabled="";
                      $href=base_url()."user/delete_user?id=".$users[$key]['id'];
                    }
                    $phone_number = $users[$key]['phone_number'];
                    $result = substr($phone_number, 0, 4);
                    if($result!='+971')
                    {
                      $phone_number = '+971'.$users[$key]['phone_number'];
                    }
                    // echo $result; die;
                    echo"
                    <tr>
                     <td><a  class='for_hover' href = '".base_url()."user/get_user_car_details?id=".$users[$key]['id']."'>".$users[$key]['name']."</a></td></a>
                      <td>".$phone_number."</td>
                      <td>".$users[$key]['email']."</td>
                      <td>".$users[$key]['city']."</td>
                      <td>".$users[$key]['locality']."</td>
                      <td>".$users[$key]['street']."</td>

                      <td>".$users[$key]['no_of_cars']."</td>
                      <td>".$users[$key]['active_cars']."</td>
                      <td>".$users[$key]['created_at']."</td>
                      <td><a  ".$disabled." href='".$href."' class='btn btn-danger'>Delete</td>
                    </tr>";
                  }

              ?>
             
             
              
             <!--  <tr>
                <td>Tiger Nixon</td>
                <td>System Architect</td>
                <td>Edinburgh</td>
                <td>61</td>
              </tr>
              <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>63</td>
              </tr>
              <tr>
                <td>Ashton Cox</td>
                <td>Junior Technical Author</td>
                <td>San Francisco</td>
                <td>66</td>
              </tr>
              <tr>
                <td>Cedric Kelly</td>
                <td>Senior Javascript Developer</td>
                <td>Edinburgh</td>
                <td>22</td>
              </tr>
              <tr>
                <td>Airi Satou</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>33</td>
              </tr>
              <tr>
                <td>Brielle Williamson</td>
                <td>Integration Specialist</td>
                <td>New York</td>
                <td>61</td>
              </tr>
              <tr>
                <td>Michael Bruce</td>
                <td>Javascript Developer</td>
                <td>Singapore</td>
                <td>29</td>
              </tr>
              <tr>
                <td>Donna Snider</td>
                <td>Customer Support</td>
                <td>New York</td>
                <td>27</td>
              </tr>
              <tr>
                <td>Donna Snider</td>
                <td>Customer Support</td>
                <td>New York</td>
                <td>27</td>
              </tr>
              <tr>
                <td>Donna Snider</td>
                <td>Customer Support</td>
                <td>New York</td>
                <td>27</td>
              </tr> -->

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>





  <div class="row">
   
    

  </div>
</div>
    

<?php
  // echo base_url(uri_string());
?>

<script>
  $( document ).ready(function() {
  document.getElementById("cool").style.minHeight = "697px";
var url =   window.location.href; 
// console.log(url);
$('#filter_id').val(url);

  });
</script>


<script>

  $(document).ready(function(){
    $("#datatable").dataTable().fnDestroy()
    $('#datatable').dataTable({
            
            dom: 'Bfrtip',
            buttons: [
                      {
                extend: 'excelHtml5',
                title: 'Data export',
                 exportOptions: {
                       columns: [ 8,0, 1, 2,3,4,5,6,7]
                }
            },
            {
                extend: 'csvHtml5',
                title: 'Data export',
                exportOptions: {
                     columns: [ 8,0, 1, 2,3,4,5,6,7]
                }
            },
    ],

     ordering: false,
    oLanguage: {
      "sSearch": "Search:"
    },
    columnDefs : [
                { 
                    'searchable'    : false, 
                    'targets'       : [1,2,3] 
                },
            ],
            "bStateSave": true,
        "fnStateSave": function (oSettings, oData) {
            localStorage.setItem('offersDataTables', JSON.stringify(oData));
        },
        "fnStateLoad": function (oSettings) {
            return JSON.parse(localStorage.getItem('offersDataTables'));
        }


          });
});
</script>
<script>
 function filter_user(val)
 {
  var filter_val = val;
  if(filter_val==1)   // all user
  {
    ///alert('hey');
    window.location = "user";
  }
  $.ajax
    ({
        type : "POST",
        url : "<?php echo base_url(); ?>user/filter_function",
        dataType : "json",
        data : {"flag" : filter_val},
        success : function(data) {
             $("#locality_ajax").html(data.option);
             //$("#locality_ajax_table").html(data.dropdown);
             //alert('hello');
             console.log(data);
        },
        error : function(data) {
            alert('Something went wrong');
        }
    });
  }
</script>