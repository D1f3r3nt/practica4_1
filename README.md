# Practica 4.1

Esta práctica esta dedicada a practicar el Shared Preferences, para ello se ha ralizado una app relacionada con un reloj, donde la lógica de guardado estara relacionada con dos tipos de variables permanentes.

### Sesión

La primera sera una variable booleana donde podremos comprobar si es la primera vez que el usuario usa esta app, ya que en caso de que si que sea su primera vez le saldra una empecie de mini tutorial realizada con Flutter Discovery, en caso contrario (no sea la primera vez que use la app) no saldra el tutorial.

### Alarmas

La seguna sera una lista de variables de tipo String, estas contendran la información de la hora de la alarma (TimeOfDay) y si esta activada (Boolean).

Por otra parte, referente a las alarmas, se ha usado Flutter Local Notifications para mostrar una notificación al momento de la alarma, se ha usado Flutter Ringtone Player para ejecutar el sonido de la alarma y se a usado Alarm Manager para que se pueda ejecutar la funcion de alarma, en caso de que la aplicacion este parada o incluso el movil este parado (Standbye).

## Primeros pasos

Para poder ejecutar correctamente el codigo se recomienda, ejecutar la siguiente instruccion para descargar las librerias:

    flutter pub get

Y para arrancar la aplicacion:

    flutter run ./lib/main.dart
