import '../../../model/logged_model.dart';

abstract class FirebaseGetUserUsecase {
  Future<LoggedModel> call({required String userID});
}
