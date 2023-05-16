void gameOverTab() {
 if (lifes > 0) {
   text("¡Felicitaciones!", 240, 100);
   if (perfect) {
        textState = "¡Puntaje perfecto, no perdiste ni\nuna sola vida!\nTu puntaje: " + score + " respuestas correctas\nTu mejor racha de respuestas fue: " + bestStreak;
   } else {
        textState = "Puntaje: " + score + " respuestas correctas\nMejor racha de respuestas: " + bestStreak;
       }
       image(knodieL, 310, 130);
  } else {
    text("¡Game over!", 270, 100);
     if (score != 1) {
       textState = "Puntaje: " + score + " respuestas correctas\nMejor racha de respuestas: " + bestStreak;
     } else {
        textState = "Puntaje: " + score + " respuesta correcta\nMejor racha de respuestas: " + bestStreak;
     }
     image(knodieS, 310, 130);
  }
  textSize(16);
  fill(115, 74, 167);
  text(textState, 110, 280);
}

void restartPoints() {
 questionNum = 1;
 score = 0;
 lifes = 3;
 streak = 0;
 bestStreak = 0;
 perfect = true; 
}
