import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
SineWave sine;

Capture video;
OpenCV opencv;
PImage intro;
int pantalla=0;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_RIGHT_EAR);  
  intro = loadImage ("Intro.png");
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
  video.start();
}

void draw() {
  Pantallas();
}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed(){ 
if ( key == 'm' ) 
{if (out.isMuted()) 
{ 
out.unmute(); 
} 
else 
{ 
out.mute(); 
} 
} 
} 