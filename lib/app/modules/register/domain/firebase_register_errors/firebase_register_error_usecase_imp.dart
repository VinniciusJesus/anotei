import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:one_context/one_context.dart';

class FirebaseRegisterErrorUsecaseImp {
  String call({required String errorCode}) {
    switch (errorCode) {
      case "operation-not-allowed":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Desculpe, Esta operação não foi permitida.",
        );

        return "Desculpe, Esta operação não foi permitida.";
      case "weak-password":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Sua senha precisa ter mais de 5 caracteres.",
        );

        return "Sua senha precisa ter mais de 5 caracteres.";
      case "invalid-email":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Por favor, digite um e-mail válido.",
        );

        return "Por favor, digite um e-mail válido.";
      case "email-already-in-use":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Este e-mail já está sendo usado.",
        );

        return "Este e-mail já está sendo usado.";
      case "invalid-credential":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Por favor, digite um e-mail válido.",
        );

        return "Por favor, digite um e-mail válido.";
      default:
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Falha de conexão. Aguarde alguns minutos e tente novamente",
        );

        return "Falha de conexão. Aguarde alguns minutos e tente novamente";
    }
  }
}
