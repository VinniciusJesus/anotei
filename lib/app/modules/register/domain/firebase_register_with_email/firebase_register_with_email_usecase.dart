import '../model/register_model.dart';

abstract class FirebaseRegisterWithEmailUsecase {
  Future<String> call({required RegisterModel RegisterModel});
}
