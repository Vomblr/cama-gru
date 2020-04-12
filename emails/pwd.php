<?php
$message = "<h1>Привет " . $user['name'] . "!!!</h1>" .
    "<p>Для того, чтобы подтвердить смену пароля, перейдите по " .
    "<a href='https://camagru.mcdir.ru/modif_pw.php?uid=" . $user['id'] . "&code=" . $code . "'>данной ссылке</a></p>";
