Brazo con arduino y funcionamiento con java


1.-Los materiales son : 

2 arduinos
Un proto
Leds
Pulsadores (para hacerle un reset).
Sensor LEAP
Que tengas instalado el processing, NetBeans y el programa de arduino
4 servomotores
1 motor a pasos
Tornillos 
Arduino SHIELD V5 (este nos va a servir para conectar todos los servomotores)
Un caja mediana (para hacer la base en donde va a ir el motor )
Cables de telefono (que tambien sean macho y macho,o tambien sea hembra y hembra y tambien ocupamos macho y hembra)
Cables USB para los arduinos(para conectar los arduinos hacia la computadora)
Desarmador
Pistola de silicon
Una computadora



2.-Lo que se tiene que hacer es descargar algunas librerias donde adentro de los archivos .ion y .java
se les indicaran que y que librerias se utilizaran.


Funcionamiento : El brazo es impreso en 3D,estuvimos investigando como es se armaba y que podiamos agregarle, se usa processing y java para mandar señales al arduino y que esta las refleje en el brazo, en caso de java controla los grados de los servomotores y processing es el que se encarga del sensor LEAP Motion, en le cula se manda las coordenadas detectadas por el brazo generando entradas al serial que hace que los motores sigan el movimiento de la mano humana.
En java como ya habiamos comentado es el encargado de que este maneje uno por uno los servomotores al igual manda señal al motor de pasos, que es lo que hace el motor de pasos, este es la base en el cual puede rotar los 360 grados
Tambien en java le pusismos un boton en el cual se puede mandar a ejecutar todos los grados ya sea a la izquierda, derecha, codo o brazo, esto nos permite ver como funciona de un lado al otro pero sin estar capturando uno por uno este ya te lo hace automaticamente(tambien tiene la opcion de uno por uno), le dimos un timepo de espera en el cual son 10 segundos para que cada servomotor haga su funcion(es dormir java por 10 en el codigo se indicara que y que se hace mas especificamente).


