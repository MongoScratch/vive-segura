import 'dart:io' show Platform;


import 'package:flutter/material.dart';
import 'package:mujersegura/shared/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'enums/connectivity_status.dart';
import 'models/User.dart';
import 'screens/authentication/wrapper.dart';
import 'services/auth_service.dart';
import 'services/connectivity_service.dart';

//void main()=> runApp(new MyApp());


int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen =  prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('Active Screen ${initScreen}');
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().onAuthStateChanged,
        ),
        StreamProvider<ConnectivityStatus>.value(
          value: ConnectivityService().onConnectivityChanged,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mujer Segura',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
        routes: {
          '/': (context) => Wrapper(),
          "first": (context) => OnboardingScreen(),
        },
      )
    );
  }
}