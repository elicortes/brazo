import processing.serial.*; //LIBRERIA SERIAL	
import de.voidplus.leapmotion.*; //LIBRERIA LEAP MOTION

Serial port; // Inicializa una instancia nueva de la clase SerialPort
LeapMotion leap;
float processhandx;
float processhandy; // CREAMOS VARIABLES QUE RECIBIRAN LOS DATOS DESDE EL SENSOR
float p;
void setup() {
  size(800, 500, P3D);  
  background(255);
  noStroke(); 
  fill(50);
  println(Serial.list());  //IMPRIME UNA LISTA DE LOS PUERTOS DISPONIBLES
  port= new Serial(this, "COM7", 9600); //UTILIZAMOS EL PUERTO DESCRITO
  leap = new LeapMotion(this); //CREAMOS UN OBJETO
}
void draw() {
  background(255);
  int fps = leap.getFrameRate(); //CUADROS POR SEGUNDO
  for (Hand hand : leap.getHands()) {
    hand.draw();		//DIBUJA LA MANO
    PVector hand_position    = hand.getPosition(); //OBTIENE LA POSICION
    float str = hand.getGrabStrength(); // OBTENEMOS EL VALOR DEPENDIENDO DEL CERRADO DE 
    PVector hand_dynamics = hand.getDynamics() ; //LA MANO
    int finger_count    = hand.countFingers();
    boolean  get_finger = hand.hasFingers();

    if (hand_position.x<20) { 
      processhandx = 0;
    } else if (hand_position.x>=780) { // MANTENEMOS EL VALOR EN CIERTO RANGO
      processhandx = 179;
    } else {
      processhandx = map(hand_position.x, 20, 780, 0, 179); //Re-asigna un número de un 
    }								//rango a otro.

    if (hand_position.y<50) {
      processhandy = 0;
    } else if (hand_position.y>=450) { // MANTENEMOS EL VALOR EN CIERTO RANGO
      processhandy = 179;
    } else {
      processhandy = map(hand_position.y, 50, 450, 0, 179); //Re-asigna un número de un 
    }								//rango a otro.

    if (str< 0) {
      p = 0;
    } else if (str>=1) { // MANTENEMOS EL VALOR EN CIERTO RANGO
      p = 90;
    } else {
      p = map(str, 0, 1, 0, 90); //Re-asigna un número de un rango a otro.
    }

    byte[] q = {
      byte(processhandx), byte(processhandy), byte(p) //LE DAMOS LOS VALORES CAPTURADOS
    };
    println(q);

    port.write(q); // ESCRIBE LO VALORES
  }
}