

import 'package:test_dd360/src/data/api_data_source.dart';
import 'package:test_dd360/src/model/comic_response.dart';

class ComicsRepository{

  final ApiDataSource _apiDataSource;

  const ComicsRepository(this._apiDataSource);

  Future<ComicsResponse> getComics(int characterId){
    return _apiDataSource.getComics(characterId);
  }

}