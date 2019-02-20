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
.x_panel
{
  overflow-y: scroll;
}
.select
{
    min-width: 48%;
    /*margin: 2px 0 10px 7px;*/
    padding: 4px;
}
.multiselect 
{

  width: 65%;
}

.selectBox {
  position: relative;
}

.selectBox select {
  width: 100%;
  font-weight: bold;
  padding: 10px 22px;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #1e90ff;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
<div class="right_col" role="main">
  <div class="page-title">
    <div class="row"> 
      <div class="col-md-4">
         <select onchange="get_locality_for_street(this.value)" id="city_multiselect" class="select" multiple ><option value="" disabled selected>Select City</option>
          <?php if(!empty($city)){foreach ($city as $key => $value) {
        
          echo"<option value=".$value['id'].">".ucfirst($value['name'])."</option>";}}?>
          </select>
      </div>
      <div class="col-md-4">
          <div class="multiselect">
            <div class="selectBox" onclick="showCheckboxes()">
              <select>
              <option>Select an option</option>
              </select>
              <div class="overSelect"></div>
            </div>
            <?php if($this->input->get('cashtab'))
            {
              ?>
            <form method="post" action="<?php echo base_url()?>orders?cashtab=1">
              <?php
            }
            else
              {?>
                 <form method="post" action="<?php echo base_url()?>orders">
                <?php

              }?>
            <div id="checkboxes">
           <!--  <label for="one">
            <input type="checkbox" id="one" />First checkbox</label>
            <label for="two">
            <input type="checkbox" id="two" />Second checkbox</label>
            <label for="three">
            <input type="checkbox" id="three" />Third checkbox</label> -->
            </div>  
        </div>
      </div>
      <div class="col-md-4">
        <button type="submit" value="" class="btn btn-info" style="padding: 7px 22px">Submit</button>
        </form>
      </div>
    </div>
    <div class="title_left">
      <h3>Orders</h3>

        <ul class="nav nav-tabs">
          <?php 
          if($this->input->get('cashtab'))
          {
            $class ='active';
            $online_class='none';
          }
          else
          {
            $online_class = 'active';
            $class='none';
          }

          ?>
          <li class="<?php echo $online_class?>"><a href="<?php echo base_url()?>orders">Online</a></li>
          <li class="<?php echo $class?>"><a href="<?php echo base_url()?>orders/index?cashtab=1">Cash</a></li>
          <li><a href="<?php echo base_url()?>orders/pending">Pending</a></li>
        </ul>
      
    </div>

    <div class="title_right">
      
    </div>
  </div>
  <div class="row">

    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
        <div class="x_title">
          <div class="row">
            <div class="col-md-3">

             <!-- <select onchange="get_locality_for_street(this.value)" class="select"><option value="" disabled selected>Select City</option>
              <?php if(!empty($city)){foreach ($city as $key => $value) {

                echo"<option value=".$value['id'].">".ucfirst($value['name'])."</option>";}}?>
              </select>
            </div>
            <div class="col-md-3">
              <select class="select" id="locality_ajax"><option>Choose City First</option>
              </select>
            </div>
            <div class="col-md-3">
              <select>
                <option>Street</option>


              </select>
            </div>
            <div class="col-md-3">
             <select>
              <option>Team</option>
            </select>
 -->
          </div>
        </div> 
          <div class="clearfix"></div>
        </div>
        <div class="x_content">
          <font color="green">
          <?php echo $this->session->flashdata('remark_added');?>
          <?php echo $this->session->flashdata('status_changed');?>
        </font>
          <table id="datatable-responsive" class="table table-striped table-bordered">
            <thead>
              <tr>
                <tr>
                <th>Order ID</th>
                <th>Customer Name</th>
                <th>Team</th>
                <th>Amount</th>
                <th>Customer Number</th>
                <th>Transaction Id</th>
                <th>Remark</th>
                <th>City</th>
                <th>Locality</th>
                <th>Street</th>
                <th>Date</th>

                <th>Add Remark</th>
                <th>Team Assign</th>
                <th>Payment Status</th>
              </tr>
              </tr>
            </thead>
            <tbody id="">
              <?php
              //echo"hello";die;
                 foreach($orders as $key => $value)
                 {

                  if($value['payment_status']==2)
                  {
                    $status = 'collected';
                  }

                  else
                  {
                      $status ='collected';
                  }

                  // echo "<pre>"; print_r($orders); die;
                  echo"
                  <tr>
                    <td>".$value['orders_id']."</td>
                    <td><a href=".base_url()."orders/get_customer_detail?id=".$value['user_id']."&&primary_id=".$value['primary_id'].">".$value['username']."</a></td>
                    <td>".$value['team_name']."</td>
                    <td>".$value['net_paid']."</td>
                    <td>".$value['phone_number']."</td>
                    <td>".$value['transaction_id']."</td>
                    <td>".$value['remark']."</td>
                    <td>".$value['city']."</td>
                    <td>".$value['locality']."</td>
                    <td>".$value['street']."</td>
                    <td>".$value['purchase_date']."</td>
                    <td><button href='' class='btn btn-primary' onclick='remark_modal(".$value['primary_id'].")'>Add</button></td>
                    <td><button href='' onclick='open_modal(".$value['primary_id'].")' class='btn btn-info'>Assign Team</button></td>";
                      if($value['payment_status']==2)
                      {
                        echo"<td><button class='btn btn-success'>Collected</button></td>";
                      }

                      else
                      {
                         echo"<td><button onclick='update_payment_status_as_collect(".$value['primary_id'].")' class='btn btn-info'>Collect</button></td>";
                      }
                      echo"
                      </tr>";
                 }
              ?>
              
              
             <!-- <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>63</td>
                 <td>Edinburgh</td>
                <td>61</td>
              </tr>
              <tr>
                <td>Ashton Cox</td>
                <td>Junior Technical Author</td>
                <td>San Francisco</td>
                <td>66</td>
                 <td>Edinburgh</td>
                <td>61</td>
              </tr>
              <tr>
                <td>Cedric Kelly</td>
                <td>Senior Javascript Developer</td>
                <td>Edinburgh</td>
                <td>22</td>
                 <td>Edinburgh</td>
                <td>61</td>
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
                 <td>Edinburgh</td>
                <td>61</td>
              </tr>
              <tr>
                <td>Michael Bruce</td>
                <td>Javascript Developer</td>
                <td>Singapore</td>
                <td>29</td>
                 <td>Edinburgh</td>
                <td>61</td>
              </tr>
              <tr>
                <td>Donna Snider</td>
                <td>Customer Support</td>
                <td>New York</td>
                <td>27</td>
                 <td>Edinburgh</td>
                <td>61</td>
              </tr>
              <tr>
                <td>Donna Snider</td>
                <td>Customer Support</td>
                <td>New York</td>
                <td>27</td>
                 <td>Edinburgh</td>
                <td>61</td>
              </tr>
              <tr>
                <td>Donna Snider</td>
                <td>Customer Support</td>
                <td>New York</td>
                <td>27</td>
                 <td>Edinburgh</td>
                <td>61</td>
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
    

<!-- modal for manuall team change -->
<div style="" class="modal fade" id="team_modal" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4  class="modal-title">Assign Team</h4>
          </div>
          <div class="modal-body" style="">
           <form method="post" action="<?php base_url();?>orders/change_team">
            <label>Team Name</label>
            <!-- <input required type="text" class="form-control" id="city_ajax_name" name="city" placeholder="City Name"> -->
            <select class="form-control" required id="modal_team_name" name="team_id">
            

            </select>
            <span id="modal_span" style="color: red"></span>
            <input type="hidden" name="payment_key" id="payment_key">
          </div>
          <div class="modal-footer">
            <input type="submit" class="btn btn-default" value="Update">
            <button style="" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </form>
          </div>
      </div>
    </div>
  </div>

  <!--/ moodal for manual team change -->



<!-- modal for Remark -->
<div style="" class="modal fade" id="remark" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4  class="modal-title">Remark</h4>
          </div>
          <div class="modal-body" style="">
           <form method="post" action="<?php base_url();?>orders/add_remark">
            <label>Add Remark</label>
            <input required type="text" class="form-control" id="city_ajax_name" name="remark" placeholder="Write Remark Here..">
            <span id="remark_span" style="color: red"></span>
            <input type="hidden" name="payment_key_remark" id="payment_key_remark">
          </div>
          <div class="modal-footer">
            <input type="submit" class="btn btn-default" value="Update">
            <button style="" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </form>
          </div>
      </div>
    </div>
  </div>

  <!--/ moodal for Remark -->





<script>

function open_modal(id)
{
  var primary_id = id;
   $.ajax
      ({
        type : "POST",
        url : "<?php echo base_url(); ?>orders/get_teams_working_on_this_order",
        dataType : "json",
        data : {"primary_id" : primary_id},
        success : function(data)
        {

          if(data==5)
          {
            $('#modal_span').html('No team to assiagn');
          }
          $('#modal_team_name').html(data);
          $('#team_modal').modal('show');
          $('#payment_key').val(primary_id);
         // $("#locality_ajax_table").html(data.dropdown);
             //alert('hello');
             console.log(data);
           },
           error : function(data) {
            alert('Something went wrong');
          }
        });
}

</script>

<script>
function remark_modal(val)
{
 var primary_id = val;
 // alert(primary_id);
 $('#payment_key_remark').val(primary_id);
 $('#remark').modal('show');
}

function update_payment_status_as_collect(id)
{
  var order_id = id;
  $.ajax
      ({
        type : "POST",
        url : "<?php echo base_url(); ?>orders/update_payment_status_as_collected",
        dataType : "json",
        data : {"order_id" : order_id},
        success : function(data)
        {

           location.reload();
         // $("#locality_ajax_table").html(data.dropdown);
             //alert('hello');
             console.log(data);
           },
           error : function(data) {
            alert('Something went wrong');
          }
        });
}

</script>

<script>

  $(document).ready(function(){
    $("#datatable-responsive").dataTable().fnDestroy()
    $('#datatable-responsive').dataTable({
            
           
            
            dom: 'Bfrtip',
            buttons: [
                      {
                extend: 'excelHtml5',
                title: 'Data export',
                 exportOptions: {
                     columns: [ 0, 1, 2,3,4,5,6 ]
                }
            },
            {
                extend: 'csvHtml5',
                title: 'Data export',
                exportOptions: {
                   columns: [ 0, 1, 2,3,4,5,6 ]
                }
            },
    ],
    oLanguage: {
      "sSearch": "Search:"
    },
    columnDefs : [
                { 
                    'searchable'    : true, 
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
$('#city_multiselect').multiselect({
  nonSelectedText: 'Select Category',
  enableFiltering: true,
  enableCaseInsensitiveFiltering: true,
  buttonWidth:'250px'
 });
</script>
<script>
var expanded = false;

function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}
</script>

<script>
  function get_locality_for_street(val)
 {

    var id =   $('#city_multiselect').val();
   // alert(id);
    
    if (typeof id !== 'undefined' && id.length > 0)
    {
    // the array is defined and has at least one element
        $.ajax
        ({
            type : "POST",
            url : "<?php echo base_url(); ?>cleaner/get_locality_for_street",
            dataType : "json",
            data : {"city_id" : id},
            success : function(data) {
                 $("#checkboxes").html(data.option);

                  //$("#locality_ajax").multiselect('refresh');

                 //$("#locality_ajax_table").html(data.dropdown);
                 //alert('hello');
                 console.log(data);
            },
            error : function(data) {
                alert('Something went wrong');
            }
        });
    }
    else
    {
      $("#locality_ajax").html('<option disabled selected>Choose City First</option>');
    }
  } 
</script>