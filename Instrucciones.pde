void instrucciones() {
  cursor(ARROW);
  textSize(22);
  fill(255);
  text("Instrucciones", 230, 80);
  //circle(40, 40, 30);
  image(knodieH, 40, 125);
  strokeWeight(0);
  fill(155, 114, 207);
  rect(150, 145, 460, 55, 5, 5, 5, 5);
  fill(255);
  textSize(10);
  text("Te explico el juego, tienes 3 vidas para \ncontestar las 50 preguntas. Cada vez que \nrespondes correctamente tu puntaje aumenta.", 160, 165);
  
  image(knodieS, 580, 225);
  strokeWeight(0);
  fill(155, 114, 207);
  rect(110, 245, 460, 55, 5, 5, 5, 5);
  fill(255);
  textSize(10);
  text("Sin embargo, si te equivocas pierdes 1 vida, \naún así, si entras en una racha de 7 \nrespuestas correctas recuperarás 1.", 120, 265);
  
  image(knodieL, 40, 325);
  strokeWeight(0);
  fill(155, 114, 207);
  rect(150, 345, 530, 70, 5, 5, 5, 5);
  fill(255);
  textSize(10);
  text("En realidad no estoy muy seguro de si así funciona \nel juego. LLegué de alguna forma por un agujero \nnegro y alguien me dijo que les dijera esto. De \ntodas formas, ¡Buenas suerte!", 160, 365);
}
