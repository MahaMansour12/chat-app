
import 'package:chat_app/models/userAccount.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../network/remot/firebase/database_utailts.dart';
import '../../network/shared/base/base_view_model.dart';
import 'create_account_navigator.dart';

class create_account_view_model extends base_view_model<createAccountNavigator> {

  void createAccountWithFirebaseAuth(String email, String passWord,String fName,String lName) async {
    try {
         navigator!.hideLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: passWord,
      );

      navigator!.hideLoading();
      navigator!.showMessage("Account created Successfully");
      MYUser user =MYUser(id: credential.user?.uid??' ', FName: fName, LName: lName, email: email);
      await DataBaseUtils.addUserToDataBase(user).then((value) {
              navigator!.goToHome(user);
              return;
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        navigator!.hideLoading();
        navigator!.showMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator!.hideLoading();
        navigator!.showMessage('The account already exists for that email.');
      }
    } catch (e) {


    }
    return;
  }
}
