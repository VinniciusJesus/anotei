import '../../model/register_entity.dart';

abstract class FirebaseRegisterWithEmailUsecase {
  Future<String> call({required RegisterModel RegisterModel});
}
