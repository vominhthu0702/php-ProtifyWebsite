<?php
    session_start();
    include_once '../libary/connectprotify.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>protify - Music, Audio and Radio web application</title>
  <meta name="description" content="Music, Musician, Bootstrap" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <!-- for ios 7 style, multi-resolution icon of 152x152 -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-barstyle" content="black-translucent">
  <link rel="apple-touch-icon" href="images/logo.png">
  <meta name="apple-mobile-web-app-title" content="Flatkit">
  <!-- for Chrome on Android, multi-resolution icon of 196x196 -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="shortcut icon" sizes="196x196" href="images/logo.png">
  
  <!-- style -->
  <link rel="stylesheet" href="css/animate.css/animate.min.css" type="text/css" />
  <link rel="stylesheet" href="css/glyphicons/glyphicons.css" type="text/css" />
  <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="css/material-design-icons/material-design-icons.css" type="text/css" />
  <link rel="stylesheet" href="css/bootstrap/dist/css/bootstrap.min.css" type="text/css" />

  <!-- build:css css/styles/app.min.css -->
  <link rel="stylesheet" href="css/styles/app.css" type="text/css" />
  <link rel="stylesheet" href="css/styles/style.css" type="text/css" />
  <link rel="stylesheet" href="css/styles/font.css" type="text/css" />
  
  <link rel="stylesheet" href="libs/owl.carousel/dist/assets/owl.carousel.min.css" type="text/css" />
  <link rel="stylesheet" href="libs/owl.carousel/dist/assets/owl.theme.css" type="text/css" />
  <link rel="stylesheet" href="libs/mediaelement/build/mediaelementplayer.min.css" type="text/css" />
  <link rel="stylesheet" href="libs/mediaelement/build/mep.css" type="text/css" />

  <!-- endbuild -->
</head>
<body>
    
    
    
    
    <div class="app dk" id="app">

<!-- ############ LAYOUT START-->

  <div class="padding">
    <div class="navbar">
      <div class="pull-center">
        <!-- brand -->
        <a href="index.html" class="navbar-brand md">
        	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="32" height="32">
        		<circle cx="24" cy="24" r="24" fill="rgba(255,255,255,0.2)"/>
        		<circle cx="24" cy="24" r="22" fill="#1c202b" class="brand-color"/>
        		<circle cx="24" cy="24" r="10" fill="#ffffff"/>
        		<circle cx="13" cy="13" r="2"  fill="#ffffff" class="brand-animate"/>
        		<path d="M 14 24 L 24 24 L 14 44 Z" fill="#FFFFFF" />
        		<circle cx="24" cy="24" r="3" fill="#000000"/>
        	</svg>
        
        	<img src="images/logo.png" alt="." class="hide">
        	<span class="hidden-folded inline">protify</span>
        </a>
        <!-- / brand -->
      </div>
    </div>
  </div>


  <div class="b-t">
    <div class="center-block w-xxl w-auto-xs p-y-md text-center">
       
      <div class="p-a-md">
          
        <div>
          <a href="#" class="btn btn-block indigo text-white m-b-sm">
            <i class="fa fa-facebook pull-left"></i>
            Sign in with Facebook
          </a>
          <a href="#" class="btn btn-block red text-white">
            <i class="fa fa-google-plus pull-left"></i>
            Sign in with Google+
          </a>
        </div>
        <div class="m-y text-sm">
            OR <br><br>
           <?php
        //kiem tra trang [singin.html] da duoc chay chua
        if (isset($_POST["btnOK"]) == FALSE) {
            header("location:signin.html");
            exit();
        }
        
        
        $email = $_POST["txtUserEmail"];
        $pass = $_POST["txtUserPass"];
        $sql = "select * from tb_user where Email='$email' and Password='$pass'";

        //Thực hiện câu lệnh truy vấn từ SQL
        $r = mysqli_query($link, $sql);

        //Kiếm tra có dòng lệnh được trả về từ câu lệnh SQL hay không
        
        if (mysqli_num_rows($r) > 0) {
            $tbuser = mysqli_fetch_row($r);
            $_SESSION ["id"] = $tbuser[0];
            $_SESSION ["role"] = $tbuser[3];
            if ($tbuser[3] == 1) {
                header("location:index.php");
            } else {
                header("location:index.html");
            }   
        } else {
            echo "<span style='color:white;font-weight:700;font-size:15px;width:296px;height:70px;margin-bottom:50px;width:296px;padding:5px 0px;background-color:red;'>&nbsp;&nbsp;&nbsp;The email or password is not correct !&nbsp;&nbsp;&nbsp; </h3>";
            unset($_SESSION ["id"]);
            unset($_SESSION ["role"]);
        }
        ?>
        </div>
          
        <form id="form_login" name="form_login" action="signin.php" method="POST">
          <div class="form-group">
            <input type="email" id="txtUserEmail" name="txtUserEmail" class="form-control" placeholder="Email" value ="" required>
          </div>
          <div class="form-group">
            <input type="password" id="txtUserPass" name="txtUserPass" class="form-control" placeholder="password" value="" required>
          </div>      
          <div class="m-b-md">        
            <label class="md-check">
              <input type="checkbox"><i class="primary"></i> Keep me signed in
            </label>
          </div>
          <button type="submit" name="btnOK" class="btn btn-lg black p-x-lg">Sign in</button>
        </form>
        <div class="m-y">
          <a href="forgot-password.html" class="_600">Forgot password?</a>
        </div>
        <div>
          Do not have an account? 
          <a href="signup.html" class="text-primary _600">Sign up</a>
        </div>
      </div>
    </div>
  </div>

<!-- ############ LAYOUT END-->
  </div>
    

<!-- build:js scripts/app.min.js -->
<!-- jQuery -->
  <script src="libs/jquery/dist/jquery.js"></script>
<!-- Bootstrap -->
  <script src="libs/tether/dist/js/tether.min.js"></script>
  <script src="libs/bootstrap/dist/js/bootstrap.js"></script>
<!-- core -->
  <script src="libs/jQuery-Storage-API/jquery.storageapi.min.js"></script>
  <script src="libs/jquery.stellar/jquery.stellar.min.js"></script>
  <script src="libs/owl.carousel/dist/owl.carousel.min.js"></script>
  <script src="libs/jscroll/jquery.jscroll.min.js"></script>
  <script src="libs/PACE/pace.min.js"></script>
  <script src="libs/jquery-pjax/jquery.pjax.js"></script>

  <script src="libs/mediaelement/build/mediaelement-and-player.min.js"></script>
  <script src="libs/mediaelement/build/mep.js"></script>
  <script src="scripts/player.js"></script>

  <script src="scripts/config.lazyload.js"></script>
  <script src="scripts/ui-load.js"></script>
  <script src="scripts/ui-jp.js"></script>
  <script src="scripts/ui-include.js"></script>
  <script src="scripts/ui-device.js"></script>
  <script src="scripts/ui-form.js"></script>
  <script src="scripts/ui-nav.js"></script>
  <script src="scripts/ui-screenfull.js"></script>
  <script src="scripts/ui-scroll-to.js"></script>
  <script src="scripts/ui-toggle-class.js"></script>
  <script src="scripts/ui-taburl.js"></script>
  <script src="scripts/app.js"></script>
  <script src="scripts/site.js"></script>
  <script src="scripts/ajax.js"></script>
<!-- endbuild -->
</body>
</html>
