

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dd360/network/dio_provider.dart';
import 'package:test_dd360/src/bloc/character_detail_bloc.dart';
import 'package:test_dd360/src/data/api_data_source.dart';
import 'package:test_dd360/src/repositories/character_repository.dart';
import 'package:test_dd360/src/bloc/main_bloc.dart';
import 'package:test_dd360/src/repositories/comics_repository.dart';
import 'package:test_dd360/src/repositories/events_repository.dart';
import 'package:test_dd360/src/repositories/series_repository.dart';
import 'package:test_dd360/src/repositories/stories_repository.dart';


//Dependecies injection

MainBloc generateMainBloc(BuildContext routeContext){

  final dioProvider = Provider.of<DioProvider>(routeContext, listen: false);
  final apiDataSource = ApiDataSource(dioProvider);
  final characterRepository = CharacterRepository(apiDataSource);

  return MainBloc(routeContext, characterRepository);
}

CharacterDetailBloc generateCharacterDetailBloc(BuildContext routeContext){

  final dioProvider = Provider.of<DioProvider>(routeContext, listen: false);
  final apiDataSource = ApiDataSource(dioProvider);
  final eventsRepository = EventsRepository(apiDataSource);
  final comicsRepository = ComicsRepository(apiDataSource);
  final storiesRepository = StoriesRepository(apiDataSource);
  final seriesRepository = SeriesRepository(apiDataSource);


  return CharacterDetailBloc(
      routeContext,
      eventsRepository,
      comicsRepository,
      storiesRepository,
      seriesRepository
  );
}