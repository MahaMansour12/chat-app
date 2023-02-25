

import 'package:chat_app/moduls/create_account/create_account_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'moduls/home/home_view.dart';
import 'moduls/login/login_view.dart';





void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        creat_acountScreen.routName:(context)=>creat_acountScreen(),
        login_view.routName:(context)=>login_view(),
        home_veiw_screen.routName:(context)=>home_veiw_screen()
      } ,
      initialRoute:login_view.routName,
debugShowCheckedModeBanner: false,
    );
  }
}
