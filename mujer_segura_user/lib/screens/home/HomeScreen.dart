import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mujersegura/utils/to_hex.dart';

//Header
String header = "Mantén presionado el botón para activar la ayuda";
String header_0 = "Mantén presionado el botón para activar la ayuda";
String header_1 = "La policia de genero esta en camino";

//Panico
String alerta = "";
String alerta_0 = "";
String alerta_1 = 'Deja presionado el botón para desactivar la alerta';

//Tema
String themeStatus = "#845EC2";
String themeStatus_0 = "#845EC2";
String themeStatus_1 = "#CA1515";

//statusAlert
bool _status_alert = false;
bool _status_alert_0 = false;
bool _status_alert_1 = true;

class HomeScreen extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

final firestoreInstance = Firestore.instance;

class _HomeState extends State<HomeScreen> {
  var geolocator = Geolocator();
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  var firebaseUser = FirebaseAuth.instance.currentUser();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GeolocationStatus>(
        future: Geolocator().checkGeolocationPermissionStatus(),
        builder:
            (BuildContext context, AsyncSnapshot<GeolocationStatus> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildListView();
        });
  }

  Widget _buildListView() {
    final List<Widget> listItems = <Widget>[
      Container(
        margin: EdgeInsets.only(left: 20, right: 20.0, top: 50.0),
        child: Text(
          header,
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: HexColor(themeStatus)),
          textAlign: TextAlign.center,
        ),
      ),
      Card(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
          elevation: 10.0,
          color: HexColor(themeStatus),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
          child: InkWell(
              child: Container(
                margin: EdgeInsets.all(16),
                child:
                    Image.asset("assets/images/sos.png", fit: BoxFit.contain),
              ),
              onLongPress: () async {
                var firebaseUser = await FirebaseAuth.instance.currentUser();
                firestoreInstance
                      .collection('users')
                      .where('uid', isEqualTo: firebaseUser.uid)
                      .snapshots()
                      .listen((result) {
                    result.documentChanges.forEach((res) {
                      if (res.type == DocumentChangeType.added) {
                        print("added");
                        print(res.document.data);
                      } else if (res.type == DocumentChangeType.modified) {
                        setState(() {
                          _status_alert = res.document['alert'];
                          if (_status_alert == _status_alert_0) {
                              _status_alert = _status_alert_1;
                          } else {
                              _status_alert = _status_alert_0;
                          }
                        });
                      } else if (res.type == DocumentChangeType.removed) {
                        print("removed");
                        print(res.document.data);
                      }
                    });
                  });
                setState(() {
                  
                  if (alerta == alerta_0 &&
                      themeStatus == themeStatus_0 &&
                      header == header_0) {
                    alerta = alerta_1;
                    themeStatus = themeStatus_1;
                    header = header_1;
                    print(themeStatus);
                  } else if (alerta == alerta_1 &&
                      themeStatus == themeStatus_1 &&
                      header == header_1) {
                    alerta = alerta_0;
                    themeStatus = themeStatus_0;
                    header = header_0;
                    print(themeStatus);
                  }
                  if (_status_alert == _status_alert_0) {
                    _status_alert = _status_alert_1;
                  } else {
                    _status_alert = _status_alert_0;
                  }
                  

                  changueAlert();

                  print(_status_alert);
                  StreamSubscription<Position> positionStream = geolocator
                      .getPositionStream(locationOptions)
                      .listen((Position position) async {
                    print(position == null
                        ? 'Unknown'
                        : position.latitude.toString() +
                            ', ' +
                            position.longitude.toString());
                    firestoreInstance
                        .collection("users")
                        .document(firebaseUser.uid)
                        .updateData({
                      "location":
                          GeoPoint(position.latitude, position.longitude)
                    }).then((_) {
                      print("success!");
                    });
                  });
                });
              })),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20.0, top: 40.0),
        child: Text(
          alerta,
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: HexColor(themeStatus)),
          textAlign: TextAlign.center,
        ),
      ),
    ];

    return ListView(
      children: listItems,
    );
  }

  void changueAlert() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    firestoreInstance
        .collection("users")
        .document(firebaseUser.uid)
        .updateData({"alert": _status_alert}).then((_) {
      print("success!");
    });
  }
}
