void gameTab() {
  hearts();
  cursor(ARROW);
  fill(155, 114, 207);
  stroke(47, 24, 75);
  strokeWeight(0);
  
  // Question Square
  fill(115, 74, 167);
  textSize(10);
  text("Pregunta " + questionNum, 305, 35);
  
  // Answer Squares
  fill(155, 114, 207);
  rect(520, 130, 90, 60);
  rect(110, 220, 90, 60);
  rect(520, 310, 90, 60);
  rect(110, 400, 90, 60);
  fill(255);
  textSize(28);
  text("A", 550, 175);
  text("B", 140, 265);
  text("C", 550, 355);
  text("D", 140, 445);
  
  //
  textSize(12);
  cp5.getController("streak").setCaptionLabel("Racha: " + streak);
}

void back() {
  phase = phase - 1;
}

void next() {
  phase = 2;
  float f = float(questions.size());
  int questionSelectedIndex = int(random(f));
  questionSelected = questions.get(int(questionSelectedIndex));
  questionSelected[0] = questionAdjustment(questionSelected[0]);
  for (int i = 1; i < 5; i++) {
    questionSelected[i] = answerAdjustment(questionSelected[i]);
  }
  cp5.getController("question").setCaptionLabel(questionSelected[0]);
  cp5.getController("buttona").setCaptionLabel(questionSelected[1]);
  cp5.getController("buttonb").setCaptionLabel(questionSelected[2]);
  cp5.getController("buttonc").setCaptionLabel(questionSelected[3]);
  cp5.getController("buttond").setCaptionLabel(questionSelected[4]);
}

void buttona() {
  knodeQuestions("a");
}

void buttonb() {
  knodeQuestions("b");
}

void buttonc() {
  knodeQuestions("c");
}

void buttond() {
  knodeQuestions("d");
}

void question() {}

void restart() {
 phase = 0;
 restartPoints();
 reader = createReader("/data/Preguntas.txt");
 readQuestions();
}

void streak() {}

void knodeQuestions(String selectedOption) {
  if (!questions.isEmpty() && lifes > 0) {
    if (checkAnswer(questionSelected[5], selectedOption)) {
      score++;
      streak++;
      if (lifes < 3 && streak % 7 == 0) {
        lifes(1);
      }
    } else {
      lifes(0);      
      perfect = false;
      streak = 0;
    }    
    float longitud = float(questions.size());
    questionSelectedIndex = int(random(longitud));
    questionSelected = questions.get(int(questionSelectedIndex));
    questionSelected[0] = questionAdjustment(questionSelected[0]);
    for (int i = 1; i < 5; i++) {
      questionSelected[i] = answerAdjustment(questionSelected[i]);
    }
    cp5.getController("question").setCaptionLabel(questionSelected[0]);
    cp5.getController("buttona").setCaptionLabel(questionSelected[1]);
    cp5.getController("buttonb").setCaptionLabel(questionSelected[2]);
    cp5.getController("buttonc").setCaptionLabel(questionSelected[3]);
    cp5.getController("buttond").setCaptionLabel(questionSelected[4]);    
    if (streak > bestStreak) {
      bestStreak = streak;
    }
    answeredQuestions.add(questionSelected);
    questions.remove(questionSelectedIndex);
    questionNum++;
  }
  if (lifes <= 0 || questionNum > 50) {
      phase = 3;
   } 
   textSize(8);
   text(textState, 420, 480);
}

void hearts() {
  if (lifes == 3) {
    image(heart, 280, 480);
    image(heart, 340, 480);
    image(heart, 400, 480);
  }
  else if (lifes == 2) {
    image(heart, 280, 480);
    image(heart, 340, 480);
    image(noHeart, 400, 480);
  }
  else if (lifes == 1) {     
    image(heart, 280, 480);
    image(noHeart, 340, 480);
    image(noHeart, 400, 480);
  }
}

void lifes(int op) {
  switch (op) {
    case 0:
    if (lifes == 3) {
      lifes = 2;
    } else if (lifes == 2) {
      lifes = 1;
    } else if (lifes == 1) {
      lifes = 0;
    }
    break;
    case 1:
      if (lifes == 1) {
        lifes = 2;
      } else if (lifes == 2) {
        lifes = 3;
      }
    break;
  }
}

String questionAdjustment(String question) {
  int min = 0;
  if (question.length() <= 40) {
    return question;
  } else if (question.length() > 40 && question.length() <= 65) {
    min = 40;
  } else if (question.length() > 65) {
    min = 65;
  }
  for (int i = min; i <= question.length() - 1; i++) {
    if (question.substring(i, i + 1).equals(" ")) {
      question = question.substring(0, i) + "\n" + question.substring(i + 1);
      break;
    }
  }
  return question;
}

String answerAdjustment(String answer) {
  int min = 0;
  if (answer.length() <= 30) {
    return answer;
  } else if (answer.length() > 30 && answer.length() <= 40) {
    min = 30;
  } else if (answer.length() > 40) {
    min = 40;
  }
  for (int i = min; i <= answer.length() - 1; i++) {
    if (answer.substring(i, i + 1).equals(" ")) {
      print("i = " + i);
      answer = answer.substring(0, i) + "\n" + answer.substring(i + 1);
      break;
    }
  }
  return answer;
}
