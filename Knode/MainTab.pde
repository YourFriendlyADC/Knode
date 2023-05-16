void mainTab() {
    fill(47, 24, 75);
    textSize(32);
    text("Knode", 280, 80);    
    image(knodieS, 280, 140, 150, 150);
    textSize(10);
    text("Ningún derecho reservado ©", 230, 540);    
    playButton();
}

void playButton() {
    image(button, 265, 340);
    fill(255);    
    textSize(24);
    text("Jugar!", 290, 380);    
    if (mouseX > 250 && mouseX < 460 && mouseY > 330 && mouseY < 410) {
        cursor(HAND);
        if (mousePressed) {
            phase = 1;
        }
    } else {
        cursor(ARROW);
    }
}
