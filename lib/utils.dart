import 'package:flutter/material.dart';

class Utils {
  composeDialog(BuildContext context, Function onComplete) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('You completed all parts'),
            title: Text('Game Completed 🎉🎉🎊🎊'),
            actions: <Widget>[
              FlatButton(onPressed: onComplete, child: Text('Ok'))
            ],
          );
        });
  }
}
