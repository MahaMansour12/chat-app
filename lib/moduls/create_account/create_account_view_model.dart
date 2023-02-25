
import 'package:chat_app/models/userAccount.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../network/remot/firebase/database_utailts.dart';
import '../../network/shared/base/base_view_model.dart';
import 'create_account_navigator.dart';

class create_account_view_model extends base_view_model<createAccountNavigator> {

  void createAccountWithFirebaseAuth(String email, String passWord,String fName,String lName) async {
    try {
         navigator!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: passWord,
      );

      navigator!.hideLoading();
      navigator!.showMessage("Account created Successfully");
      MYUser user =MYUser(id: credential.user?.uid??' ', FName: fName, LName: lName, email: email);
      await DataBaseUtils.addUserToDataBase(user).then((value) {
        navigator!.hideLoading();
              navigator!.goToHome(user);
              return;
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

        navigator!.showMessage('The password provided is too weak.');
        navigator!.hideLoading();

      } else if (e.code == 'email-already-in-use') {

        navigator!.showMessage('The account already exists for that email.');
        navigator!.hideLoading();
      }
    } catch (e) {


          navigator!.showMessage(e.toString());
          navigator!.hideLoading();
    }
    return;
  }
}
