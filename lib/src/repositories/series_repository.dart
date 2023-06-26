

import 'package:test_dd360/src/data/api_data_source.dart';
import 'package:test_dd360/src/model/series_response.dart';

class SeriesRepository{
  final ApiDataSource _apiDataSource;

  const SeriesRepository(this._apiDataSource);

  Future<SeriesResponse> getSeries(int characterId){
    return _apiDataSource.getSeries(characterId);
  }
}