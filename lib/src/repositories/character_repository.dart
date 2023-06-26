

import 'package:test_dd360/src/data/api_data_source.dart';

import '../model/characters_response.dart';

class CharacterRepository{

  final ApiDataSource _apiDataSource;

  const CharacterRepository(this._apiDataSource);

  Future<CharactersResponse> getCharacters(){
    return _apiDataSource.getCharacters();
  }

}