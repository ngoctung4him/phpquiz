<?php
require 'db.php';
$stmt = $pdo->query('SELECT * FROM quizzes');
$quizzes = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz List</title>
</head>
<body>
    <h1>Available Quizzes</h1>
    <ul>
        <?php foreach ($quizzes as $quiz): ?>
            <li><a href="quiz.php?id=<?= $quiz['id'] ?>"><?= htmlspecialchars($quiz['title']) ?></a></li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
