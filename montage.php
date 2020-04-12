<?php
    session_start();
    if (!isset($_SESSION['logged_on_user']) || $_SESSION['logged_on_user'] == '') {
        header("Location: login.php?redirect=montage");
        exit;
    }
    $stickers = scandir("stickers");
    require 'config/setup.php';

    try {
        $pdo = new PDO($DB_DSN, $DB_USER, $DB_PASSWORD);
        $pdo->setAttribute(PDO::ATTR_ERRMODE,  PDO::ERRMODE_EXCEPTION);

    $sql= "SELECT * 
            FROM photos
            WHERE user_id = ?
            ORDER BY id DESC;";
        $check = $pdo->prepare($sql);
        $check->execute(array($_SESSION['id']));
        $pics = $check->fetchAll();
    } catch(PDOException $ex) { exit($ex); };
?>
<HTML>
<HEAD>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=650">
    <link rel="stylesheet" type="text/css" media="screen" href="css/global.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/montage.css" />
    <link rel="icon" type="image/png" href="img/camagru_crop.png">
    <TITLE>Photo montage</TITLE>
</HEAD>

<BODY>
<div class="wrapper">
        <?php
            include "models/header.php";
        ?>
    </div>
        <div class="mainpart">
            <div class="photo">
                <button class="test" onclick="take_pic()" disabled>Take pic</button>
                <button class="reload" onclick="retake_pic()" disabled>Reload webcam</button>
                <div class="camera">
            <?php if (isset($_GET['name']) && $_GET['name'] != "" && file_exists("pictures/".$_GET['name'])) {
                ?>  <img id="uploaded" src="pictures/<?php echo $_GET['name'];?>">
            <?php } else { ?>
                  <video autoplay="true" id="videoElement"></video>
                <canvas class="mycanva"></canvas>
                <img id="taken">
            <?php } ?>
                    <img class="sticked">
                </div>
                <div class="stickers">
                    <?php foreach ($stickers as $stick) {
                        if ($stick == "." || $stick == "..")
                            continue;
                        else {
                        ?> <img class="stick", src="stickers/<?php echo $stick;?>">
                        <?php }
                        } ?>
                    <div class="arrow_keys">
                        <button id="reset_pos" onclick="reset_pos();">Reset position</button>
                        <button id="plus" onclick="size_sticker(this.id)">+</button>
                        <button id="minus" onclick="size_sticker(this.id)">-</button>
                    </div>
                        <textarea class='combox' id="legend" name='legend' rows='2' cols='60' maxlength="60" placeholder="Write your legend here... 60 characters max"></textarea>
                        <br/>
                        <button class="upload_pic" <?php if (!(isset($_GET['name']) && $_GET['name'] != "" && file_exists("pictures/".$_GET['name']))) {echo "disabled";}?>>POST YOUR IMAGE</button>
                </div>
                <form id="stick_form" action="utils/upload.php" method="post" enctype="multipart/form-data">
                    <input class="hidden" id="choose_file" type="file" name="pic" accept="image/*">
                    <label for="choose_file" class="input_like">Browse</label>
                    <input id="upload" type="submit" value="Upload image from disk" name="submit">
                </form>
            </div>
            <div class="past_mess">
                <p class="instruction">Click on a photo to delete it</p>
                <div id="pastpics">
                    <?php foreach ($pics as $photos) { ?>
                        <div class="pastphoto"><img class="pho" id="<?php echo $photos['id']?>" onclick="erase_pic(<?php echo $photos['id'];?>)" src="<?php echo "pictures/" . $photos['image'];?>"> </div>
                    <?php } ?>
                </div>
            </div>
    </div>
</div>
<?php if (isset ($_GET['error']) && $_GET['error'] == "error_file") {?>
    <div class="error">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <p class="error_text">Error : file uploaded is not an image</p>
    </div>
<?php }?>
<?php if (isset ($_GET['error']) && $_GET['error'] == "nolegend") {?>
    <div class="error">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <p class="error_text">Error : No legend provided</p>
    </div>
<?php }?>
<?php if (isset ($_GET['error']) && $_GET['error'] == "img_pb") {?>
    <div class="error">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <p class="error_text">Error : Uploaded image is not a png/jpeg</p>
    </div>
<?php }?>
<?php if (isset ($_GET['error']) && $_GET['error'] == "no_photo") {?>
    <div class="error">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <p class="error_text">Error : No background image provided</p>
    </div>
<?php }?>
<?php if (isset ($_GET['error']) && $_GET['error'] == "no_sticker") {?>
    <div class="error">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <p class="error_text">Error : No sticker selected</p>
    </div>
<?php }?>
</BODY>

<script async src="js/camera.js"></script>
<script async src="js/ajax.js"></script>
</HTML>