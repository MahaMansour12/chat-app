

import 'package:chat_app/models/userAccount.dart';

import '../../network/shared/base/base_navigator.dart';

abstract class login_navigator extends base_navigator{

  void goToHome(MYUser user)  ;
}