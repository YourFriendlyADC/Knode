import java.util.ArrayList;
import java.util.Random;
import java.util.List;
import java.io.IOException;

BufferedReader reader;
private boolean checkAnswer(String correctAnswer, String selectedAnswer) {
  return correctAnswer.equals(selectedAnswer);
}

void readQuestions() {
  questions.clear();
  answeredQuestions.clear();
  try {
    String line;
    List<String> tempQuestion = new ArrayList<>();
    while ((line = reader.readLine()) != null) {
      line = line.trim();
      if (!line.isEmpty()) {
        tempQuestion.add(line);
      } else {
        questions.add(tempQuestion.toArray(new String[0]));
        tempQuestion.clear();
      }
    }
    questions.add(tempQuestion.toArray(new String[0]));
  } catch (IOException e) {
    e.printStackTrace();
  }
}
