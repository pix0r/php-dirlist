<html>
<head>
<style type="text/css">
a:hover {
  text-decoration: none;
  color:white; background-color:black;
  background: #000000;
  color: #FFFFFF;
  cursor: pointer;
}

  body,p,td {
      text-decoration: none;
      font-family: Verdana, Arial, Helvetica, sans-serif; 
      font-size: 11px;
      color: #7EB688;
      background-color: #242424;
  }
a:link {
	color: #00CCFF;
        text-decoration: none;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body vlink="#999999" alink="#00CCFF">

<!-- BEGIN PrevBlock -->
  <a href="{prev_link}"><= back</a>
<!-- END PrevBlock -->
<!-- BEGIN NextBlock -->
  <a href="{next_link}">next =></a>
<!-- END NextBlock -->

<Br>

<!-- BEGIN ImageBlock -->
  <img src="{image_file}" border="0"><br>
<!-- END ImageBlock -->

<!-- BEGIN SlideshowBlock -->
  Photos:<br>
  <table cellpadding="6">
    <tr>
      <!-- BEGIN SSColumnBlock -->
        <td nowrap valign="top">
          <!-- BEGIN SSFileBlock -->
            {file_id_padded}. <a href="{file_link}">{file_name}</a><br>
          <!-- END SSFileBlock -->
        </td>
      <!-- END SSColumnBlock -->
    </tr>
  </table><br><br>
<!-- END SlideshowBlock -->

<!-- BEGIN OtherBlock -->
  :<br>
  <table cellpadding="5">
    <tr>
      <!-- BEGIN OColumnBlock -->
        <td nowrap valign="top">
          <!-- BEGIN OFileBlock -->
            {file_id_padded}. <a href="{file_name}">{file_name}</a><br>
          <!-- END OFileBlock -->
        </td>
      <!-- END OColumnBlock -->
    </tr>
  </table><br><br>
<!-- END OtherBlock -->
</html>
</body>
