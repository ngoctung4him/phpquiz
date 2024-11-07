<?php
require 'db.php';

// Fetch all results sorted by submission time (latest first)
$stmt = $pdo->query('SELECT * FROM results ORDER BY completed_at DESC');
$results = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz Results</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>All Quiz Results</h1>
    <table>
        <thead>
            <tr>
                <th>User Name</th>
                <th>Quiz Title</th>
                <th>Score</th>
                <th>Date Submitted</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($results as $result): ?>
                <?php
                // Fetch the quiz title
                $stmt = $pdo->prepare('SELECT title FROM quizzes WHERE id = ?');
                $stmt->execute([$result['quiz_id']]);
                $quiz = $stmt->fetch();
                ?>
                <tr>
                    <td><?= htmlspecialchars($result['user_name']) ?></td>
                    <td><?= htmlspecialchars($quiz['title']) ?></td>
                    <td><?= htmlspecialchars($result['score']) ?></td>
                    <td><?= htmlspecialchars($result['completed_at']) ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
