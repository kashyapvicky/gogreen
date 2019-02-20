<form>
<input type="file" onchange="previewFile()"><br>
<img id="myimg" src="" height="200" alt="Image preview...">
</form>
<script type="text/javascript">
	
	function previewFile() {
  var preview = document.querySelector('img');
  var file    = document.querySelector('input[type=file]').files[0];
  var reader  = new FileReader();

  reader.addEventListener("load", function () {
  	//document.getElementsById('myimg').src += "&showinfo=0";
    preview.src = reader.result;
  }, false);

  if (file) {
    reader.readAsDataURL(file);
  }
}
</script>