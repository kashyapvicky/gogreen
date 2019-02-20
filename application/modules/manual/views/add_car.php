
<?php
// echo $user_id; die;
/* * ***********************
 * PAGE: TO Add The packages.
 * #COPYRIGHT: Ripenapps
 * @AUTHOR: vicky kashyap
 * CREATOR: 04/07/2018.
 * UPDATED: --/--/----.
 * codeigniter framework
 * *** *********************/
?>
<div class="right_col" id="cool" role="main">
  <div class="page-title">
    <div class="title_left">
      <h3>Add Cars</h3>
    </div>

    <div class="title_right">

    </div>
  </div>

  <div class="row">

    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
       <div class="x_title">
        <h2> Select Or Add More Car</h2>

        <?php if($this->session->flashdata('phone_exist'))
          { 
            //echo"alresdy exist";die;
            echo"<div style='margin-left: 150px;'>";
            echo"<font color='red'>Email Already Exist</font>";
            echo"</div>";
          }
          ?>

        <div class="clearfix"></div>
         <?php
        echo $this->session->flashdata('car_inserted');
        echo $this->session->flashdata('car_updated');

        ?>
      </div>
      <div class="x_content">
        <form method="post" action="<?php echo base_url()?>manual/add_update_car" id="car_data" data-parsley-validate class="form-horizontal form-label-left">

          <input type="hidden" name="hidden_car_id" id="hidden_car_id">
          <input type="hidden" name="hidden_user_id" id="hidden_user_id" value="<?php echo $user_id?>">

            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Car
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <select name="city" onchange="get_car_info(this.value)"  class="form-control">
                  <option value="" disabled selected>Select Car</option>
                  <?php
                    if(!empty($cars))
                    {
                       // print_r($cars); die;
                      foreach ($cars as $key => $value) 
                      {

                        echo"<option  value='".$key."'>".$value['reg_no']."";
                       
                      }
                    }
                  ?>
                </select>
              </div>
            </div>
           <!--  <div class="form-group">
              <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                <div class="row">
                  <div class="col-md-5"></div>
                  <div class="col-md-2">
                    <button type="submit" class="btn btn-success">Submit</button>
                  </div>
                  <div class="col-md-3"></div>
                </div>
              </div>
            </div>   -->
             <h3 style="text-align: center;">OR</h3>
             <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Registration Number <!-- <span class="required">*</span> -->
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text"  id="reg_no" name="reg_no" onblur="is_exist(this.value)" required="required" placeholder=" Enter Registration Number" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Type
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <select required name="type" id="type" onchange="get_respective_models(this.value)"   class="form-control">
                  <option value="" disabled selected>Choose Type</option>
                  <option value="Saloon">Saloon</option>
                  <option value="Suv">Suv</option>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Brand
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <select required name="brand" id="brand" onchange="get_respective_models(this.value)"   class="form-control">
                  <option value="" disabled selected>Choose Brand</option>
                  <?php

                    if(!empty($all_brands))
                    {
                      foreach ($all_brands as $key => $value) 
                      {
                        echo"<option  value='".$value['id']."'>".$value['name'].""; 
                      }
                    }
                  ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Model
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <select required name="model"  id="ajax_model"  class="form-control">
                  <option value="" disabled selected>Choose Brand First</option>
                  <?php

                    if(!empty($all_models))
                    {
                      foreach ($all_models as $key => $value) 
                      {
                        echo"<option   value='".$value['id']."'>".$value['name']."";
                       
                      }
                    }
                  ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Color
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <select required name="color" id="color"   class="form-control">
                  <option value="" disabled selected>Choose Color</option>
                 <option value="Black" >Black</option>
                 <option value="Brown" >Brown</option>
                 <option value="Burgundy" >Burgundy</option>
                 <option value="Gold" >Gold</option>
                 <option value="Gray" >Gray</option>
                 <option value="Orange" >Orange</option>
                 <option value="Purple" >Purple</option>
                 <option value="Red" >Red</option>
                 <option value="Silver" >Silver</option>
                 <option value="White" >White</option>
                 <option value="Tan" >Tan</option>
                 <option value="Yellow">Yellow</option>
                 <option value="Other Color">Other Color</option>
                </select>
              </div>
            </div>
          <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="parking_number">Parking Number <!-- <span class="required">*</span> -->
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input  placeholder=" Enter Parking Number"  type="text" required id="parking_number" name="parking_number" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
              <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-2">
                  <button  id="formbutton" class="btn btn-success">ADD</button>
                </div>
                <!--  <div class="col-md-3">
                  <button onclick="" class="btn btn-success">Proceed To Package</button>
                </div>   -->
                 <div class="col-md-2">
                  <input type="reset" onclick="hidden_reset();"  class="btn btn-danger" value="Reset">
                </div>
                </form> 
                <div class="col-md-4">
                    <a href="<?php echo base_url()?>manual/proceed_to_package?id=<?php echo $user_id?>" class="btn btn-success">Proceed</a>
                </div>
              </div>
            </div>
          </div>


        <!-- form foor existred cars  -->
        <!-- <div class="row">
          <form method="post">
            <div class="form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12">
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <select name="city" onchange="get_user_info(this)"  class="form-control">
                  <option value="" disabled selected>Select User</option>
                  <?php

                    if(!empty($users))
                    {
                      foreach ($users as $key => $value) 
                      {
                        echo"<option class='".$value['phone_number']."_".$value['email']."' value='".$value['id']."'>".$value['name']."";
                       
                      }
                    }
                  ?>
                </select>
              </div>
            </div>
            <br><br><br>
            <div class="form-group">
              <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                <div class="row">
                  <div class="col-md-5"></div>
                  <div class="col-md-2">
                    <button type="submit" class="btn btn-success">Submit</button>
                  </div>
                
                  <div class="col-md-3"></div>
                </div>
              </div>
            </div>
          </form>
        </div> -->
        <!-- /forms for existed cars -->
      </div>
    </div><!--x panel-->
  </div>
</div>
</div>
<script>

 function get_city(val)
 {
  var city_id = val;
  //alert(city_id);

  $.ajax
  ({
    type : "POST",
    url : "<?php echo base_url(); ?>cleaner/get_locality",
    dataType : "json",
    data : {"city_id" : city_id},
    success : function(data) 
    {
       $("#locality_select").html(data);
       console.log(data);
     },
     error : function(data) {
      alert('Something went wrong');
    }
  });
 }

 // to get user info from dropdown


function get_respective_models(id)
{
   var brand_id = id;
    $.ajax
      ({
        type : "POST",
        url : "<?php echo base_url(); ?>manual/get_brands_with_model_id",
        dataType : "json",
        data : {"brand_id" : brand_id},
        success : function(data)
        {

          $('#ajax_model').html(data);
             console.log(data);
        },
        error : function(data)
        {
            alert('Something went wrong');
        }
        });
   
}

function save_data(e)
{
  var post_array = $('#car_data').serialize(); 
  console.log(post_array);
   event.preventDefault();
}

function get_car_info(array_index)
{

  var car_array = <?php echo json_encode( $cars) ?>;
  var array_key = array_index;

  var car_id = car_array[array_key].id;
  // var user_id = car_array[array_key].user_id;
  // alert(car_id); return false;
  var reg_no = car_array[array_key].reg_no;
  var type = car_array[array_key].type;
  var brand = car_array[array_key].brand;
  var model = car_array[array_key].model;
  var parking_number = car_array[array_key].parking_number;
  var color = car_array[array_key].color;


  $('#color').val(color);
  $('#type').val(type);
  $('#reg_no').val(reg_no);
  $('#brand').val(brand);
  $('#ajax_model').val(model);
  $('#parking_number').val(parking_number);
  $('#formbutton').text('Update');
  $('#hidden_car_id').val(car_id);
  // $('#hidden_user_id').val(user_id);
}

function is_exist(number)
{
 var reg_no = number;
 var car_id = $('#hidden_car_id').val();
 if(reg_no)
 {
    $.ajax
    ({
      type : "POST",
      url : "<?php echo base_url(); ?>manual/check_reg_no_existence",
      dataType : "json",
      data : {"reg_no" : reg_no,"car_id":car_id},
      success : function(data) 
      {
         if(data==2)
         {
            $('#reg_no').val('');
            alert('Car Already Exist');
         }
       },
      error : function(data)
      {
      alert('Something went wrong');
      }
    });
  }
}
function hidden_reset()
{
  $('#hidden_car_id').val('');
  $('#formbutton').text('ADD');
}
</script>