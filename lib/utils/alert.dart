import 'package:flutter/material.dart';

alert(context, String msg, {Function callback}) {
  print('msg => $msg');
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text('Miniatura de Carros'),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                if (callback != null) {
                  callback();
                }
              },
              child: Text('Ok'),
            ),
          ],
        ),
      );
    },
  );
}
