<?php
    require 'config/setup.php';
    session_start();
    if (isset($_GET['error'])) {goto live;}
    if (!isset($_GET['uid']) || $_GET['uid'] == null || !isset($_GET['code']) || $_GET['code'] == "") {
        header("Location: index.php");
        exit;
    }
    else {
    //connect to DB
    try {
        $pdo = new PDO($DB_DSN, $DB_USER, $DB_PASSWORD);
        $pdo->setAttribute(PDO::ATTR_ERRMODE,  PDO::ERRMODE_EXCEPTION);

    //get infos for the given id
    $sql = "SELECT users.id, users.pwd, users.salt, pwreset.code
    FROM `users`
    JOIN `pwreset` ON users.id=pwreset.user_id
    WHERE users.id=:id;";
    $check = $pdo->prepare($sql);
    $check->execute(array(':id' => $_GET['uid']));
    $line = $check->fetch();

    } catch(PDOException $ex) { exit($ex); };

    if ($line === false) {
        header("Location: modif_pw.php?error=wrongaddress");
        exit;
    }
    //check if code is right
    if ($line['code'] != $_GET['code']) {
        header("Location: modif_pw.php?error=wrongaddress");
        exit;
    }
    else {
        if (isset($_POST['pwd']) && $_POST['pwd'] != "" && isset($_POST['re_pwd']) && $_POST['re_pwd'] != "") {
            if (!preg_match("/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,16}$/", $_POST['pwd'])) {
                header("Location: modif_pw.php?error=weak_pw&code=". $_GET['code'] . '&uid=' . $_GET['uid']);
                exit;
            }
            if ($_POST['pwd'] != $_POST['re_pwd']) {
                header("Location: modif_pw.php?error=no_match&code=". $_GET['code'] . '&uid=' . $_GET['uid']);
                exit;
            }
            else {
                try {
                    $salted_pwd = $_POST['pwd'] . $line['salt'];
                    $salted_pwd = hash("sha512", $salted_pwd);
                    $sql = "UPDATE `users`
                    SET `pwd` = ?
                    WHERE `id` = ?";
                    $check = $pdo->prepare($sql);
                    $check->execute(array($salted_pwd, $line['id']));
                } catch(PDOException $ex) { exit($ex); };
                header("Location: index.php");
                }
        }
    }
}
live:
?>
<HTML>
<meta charset="UTF-8">
<meta name="viewport" content="width=650">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/modif_pw.css">
<link rel="icon" type="image/png" href="img/camagru_crop.png">

<HEAD>
    <TITLE>Modify password</TITLE>
</HEAD>

<BODY>
<div class="wrapper">
    <?php include "models/header.php"; ?>
    <div class="container">
        <form action="modif_pw.php?<?php if (isset($_GET['uid']) && isset($_GET['code'])) echo "uid=" . $_GET['uid'] . "&code=" . $_GET['code'] ?>" method="post">
            <h2>Modify password</h2>
            <input class="form-text" type="password" maxlength="50" name="pwd" value="" placeholder="Enter new password" required>
            <br/>
            <input class="form-text" type="password" maxlength="50" name="re_pwd" value="" placeholder="repeat new password" required>
            <input class="send" type="submit" name="submit" value="Change password">
        </form>
    </div>
    <?php if (isset ($_GET['error']) && $_GET['error'] == "wrongaddress") {?>
        <div class="error">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <p class="error_text">Error : Your link is wrong. Please double check the email you received or contact a webmaster if the problem persists</p>
        </div>
    <?php } ?>
    <?php if (isset ($_GET['error']) && $_GET['error'] == "weak_pw") {?>
        <div class="error">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <p class="error_text">Error : Password must contain between 8 and 16 characters, with at least a lowercase, an uppercase and a number</p>
        </div>
    <?php } ?>
    <?php if (isset ($_GET['error']) && $_GET['error'] == "no_match") {?>
        <div class="error">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <p class="error_text">Error : Your passwords do not match, try again.</p>
        </div>
    <?php } ?>
</div>
</BODY>
</HTML>