<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['csv_file'])) {
    $file = $_FILES['csv_file']['tmp_name'];
    
    if (($handle = fopen($file, 'r')) !== FALSE) {
        // Skip the first line if it contains headers
        fgetcsv($handle);
        
        $pdo->beginTransaction();
        
        try {
            $currentQuizId = null;
            while (($data = fgetcsv($handle, 1000, ',')) !== FALSE) {
                // Extract data from the CSV row
                list($quizTitle, $quizDescription, $questionText, $choice1, $choice1Correct, $choice2, $choice2Correct, $choice3, $choice3Correct, $choice4, $choice4Correct) = $data;

                // Insert Quiz if not already inserted
                if ($currentQuizId === null || $quizTitle !== $previousQuizTitle) {
                    $stmt = $pdo->prepare("INSERT INTO quizzes (title, description) VALUES (?, ?)");
                    $stmt->execute([$quizTitle, $quizDescription]);
                    $currentQuizId = $pdo->lastInsertId();
                }

                // Insert Question
                $stmt = $pdo->prepare("INSERT INTO questions (quiz_id, question_text) VALUES (?, ?)");
                $stmt->execute([$currentQuizId, $questionText]);
                $questionId = $pdo->lastInsertId();

                // Insert Choices
                $choices = [
                    ['text' => $choice1, 'correct' => $choice1Correct],
                    ['text' => $choice2, 'correct' => $choice2Correct],
                    ['text' => $choice3, 'correct' => $choice3Correct],
                    ['text' => $choice4, 'correct' => $choice4Correct],
                ];

                foreach ($choices as $choice) {
                    $stmt = $pdo->prepare("INSERT INTO choices (question_id, choice_text, is_correct) VALUES (?, ?, ?)");
                    $stmt->execute([$questionId, $choice['text'], $choice['correct']]);
                }

                $previousQuizTitle = $quizTitle;
            }
            
            $pdo->commit();
            echo "Quiz uploaded successfully!";
        } catch (Exception $e) {
            $pdo->rollBack();
            echo "Failed to upload quiz: " . $e->getMessage();
        }
        
        fclose($handle);
    } else {
        echo "Error opening the file.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Quiz</title>
</head>
<body>
    <h1>Upload Quiz from CSV</h1>
    <form action="upload_quiz.php" method="post" enctype="multipart/form-data">
        <label for="csv_file">Choose CSV file:</label>
        <input type="file" name="csv_file" id="csv_file" accept=".csv" required>
        <button type="submit">Upload</button>
    </form>
</body>
</html>
