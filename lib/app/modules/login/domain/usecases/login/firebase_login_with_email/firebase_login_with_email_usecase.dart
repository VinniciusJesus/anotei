import '../../../model/login_model.dart';

abstract class FirebaseLoginWithEmailUsecase {
  Future<String?> call(LoginModel LoginModel);
}
