void Pantallas(){
switch (pantalla){
case 0:
image (intro, 0,0);
if (keyPressed){
if (key == 'e' || key =='E'){
pantalla=1;
}
}
break;

case 1:
scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    ellipseMode(CORNER);
    ellipse(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    float freq = map(faces[i].x, 0, width, 0, 1500);
    sine.setFreq(freq);
     float amp = map(faces[i].y, 0, height, 0, 1500);
    sine.setAmp(amp);
    
  }
  
   for(int i = 0; i < out.bufferSize() - 1; i++)
 {
   stroke(0,200,0);
   float x1 = map(i, 0, out.bufferSize(), 0, width);
   float x2 = map(i+1, 0, out.bufferSize(), 0, width);
   line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
   line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
 }
  
  textSize(8);
  fill(255);
  text("Controla la frecuencia y la amplitud utilizando tu oído izquierdo", 20,20);
  text("moviéndolo a lo largo y ancho de la pantalla.", 20, 30);
  text("Presiona 'm' para silenciar.", 20, 40);
  break;
}
}