
import 'package:test_dd360/network/dio_provider.dart';
import 'package:test_dd360/src/data/utils/api_response_handler.dart';
import 'package:test_dd360/src/data/utils/endpoints.dart';
import 'package:test_dd360/src/model/comic_response.dart';
import 'package:test_dd360/src/model/events_response.dart';
import 'package:test_dd360/src/model/series_response.dart';
import 'package:test_dd360/src/model/stories_response.dart';
import 'package:test_dd360/src/utils/utils.dart';

import '../model/characters_response.dart';

class ApiDataSource{

  final DioProvider _dioProvider;

  const ApiDataSource(this._dioProvider);

  Future<CharactersResponse> getCharacters() async {
    String timeStamp = Utils.timeStamp();

    final response = await _dioProvider.dio.get(
      Endpoints.characters,
      queryParameters: {
        'apikey':_dioProvider.publicKey,
        'hash': Utils.getHash(timeStamp, _dioProvider.privateKey, _dioProvider.publicKey),
        'ts': timeStamp
      }
    );

    final json = ApiResponseHandler.handleJsonObjectResponse(response);
    return CharactersResponse.fromJson(json);
  }

  Future<SeriesResponse> getSeries(int id) async{
    String timeStamp = Utils.timeStamp();

    final response = await _dioProvider.dio.get(
        "${Endpoints.charactersConcat}$id/series",
        queryParameters: {
          'apikey':_dioProvider.publicKey,
          'hash': Utils.getHash(timeStamp, _dioProvider.privateKey, _dioProvider.publicKey),
          'ts': timeStamp
        }
    );

    final json = ApiResponseHandler.handleJsonObjectResponse(response);
    return SeriesResponse.fromJson(json);

  }

  Future<EventsResponse> getEvents(int id) async{
    String timeStamp = Utils.timeStamp();

    final response = await _dioProvider.dio.get(
        "${Endpoints.charactersConcat}$id/events",
        queryParameters: {
          'apikey':_dioProvider.publicKey,
          'hash': Utils.getHash(timeStamp, _dioProvider.privateKey, _dioProvider.publicKey),
          'ts': timeStamp
        }
    );

    final json = ApiResponseHandler.handleJsonObjectResponse(response);
    return EventsResponse.fromJson(json);

  }

  Future<StoriesResponse> getStories(int id) async{
    String timeStamp = Utils.timeStamp();

    final response = await _dioProvider.dio.get(
        "${Endpoints.charactersConcat}$id/stories",
        queryParameters: {
          'apikey':_dioProvider.publicKey,
          'hash': Utils.getHash(timeStamp, _dioProvider.privateKey, _dioProvider.publicKey),
          'ts': timeStamp
        }
    );

    final json = ApiResponseHandler.handleJsonObjectResponse(response);
    return StoriesResponse.fromJson(json);

  }

  Future<ComicsResponse> getComics(int id) async{
    String timeStamp = Utils.timeStamp();

    final response = await _dioProvider.dio.get(
        "${Endpoints.charactersConcat}$id/comics",
        queryParameters: {
          'apikey':_dioProvider.publicKey,
          'hash': Utils.getHash(timeStamp, _dioProvider.privateKey, _dioProvider.publicKey),
          'ts': timeStamp
        }
    );

    final json = ApiResponseHandler.handleJsonObjectResponse(response);
    return ComicsResponse.fromJson(json);

  }
}