

import 'package:test_dd360/src/data/api_data_source.dart';
import 'package:test_dd360/src/model/stories_response.dart';

class StoriesRepository{
  final ApiDataSource _apiDataSource;

  const StoriesRepository(this._apiDataSource);

  Future<StoriesResponse> getStories(int characterId){
    return _apiDataSource.getStories(characterId);
  }
}