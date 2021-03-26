import 'package:flutter/cupertino.dart';
import 'package:mujersegura/models/User.dart';
import 'package:mujersegura/services/database_service.dart';
import 'package:mujersegura/shared/get_user_details.dart';
import 'package:mujersegura/shared/loading.dart';
import 'package:mujersegura/shared/signout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

   @override
  Widget build(BuildContext context) {
    User user1 = Provider.of<User>(context);
    final DatabaseService _db = DatabaseService(user: user1);
    return StreamBuilder(
      stream: _db.userData,
      builder: (context, snapshot){
        User user = snapshot.data;
        _db.user = user;
        if(snapshot.hasData){
          if(user.gender == null) {
            print(user.gender);
            return GetUserDetails();
          }
          else
            return Scaffold(
              appBar: AppBar(),
              drawer: Drawer(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        UserAccountsDrawerHeader(
                          decoration: BoxDecoration(color: Colors.green[600]),
                          accountName: Text(user.name),
                          accountEmail: Text(user.phoneNumber)
                        ),
                        ListTile(
                          leading: Icon(CupertinoIcons.check_mark_circled),
                          title: Text('Boton'),
                          onTap: ()=>null,
                      ),
                      ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text('Perfil'),
                        onTap: ()=>null,
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('¿Comó funciona?'),
                        onTap: ()=>null,
                      ),
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text('¿Quienes somos?'),
                        onTap: ()=>null
                      ),
                      isLoading ? SpinKitRing(color: Colors.white) : ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Salir'),
                        onTap: (){
                          setState(() => isLoading = true);
                          SignOut(context).whenComplete(() {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        }
                      )
                    ]
                  )
                ],
              ),
            ),
            body: PageView(
              scrollDirection: Axis.vertical,
              
            ),
          );
        }
        else {
          return Loading();
        }
      },
    );
  }
}

