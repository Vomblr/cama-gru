<?php
    session_start();
    require 'config/setup.php';
?>
<HTML>

<HEAD>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=650" />
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/gallery.css">
    <link rel="icon" type="image/png" href="img/camagru_crop.png">
    <TITLE>Camagru</TITLE>
</HEAD>

<BODY onload="infinite_display(0, 0)">
    <div class="wrapper">
        <?php include "models/header.php"; ?>
        <div class="gallery"></div>
        <?php include "models/footer.php"; ?>
        <?php if (isset ($_GET['success']) && $_GET['success'] == "welcome") {?>
            <div class="success">
                <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                <p class="error_text">Привет <?php echo $_SESSION['logged_on_user'];?>, добро пожаловать на Camagru !!!</p>
            </div>
        <?php }?>
    </div>
</BODY>
<script async src="js/comment.js"></script>
<script async src="js/like.js"></script>
<script async src="js/infinite.js"></script>
</HTML>