import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/logged_model.dart';
import 'firebase_get_user_usecase.dart';

class FirebaseGetUserUsecaseImp implements FirebaseGetUserUsecase {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<LoggedModel> call({required String userID}) async {
    final doc = await _firestore.collection("users").doc(userID).get();
    return LoggedModel(
      name: doc["name"],
      email: doc["email"],
      userID: doc.id,
    );
  }
}
