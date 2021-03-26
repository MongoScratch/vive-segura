/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LatLng _center = const LatLng(19.6274851, -99.1049958);
  GoogleMapController mapController;
  List<Marker> _markers = <Marker>[];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    _onPressed();
    super.initState();
  }

  final firestoreInstance = Firestore.instance;

  void _onPressed() {
    firestoreInstance.collection("markito").snapshots().listen((result) {
      result.documentChanges.forEach((res) {
        print('Lat: ' +
            res.document.data['location'].latitude.toString() +
            'Long: ' +
            res.document.data['location'].longitude.toString());
        _markers.add(
          Marker(
            markerId: MarkerId(res.document.documentID),
            position: LatLng(res.document.data['location'].latitude, res.document.data['location'].longitude),
            infoWindow: InfoWindow(title: res.document.documentID)
          ),
        );
        setState(() {
          _markers = _markers;
        });
        /* if (res.type == DocumentChangeType.added) {
          print("added");
          print('Lat: ' +
              res.document.data['location'].latitude.toString() +
              'Long: ' +
              res.document.data['location'].longitude.toString());
        } else if (res.type == DocumentChangeType.modified) {
          print("modified");
          print('Lat: ' +
              res.document.data['location'].latitude.toString() +
              'Long: ' +
              res.document.data['location'].longitude.toString());
        } else if (res.type == DocumentChangeType.removed) {
          print("removed");
          print('Lat: ' +
              res.document.data['location'].latitude.toString() +
              'Long: ' +
              res.document.data['location'].longitude.toString());
        } */
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Admin'),
          backgroundColor: Colors.red[800],
          /* actions: [
            IconButton(icon: Icon(Icons.my_location), onPressed: _onPressed)
          ], */
        ),
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
            markers: Set<Marker>.of(_markers)),
      ),
    );
  }
}
 */