import 'package:asuka/snackbars/asuka_snack_bar.dart';

import 'firebase_login_errors_usecase.dart';

class FirebaseLoginErrorsUsecaseImp implements FirebaseLoginErrorsUsecase {
  @override
  String call({required String errorCode}) {
    switch (errorCode) {
      case "unknown":
        AsukaSnackbar.alert("Desculpe, este usuário não foi encontrado.")
            .show();
        return "Desculpe, este usuário não foi encontrado.";
      case "user-not-found":
        AsukaSnackbar.alert("Desculpe, este usuário não foi encontrado.")
            .show();

        return "Desculpe, este usuário não foi encontrado.";
      case "wrong-password":
        AsukaSnackbar.alert("Senha ou usuário incorretos.").show();
        return "Senha ou usuário incorretos.";
      case "user-disabled":
        AsukaSnackbar.alert("Desculpe, este usuário  foi desativado.").show();

        return "Desculpe, este usuário  foi desativado.";
      case "too-many-requests":
        AsukaSnackbar.alert(
                "Excesso de tentativas, tente novamente após alguns minutos.")
            .show();

        return "Excesso de tentativas, tente novamente após alguns minutos.";
      case "operation-not-allowed":
        AsukaSnackbar.alert("Desculpe, Esta operação não foi permitida.")
            .show();
        return "Desculpe, Esta operação não foi permitida.";
      default:
        AsukaSnackbar.alert(
                "Falha de conexão. Aguarde alguns minutos e tente novamente.")
            .show();
        return "Falha de conexão. Aguarde alguns minutos e tente novamente.";
    }
  }
}
