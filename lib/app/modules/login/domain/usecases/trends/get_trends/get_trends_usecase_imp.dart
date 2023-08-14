import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/modular/main_controller.dart';
import '../../../entities/twitter_trend_entity.dart';
import 'get_trends_usecase.dart';

class GetTrendsUsecaseImp implements GetTrendsUsecase {
  List<TwitterTrendEntity> twitterTrendsListTemp = <TwitterTrendEntity>[];
  final _store = Modular.get<MainController>();

  @override
  Future<List<TwitterTrendEntity>> call() async {
    final _dio = Dio();

    if (_store.twitterAccessToken.isEmpty) {
      AsukaSnackbar.alert("Você ainda não conectou o seu perfil do Twitter!")
          .show();
    } else {
      _dio.options.headers = {
        'Authorization': 'Bearer ' +
            "AAAAAAAAAAAAAAAAAAAAADb2bwEAAAAAPg%2F9rfZgTO4A7ekg7tkhbiznhFI%3DgkpvWuIxjmzfkkUWYrCkZrqUOqaUMuJo8cjsTg23b6JzWFHvYw"
      };

      final response = await _dio
          .get('https://api.twitter.com/1.1/trends/place.json?id=23424768');
      response;

      for (final item in response.data[0]["trends"]) {
        twitterTrendsListTemp.add(
          TwitterTrendEntity(
              name: item["name"].replaceAll('#', ""),
              url: item["url"],
              volum: item["tweet_volume"] ?? 00000),
        );
      }
    }

    return twitterTrendsListTemp;
  }
}
