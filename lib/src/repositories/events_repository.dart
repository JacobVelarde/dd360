


import 'package:test_dd360/src/data/api_data_source.dart';
import 'package:test_dd360/src/model/events_response.dart';

class EventsRepository{

  final ApiDataSource _apiDataSource;

  const EventsRepository(this._apiDataSource);

  Future<EventsResponse> getEvents(int characterId){
    return _apiDataSource.getEvents(characterId);
  }

}