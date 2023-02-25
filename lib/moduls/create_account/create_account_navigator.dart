
import 'package:chat_app/main.dart';
import 'package:chat_app/models/userAccount.dart';

import '../../network/shared/base/base_navigator.dart';

abstract class createAccountNavigator extends base_navigator{
        void goToHome(MYUser user);
}