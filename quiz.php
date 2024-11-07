<?php
require 'db.php';

$quiz_id = $_GET['id'];

// Fetch all questions for the quiz
$stmt = $pdo->prepare('SELECT * FROM questions WHERE quiz_id = ?');
$stmt->execute([$quiz_id]);
$questions = $stmt->fetchAll();

// Shuffle the questions array to display them in random order
shuffle($questions);

$time_limit = 10 * 60; // Set the time limit for the quiz in seconds (e.g., 10 minutes = 600 seconds)

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $score = 0;
    $total_questions = count($questions);

    foreach ($questions as $question) {
        $selected_choice = $_POST['question_' . $question['id']];
        $stmt = $pdo->prepare('SELECT * FROM choices WHERE id = ? AND is_correct = 1');
        $stmt->execute([$selected_choice]);
        if ($stmt->fetch()) {
            $score++;
        }
    }

    // Calculate the percentage of correct answers
    $percentage = ($score / $total_questions) * 100;

    // Store the result in the database
    $stmt = $pdo->prepare('INSERT INTO results (quiz_id, user_name, score) VALUES (?, ?, ?)');
    $stmt->execute([$quiz_id, $_POST['user_name'], $score]);

    // Display the score and percentage to the user
    echo "Quiz completed! Your score: $score out of $total_questions (" . round($percentage, 2) . "%)";
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Take Quiz</title>
    
</head>
<body>
<h1>Take Quiz</h1>
    <div>Time Remaining: <span id="timer"></span></div>
    <form id="quiz-form" method="post">
        <label for="user_name">Your Name:</label>
        <input type="text" id="user_name" name="user_name" required><br><br>
        <?php foreach ($questions as $question): ?>
            <fieldset>
                <legend><?= htmlspecialchars($question['question_text']) ?></legend>
                <?php
                // Fetch choices for the current question
                $stmt = $pdo->prepare('SELECT * FROM choices WHERE question_id = ?');
                $stmt->execute([$question['id']]);
                $choices = $stmt->fetchAll();

                // Shuffle the choices array to display them in random order
                shuffle($choices);
                ?>
                <?php foreach ($choices as $choice): ?>
                    <label>
                        <input type="radio" name="question_<?= $question['id'] ?>" value="<?= $choice['id'] ?>" required>
                        <?= htmlspecialchars($choice['choice_text']) ?>
                    </label><br>
                <?php endforeach; ?>
            </fieldset>
        <?php endforeach; ?>
        <button type="submit">Submit</button>
    </form>
</body>

<script>
        <?php echo $time_limit; ?>
        // Timer function
        let timeLimit =  <?php echo $time_limit; ?>;
        let timerDisplay = document.getElementById('timer');
        
        function startTimer() {
            let timer = setInterval(function () {
                let minutes = Math.floor(timeLimit / 60);
                let seconds = timeLimit % 60;
                seconds = seconds < 10 ? '0' + seconds : seconds;
                timerDisplay.textContent = `${minutes}:${seconds}`;
                timeLimit--;
                
                if (timeLimit < 0) {
                    clearInterval(timer);
                    alert("Time's up!");
                    document.getElementById('quiz-form').submit();  // Automatically submit the form when time's up
                }
            }, 1000);
        }

        window.onload = function () {
            startTimer();  // Start the timer as soon as the page loads
        };
    </script>
</html>
