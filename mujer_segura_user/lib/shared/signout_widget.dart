import 'package:mujersegura/services/auth_service.dart';
import 'package:flutter/material.dart';

final AuthService _authService = AuthService();

Future SignOut(BuildContext context){
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('¿Desea salir de la aplicación?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () async{
                Navigator.pop(context);
                await _authService.signOut();
                return null;
              },
              child: Text('Si'),
            ),
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('No'),
            ),
          ],
        );
      }
  );
}
