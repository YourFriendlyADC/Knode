import processing.javafx.*;
import controlP5.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer[] songs;
boolean isPlaying = false;
int currentSong = 0;

ControlP5 cp5;
PFont font, font2;
PImage icon, knodieS, knodieH, knodieL, button, heart, noHeart, volume, mute;
String preguntas[][] = new String[50][5];
List<String[]> questions = new ArrayList<>();
List<String[]> answeredQuestions = new ArrayList<>();
boolean perfect = true;
String questionSelected[], textState = "", line1 = "", line2 = "";
int phase = 0, questionNum = 1, score = 0, lifes = 3, streak = 0, bestStreak = 0, questionSelectedIndex;

void setup() {
  // Screen Size
  size(720, 540, FX2D);
  surface.setResizable(false);
  // Images
  icon = loadImage("/images/icon.png");
  knodieL = loadImage("/images/knodie-3.png");
  knodieH = loadImage("/images/knodie-2.png");
  knodieS = loadImage("/images/knodie-1.png");
  button = loadImage("/images/button.png");
  heart = loadImage("/images/heart.png");
  noHeart = loadImage("/images/no-heart.png");
  volume = loadImage("/images/volume.png");
  volume.resize(40, 40);
  mute = loadImage("/images/mute.png");
  mute.resize(40, 40);
  surface.setIcon(icon);

  // Font
  font = createFont("PressStart2P-Regular.ttf", 12);
  font2 = createFont("PressStart2P-Regular.ttf", 8);
  textFont(font);

  // Sound
  minim = new Minim(this);
  songs = new AudioPlayer[9];
  for (int i = 1; i <= songs.length; i++) {
    songs[i-1] = minim.loadFile("/Music/" + i + ".mp3");
  }
  // File
  reader = createReader("/data/Preguntas.txt");
  readQuestions();

  // Buttons
  cp5 = new ControlP5(this);
  cp5.addButton("back")
    .setPosition(40, 480)
    .setFont(font)
    .setSize(100, 30)
    .setColorBackground(color(115, 74, 167))
    .setColorForeground(color(47, 24, 75))
    .setColorActive(color(155, 114, 207))
    .setCaptionLabel("Atrás")
    ;
  cp5.addButton("next")
    .setPosition(520, 480)
    .setFont(font)
    .setSize(160, 30)
    .setColorBackground(color(115, 74, 167))
    .setColorForeground(color(47, 24, 75))
    .setCaptionLabel("Siguiente")
    .setColorActive(color(155, 114, 207))
    ;
  cp5.addButton("buttona")
    .setPosition(110, 130)
    .setFont(font2)
    .setSize(400, 60)
    .setColorBackground(color(115, 74, 167))
    .setColorForeground(color(155, 114, 207))
    .setColorActive(color(155, 114, 207))
    ;
  cp5.addButton("buttonb")
    .setPosition(210, 220)
    .setFont(font2)
    .setSize(400, 60)
    .setColorBackground(color(115, 74, 167))
    .setColorForeground(color(155, 114, 207))
    .setColorActive(color(155, 114, 207))
    ;
  cp5.addButton("buttonc")
    .setPosition(110, 310)
    .setFont(font2)
    .setSize(400, 60)
    .setColorBackground(color(115, 74, 167))
    .setColorForeground(color(155, 114, 207))
    .setColorActive(color(155, 114, 207))
    ;
  cp5.addButton("buttond")
    .setPosition(210, 400)
    .setFont(font2)
    .setSize(400, 60)
    .setColorBackground(color(115, 74, 167))
    .setColorForeground(color(155, 114, 207))
    .setColorActive(color(155, 114, 207))
    ;
  cp5.addButton("question")
    .setPosition(40, 40)
    .setFont(font2)
    .setSize(640, 70)
    .setColorBackground(color(115, 74, 167))
    .setColorForeground(color(115, 74, 167))
    .setColorActive(color(115, 74, 167))
    ;
  cp5.addButton("restart")
    .setPosition(40, 480)
    .setFont(font)
    .setSize(140, 30)
    .setColorBackground(color(115, 74, 167))
    .setColorForeground(color(47, 24, 75))
    .setColorActive(color(155, 114, 207))
    .setCaptionLabel("Reiniciar")
    ;
  cp5.addButton("streak")
    .setPosition(565, 480)
    .setFont(font)
    .setSize(130, 30)
    .setColorBackground(color(115, 74, 167))
    .setColorForeground(color(115, 74, 167))
    .setColorActive(color(115, 74, 167))
    .setCaptionLabel("Racha: 0")
    ;
  cp5.addBang("Sonido")
    .setPosition(15, 15)
    .setSize(40, 40)
    .setImage(mute)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ;
}

void draw() {
  background(200, 177, 228);
  if (isPlaying) {
    if (!songs[currentSong].isPlaying()) {
      currentSong = int(random(songs.length));
      songs[currentSong].rewind();
      songs[currentSong].play();
    }
  } 
  switch (phase) {
  case 0:
    cp5.getController("back").hide();
    cp5.getController("next").hide();
    cp5.getController("buttona").hide();
    cp5.getController("buttonb").hide();
    cp5.getController("buttonc").hide();
    cp5.getController("buttond").hide();
    cp5.getController("question").hide();
    cp5.getController("restart").hide();
    cp5.getController("streak").hide();
    cp5.getController("Sonido").show();
    mainTab();
    break;
  case 1:
    cp5.getController("back").show();
    cp5.getController("next").show();
    cp5.getController("buttona").hide();
    cp5.getController("buttonb").hide();
    cp5.getController("buttonc").hide();
    cp5.getController("buttond").hide();
    cp5.getController("question").hide();
    cp5.getController("restart").hide();
    cp5.getController("streak").hide();
    cp5.getController("Sonido").hide();
    instrucciones();
    break;
  case 2:
    cp5.getController("back").show();
    cp5.getController("next").hide();
    cp5.getController("buttona").show();
    cp5.getController("buttonb").show();
    cp5.getController("buttonc").show();
    cp5.getController("buttond").show();
    cp5.getController("question").show();
    cp5.getController("restart").hide();
    cp5.getController("streak").show();
    cp5.getController("Sonido").hide();
    gameTab();
    break;
  case 3:
    cp5.getController("back").hide();
    cp5.getController("next").hide();
    cp5.getController("buttona").hide();
    cp5.getController("buttonb").hide();
    cp5.getController("buttonc").hide();
    cp5.getController("buttond").hide();
    cp5.getController("question").hide();
    cp5.getController("restart").show();
    cp5.getController("streak").hide();
    cp5.getController("Sonido").hide();
    gameOverTab();
    break;
  }
}

public void Sonido() {
  if (isPlaying) {
    cp5.getController("Sonido").setImage(mute);
    songs[currentSong].pause();
  } else {
    cp5.getController("Sonido").setImage(volume);
    currentSong = int(random(songs.length));
    songs[currentSong].rewind();
    songs[currentSong].play();
  }
  isPlaying = !isPlaying;
}

void stop() {
  for (AudioPlayer song : songs) {
    song.close();
  }
  minim.stop();
  super.stop();
}
