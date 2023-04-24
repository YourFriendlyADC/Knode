import processing.core.PImage as PImage

def setup():
    # Screen size
    size(720, 540)
    
    # Images
    #icon = loadImage("images/icon.png")
    #surface.setIcon(icon)
    
    # Font
    
def draw():
    background(229, 229, 229)
    mainTab()
    
def mainTab():
    fill(20, 33, 61)
    textSize(36)
    text("Trivia!", 320, 70)
    fill(252, 163, 17)
    rect(60, 160, 600, 100, 10, 10, 10, 10)
    rect(60, 300, 280, 60, 10, 10, 10, 10)
    rect(380, 300, 280, 60, 10, 10, 10, 10)
    rect(60, 400, 280, 60, 10, 10, 10, 10)
    rect(380, 400, 280, 60, 10, 10, 10, 10)
        
