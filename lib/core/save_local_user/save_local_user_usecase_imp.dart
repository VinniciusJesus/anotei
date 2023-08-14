import 'package:anotei/app/modules/login/domain/model/logged_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../strings.dart';

class SaveLocalUserUsecaseImp {
  Future<void> call({required LoggedModel loggedEntity}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(Strings.name, loggedEntity.name);
    await prefs.setString(Strings.email, loggedEntity.email);
    await prefs.setString(Strings.userID, loggedEntity.userID);
  }
}
