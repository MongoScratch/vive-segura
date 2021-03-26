import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  State createState() {
    return _HelpScreenState();
  }
}

//@override
//  _HelpScreenState createState() => _HelpScreenState();
class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 40.0),
            child: Text(
              '¿QUE ES BOTÓN VIOLETA, SALVA TU VIDA?',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 10.0),
            child: Text(
              '- Es una aplicación que ofrece un servicio de disuasión y salvaguarda para mujeres en peligro de violencia física o sexual. En caso de necesitar ayuda, se activa enviando una alerta y geolocalización de la víctima, tanto a contactos personales como a usuarios de la propia aplicación que se encuentran cercanos a ella.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 10.0),
            child: Text(
              '- Una aplicación para Android que permite al usuario enviar una alerta a los contactos que desee para que estos puedan asistirlo en caso de emergencia.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 40.0),
            child: Text(
              'OBJETIVO GENERAL',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 10.0),
            child: Text(
              'Fortalecer las diferentes acciones y estrategias que lleva a cabo el Gobierno de Coacalco de Berriozabal para garantizar a las mujeres victimas de violencia el acceso a herramientas de ayuda y acompañamiento.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 40.0),
            child: Text(
              'OBJETIVOS ESPECIFICOS',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 10.0),
            child: Text(
              '- Ofrecer a través de una herramienta de fácil acceso un servicio de protección y salvaguarda para mujeres en peligro de violencia.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 10.0),
            child: Text(
              '- Brindar a las mujeres victimas de violencia una aplicación para Android que permite a la mujer usuaria enviar una alerta en caso de emergencia.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 40.0),
            child: Text(
              '¿Ventajas?',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 10.0),
            child: Text(
              '- La principal ventaja con respecto al BOTON VIOLETA, SALVA TU VIDA es la instalación en cualquier celular con sistema Android, es una manera fácil en que se dispara la alerta con un solicitud de auxilio directamente al Centro de Mando de Emergencias Coacalco y el Instituto para la Defensa de los Derechos de la Mujer, así como su ubicación en tiempo real.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: Text(
              '- Con solo iniciar la aplicación en el celular de una mujer que esta en peligro se envía a dos contactos seleccionados por ella misma su ubicación así como su solicitud de auxilio.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: Text(
              '- Contar con estas facilidades es esencial hoy en día cuando continuamente muchas mujeres se encuentran en riesgo.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20.0, top: 40.0),
            child: Text(
              'COMO FUNCIONA:',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: Text(
              '-El funcionamiento es muy simple: una vez que la aplicación está descargada, se agenda el nombre de la usuaria y el de dos contactos, quienes también deben tener descargada la aplicación en sus celulares a quienes les llegará de manera simultánea, en caso de activarse, una notificación de alerta con el pedido de ayuda y la ubicación del celular.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
