
import 'package:chat_app/models/userAccount.dart';
import 'package:chat_app/moduls/create_account/create_account_view.dart';
import 'package:chat_app/moduls/home/home_view.dart';
import 'package:chat_app/moduls/login/login_navigator.dart';
import 'package:chat_app/moduls/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../network/shared/base/base_view.dart';

class login_view extends StatefulWidget {
  static const String routName= 'login';
  @override
  State<login_view> createState() => _login_viewState();
}

class _login_viewState extends base_view<login_view, login_view_model>
    implements login_navigator {

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    viewModel=login_view_model();
    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<login_view_model>(
        create: (context) => login_view_model(),
        child: Stack(children: [
          Container(
            color: Colors.white,
          ),
          const Image(
            image: AssetImage(
              'asstes/imges/SIGN IN – 1.png',
            ),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('Login'),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (email) {
                                if (email?.trim() == '' || email == null) {
                                  return 'Enter valid email';
                                }

                                final bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email);
                                return null;
                              },
                              decoration: InputDecoration(

                                hintText: "Email",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              controller: passwordController,
                              obscureText: true,
                              obscuringCharacter: "*",
                              validator: (pass) {
                                if (pass?.trim() == ' ') {
                                  return " Enter password";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Password",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  loginAccount();
                                },
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(color: Colors.white),
                                )),
                            TextButton(onPressed:(){
                              Navigator.pushReplacementNamed(context, creat_acountScreen.routName);
                            }, child:Text('Do not have an accont'))
                          ]))))
        ]));
  }


  @override
  login_view_model initViewModel() {
    return login_view_model();
  }



  void loginAccount() {
    if (formKey.currentState!.validate()) {
      viewModel.loginWithEmailAndPassword(
          emailController.text, passwordController.text);
    }
  }
  @override
  void goToHome(MYUser user) {
    Navigator.pushReplacementNamed(context,home_veiw_screen.routName);
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
