import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mujersegura/models/User.dart';
import 'package:mujersegura/services/database_service.dart';
import 'package:mujersegura/shared/get_user_details.dart';
import 'package:mujersegura/shared/loading.dart';
import 'package:mujersegura/shared/signout_widget.dart';
import 'package:mujersegura/utils/to_hex.dart';
import 'package:provider/provider.dart';

import 'HelpScreen.dart';
import 'HomeScreen.dart';
import 'HowScreen.dart';
import 'ProfileScreen.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class DrawerScreen extends StatefulWidget {
  @override
  State createState() {
    return _DrawerScreenState();
  }

  final drawerItems = [
    new DrawerItem('Boton', CupertinoIcons.check_mark_circled),
    new DrawerItem('Perfil', Icons.person_outline),
    new DrawerItem('¿Como Funciona?', Icons.settings),
    new DrawerItem('¿Quienes somos?', Icons.info),
  ];
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return ProfileScreen();
        break;
      case 2:
        return HowScreen();
        break;
      case 3:
        return HelpScreen();
      break;
      default:
        return Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon, color: HexColor(themeStatus)),
        title: Text(d.title,style: TextStyle(color: HexColor(themeStatus))),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    User user1 = Provider.of<User>(context);
    final DatabaseService _db = DatabaseService(user: user1);
    return StreamBuilder(
      stream: _db.userData,
      builder: (context, snapshot) {
        User user = snapshot.data;
        _db.user = user;
        if (snapshot.hasData) {
          if (user.gender == null) {
            print(user.gender);
            return GetUserDetails();
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: HexColor(themeStatus),
                actions: [
                  isLoading ? SpinKitRing(color: Colors.white) : IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
                    setState(() => isLoading = true);
                    SignOut(context).whenComplete(() {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  })
                ],
              ),
              drawer: Drawer(
                child: Column(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: HexColor(themeStatus)),
                      currentAccountPicture: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/coacalco-87ea4.appspot.com/o/profiles%2F91007063_2686680238120452_1097649707913576448_o.jpg?alt=media&token=84177e0a-6076-4e23-824b-cd677c7b2f03"),
                      ),
                      accountName: Text(user.name),
                      accountEmail: Text(user.phoneNumber)
                    ),
                    Column(children: drawerOptions)
                  ],
                ),
              ),
              body: _getDrawerItemWidget(_selectedDrawerIndex),
            );
          }
        } else {
          return Loading();
        }
      },
    );
  }
}
