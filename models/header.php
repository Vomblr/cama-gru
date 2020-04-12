<div class="head">
    <a href="index.php"><img class="logo" src="img/camagru_logo.png"></a>
    <a class="montage" href="montage.php">Post</a>
    <a class="leaderboard" href="leaderboard.php?order=alpha">Leaderboard</a>
<?php if (!isset($_SESSION['logged_on_user']) || $_SESSION['logged_on_user'] == "") { ?>
    <a class="login" href="login.php">Sign in</a>
    <a class="signup" href="create_account.php">Sign up</a>
<?php }
    else { ?>
    <a class="Logout" href="models/logout.php">Logout</a>
    <a class="login" href="account.php">My account</a>
<?php } ?>
</div>