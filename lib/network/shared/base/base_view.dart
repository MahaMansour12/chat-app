
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_navigator.dart';
import 'base_view_model.dart';

abstract class base_view<T extends StatefulWidget, VM extends base_view_model>
    extends State<T> implements base_navigator {
  late VM viewModel;
  VM initViewModel();
  @override
  void initState() {

    super.initState();
    viewModel = initViewModel();
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading({String message = ' loading'}) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: Row(
          children: [
            Text(message),
            CircularProgressIndicator(),
          ],
        ));
      },
    );
  }

  @override
  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'))
          ],
          content: Text(message),
        );
      },
    );
  }

}
