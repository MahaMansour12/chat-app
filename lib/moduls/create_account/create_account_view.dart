

import 'package:chat_app/models/userAccount.dart';
import 'package:chat_app/moduls/home/home_view.dart';
import 'package:chat_app/moduls/login/login_view.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../network/shared/base/base_view.dart';
import 'create_account_view_model.dart';
import 'create_account_navigator.dart';



class creat_acountScreen extends StatefulWidget {
  static const String routName = 'creat_account';

  @override
  State<creat_acountScreen> createState() => _creat_acountScreenState();
}

class _creat_acountScreenState extends base_view<creat_acountScreen,create_account_view_model>
    implements createAccountNavigator {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController fNameController = TextEditingController();

  TextEditingController lNameController = TextEditingController();

  @override
  void initState() {
    viewModel = create_account_view_model();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<create_account_view_model>(
      create: (context) => viewModel,
      child: Stack(
        children: [
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
              title: Text('Create Account'),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: fNameController,
                          textInputAction: TextInputAction.next,
                          validator: (name) {
                            if (name?.trim() == '' || name == null) {
                              return ' Enter valid name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "First Name",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.blue)),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: lNameController,
                          textInputAction: TextInputAction.next,
                          validator: (name) {
                            if (name?.trim() == '' || name == null) {
                              return ' Enter valid name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    color: Colors.blue)),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
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
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                              borderSide:
                              const BorderSide(color: Colors.blue),
                              //<-- SEE HERE
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.blue),
                              //<-- SEE HERE
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.blue),
                              //<-- SEE HERE
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              createAccountVaildat();
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(color: Colors.white),
                            )),
                        TextButton(onPressed: () {
                          Navigator.pushReplacementNamed(context,
                              login_view.routName);
                        }, child: Text('Are you have an acount?'))
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  void createAccountVaildat() async {
    if (formKey.currentState!.validate()) {
      viewModel.createAccountWithFirebaseAuth(
          emailController.text, passwordController.text, fNameController.text,
          lNameController.text);
    }
  }

  @override
  create_account_view_model initViewModel() {
    return create_account_view_model();
  }

  @override
  void goToHome(MYUser user) {
    Navigator.pushReplacementNamed(context, home_veiw_screen.routName);
  }
}