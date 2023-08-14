import 'package:asuka/snackbars/asuka_snack_bar.dart';

import 'firebase_register_errors_usecase.dart';

class FirebaseRegisterErrorUsecaseImp implements FirebaseRegisterErrorsUsecase {
  @override
  String call({required String errorCode}) {
    switch (errorCode) {
      case "operation-not-allowed":
        AsukaSnackbar.alert("Desculpe, Esta operação não foi permitida.")
            .show();
        return "Desculpe, Esta operação não foi permitida.";
      case "weak-password":
        AsukaSnackbar.alert("Sua senha precisa ter mais de 5 caracteres.")
            .show();
        return "Sua senha precisa ter mais de 5 caracteres.";
      case "invalid-email":
        AsukaSnackbar.alert("Por favor, digite um e-mail válido.").show();
        return "Por favor, digite um e-mail válido.";
      case "email-already-in-use":
        AsukaSnackbar.alert("Este e-mail já está sendo usado.").show();
        return "Este e-mail já está sendo usado.";
      case "invalid-credential":
        AsukaSnackbar.alert("Por favor, digite um e-mail válido.").show();

        return "Por favor, digite um e-mail válido.";
      default:
        AsukaSnackbar.alert(
                "Falha de conexão. Aguarde alguns minutos e tente novamente")
            .show();

        return "Falha de conexão. Aguarde alguns minutos e tente novamente";
    }
  }
}
