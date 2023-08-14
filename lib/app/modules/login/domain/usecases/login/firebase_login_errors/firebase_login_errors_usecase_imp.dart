import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:one_context/one_context.dart';

import 'firebase_login_errors_usecase.dart';

class FirebaseLoginErrorsUsecaseImp implements FirebaseLoginErrorsUsecase {
  @override
  String call({required String errorCode}) {
    switch (errorCode) {
      case "unknown":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "O nome escolhido é muito longo.",
        );

        return "Desculpe, este usuário não foi encontrado.";
      case "user-not-found":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Desculpe, este usuário não foi encontrado.",
        );

        return "Desculpe, este usuário não foi encontrado.";
      case "wrong-password":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Senha ou usuário incorretos.",
        );

        return "Senha ou usuário incorretos.";
      case "user-disabled":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Desculpe, este usuário  foi desativado.",
        );

        return "Desculpe, este usuário  foi desativado.";
      case "too-many-requests":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message:
              "Excesso de tentativas, tente novamente após alguns minutos.",
        );

        return "Excesso de tentativas, tente novamente após alguns minutos.";
      case "operation-not-allowed":
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message: "Desculpe, Esta operação não foi permitida.",
        );

        return "Desculpe, Esta operação não foi permitida.";
      default:
        showOkAlertDialog(
          context: OneContext().context!,
          title: "Falha ao fazer login",
          message:
              "Falha de conexão. Aguarde alguns minutos e tente novamente.",
        );

        return "Falha de conexão. Aguarde alguns minutos e tente novamente.";
    }
  }
}
