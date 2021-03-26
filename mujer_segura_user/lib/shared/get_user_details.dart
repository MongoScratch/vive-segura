import 'package:mujersegura/models/User.dart';
import 'package:mujersegura/services/database_service.dart';
import 'package:mujersegura/shared/constants.dart';
import 'package:mujersegura/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetUserDetails extends StatefulWidget {
  @override
  _GetUserDetailsState createState() => _GetUserDetailsState();
}

class _GetUserDetailsState extends State<GetUserDetails>
    with SingleTickerProviderStateMixin {
  String _name;
  String _gender = '';
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    final DatabaseService _db = DatabaseService(user: user);
    return StreamBuilder(
      stream: _db.userData,
      builder: (context, snapshot) {
        User user = snapshot.data;
        _db.user = user;
        if (snapshot.hasData) {
          return Scaffold(
            body: Container(
              color: backgroundColor,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100.0),
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '¿Que eres?',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                setState(() {
                                  _gender = 'hombre';
                                });
                              },
                              child: Text(
                                "Hombre",
                                style: TextStyle(
                                    color: (_gender == 'hombre')
                                        ? Colors.green
                                        : Colors.grey,
                                    fontSize: (_gender == 'hombre') ? 40 : 30),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FlatButton(
                              onPressed: () {
                                setState(() {
                                  _gender = 'mujer';
                                });
                              },
                              child: Text(
                                "Mujer",
                                style: TextStyle(
                                  color: (_gender == 'mujer')
                                      ? Colors.green
                                      : Colors.grey,
                                  fontSize: (_gender == 'mujer') ? 40 : 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 120,
                            child: MaterialButton(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Siguiente',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                              color: Colors.white,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                if (user.name == null)
                                  controller.animateToPage(1,
                                      duration: Duration(milliseconds: 250),
                                      curve: Curves.bounceIn);
                                else
                                  _db.updateUserData(_name, _gender);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '¿Cual es tu nombre?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 50.0,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  decoration: textInputDecoration.copyWith(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (val) {
                                    setState(() => _name = val);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 120,
                            child: MaterialButton(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Siguiente',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                              color: Colors.white,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                _db.updateUserData(_name, _gender);
                                Navigator.maybePop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
