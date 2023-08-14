import '../../../entities/twitter_trend_entity.dart';

abstract class GetTrendsUsecase {
  Future<List<TwitterTrendEntity>> call();
}
