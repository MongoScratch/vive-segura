import 'package:mujersegura/models/User.dart';
import 'package:mujersegura/screens/authentication/phone_login_screen.dart';
import 'package:mujersegura/screens/home/DrawerScreen.dart';
import 'package:mujersegura/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../enums/connectivity_status.dart';
import '../offline_screen.dart';
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final connectionStatus = Provider.of<ConnectivityStatus>(context);
    //return either Home or Authenticate Screen
    if(connectionStatus == ConnectivityStatus.Offline)
      return OfflineScreen();
    else if(user != null && connectionStatus != ConnectivityStatus.Offline)
      return DrawerScreen();
    else if (user == null)
      return PhoneLoginScreen();
    else
      return Loading();
  }
}
