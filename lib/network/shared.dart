import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog(
    context, String title, String desc, String ButtonText) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(desc),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(ButtonText),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
