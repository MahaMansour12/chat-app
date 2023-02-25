import 'package:chat_app/network/shared/base/base_view.dart';
import 'package:flutter/material.dart';

import 'home_navigator.dart';
import 'home_view_model.dart';
class home_veiw_screen extends StatefulWidget {
  static const String routName="home";




  @override
  State<home_veiw_screen> createState() => _home_veiw_screenState();
}

class _home_veiw_screenState extends base_view<home_veiw_screen,home_veiw_model>
implements  home_navigator{
  @override
  void initState() {
  viewModel=home_veiw_model();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chat App'),),
      body: Container(),
    );
  }

  @override
  home_veiw_model initViewModel() {
     return home_veiw_model();
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
