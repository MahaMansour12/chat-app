
import 'package:chat_app/models/userAccount.dart';
import 'package:chat_app/moduls/login/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../network/remot/firebase/database_utailts.dart';
import '../../network/shared/base/base_view_model.dart';

class login_view_model extends base_view_model<login_navigator>{

   void loginWithEmailAndPassword(String email,String pass)async{
     try {
       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: email,
           password: pass,
       );
       navigator!.showLoading();
       navigator!.showMessage('Successfully logged');



      MYUser? user=  await DataBaseUtils.getUerFromDataBase(credential.user?.uid??'');
      if(user!=null){
        navigator!.hideLoading();
           navigator!.goToHome(user);
           return;
      }




     } on FirebaseAuthException catch (e) {


       navigator!.showMessage('InValid');
       navigator!.hideLoading();


       } catch (e){
       navigator!.showMessage(e.toString());
       navigator!.hideLoading();

     }

   }

}