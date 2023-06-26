

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_dd360/src/bloc/base_bloc.dart';
import 'package:test_dd360/src/data/utils/custom_exception.dart';
import 'package:test_dd360/src/data/utils/status_network.dart';
import 'package:test_dd360/src/model/comic_response.dart';
import 'package:test_dd360/src/model/events_response.dart';
import 'package:test_dd360/src/model/result.dart';
import 'package:test_dd360/src/model/series_response.dart';
import 'package:test_dd360/src/model/stories_response.dart';
import 'package:test_dd360/src/repositories/character_repository.dart';
import 'package:test_dd360/src/repositories/comics_repository.dart';
import 'package:test_dd360/src/repositories/events_repository.dart';
import 'package:test_dd360/src/repositories/series_repository.dart';
import 'package:test_dd360/src/repositories/stories_repository.dart';

enum TypeData{
  comics,
  events,
  series,
  stories
}

class CharacterDetailBloc extends BaseBloc{

  BuildContext _routeContext;
  EventsRepository _eventsRepository;
  ComicsRepository _comicsRepository;
  StoriesRepository _storiesRepository;
  SeriesRepository _seriesRepository;

  late Result character;

  CharacterDetailBloc(
      this._routeContext,
      this._eventsRepository,
      this._comicsRepository,
      this._storiesRepository,
      this._seriesRepository
      );

  loadCharacter(Result character){
    this.character = character;
  }

  Future<StatusNetwork> getData(TypeData typeData) async{
    if(await hastInternetConnection()){
      switch (typeData){
        case TypeData.comics:
          return getComics();
        case TypeData.events:
          return getEvents();
        case TypeData.series:
          return getSeries();
        case TypeData.stories:
          return getStories();
      }
    }else{
      return StatusNetwork(Status.errorInternet);
    }
  }

  Future<StatusNetwork> getComics() async{
    try{

      ComicsResponse response = await _comicsRepository.getComics(character.id!);
      if (response.data?.results?.isNotEmpty ?? false){
        return StatusNetwork(Status.ready, data: response.data!.results!);
      }else{
        //Handle when result is empty
        return StatusNetwork(Status.errorBack);
      }

    }on DioException catch (dioException){
      //Handle dio exception
      if (isErrorNetwork(dioException)){
        return StatusNetwork(Status.errorInternet);

      }else{
        return StatusNetwork(Status.errorBack);
        //Handle exception when is error back

      }
    }on CustomException catch (customException){
      //Handle custom exception
      return StatusNetwork(Status.errorBack);
    }
  }

  Future<StatusNetwork> getEvents() async{
    try{

      EventsResponse response = await _eventsRepository.getEvents(character.id!);
      if (response.data?.results?.isNotEmpty ?? false){
        return StatusNetwork(Status.ready, data: response.data!.results!);
      }else{
        //Handle when result is empty
        return StatusNetwork(Status.errorBack);
      }

    }on DioException catch (dioException){
      //Handle dio exception
      if (isErrorNetwork(dioException)){
        return StatusNetwork(Status.errorInternet);

      }else{
        return StatusNetwork(Status.errorBack);
        //Handle exception when is error back

      }
    }on CustomException catch (customException){
      //Handle custom exception
      return StatusNetwork(Status.errorBack);
    }
  }

  Future<StatusNetwork> getSeries() async{
    try{

      SeriesResponse response = await _seriesRepository.getSeries(character.id!);
      if (response.data?.results?.isNotEmpty ?? false){
        return StatusNetwork(Status.ready, data: response.data!.results!);
      }else{
        //Handle when result is empty
        return StatusNetwork(Status.errorBack);
      }

    }on DioException catch (dioException){
      //Handle dio exception
      if (isErrorNetwork(dioException)){
        return StatusNetwork(Status.errorInternet);

      }else{
        return StatusNetwork(Status.errorBack);
        //Handle exception when is error back

      }
    }on CustomException catch (customException){
      //Handle custom exception
      return StatusNetwork(Status.errorBack);
    }
  }

  Future<StatusNetwork> getStories() async{
    try{

      StoriesResponse response = await _storiesRepository.getStories(character.id!);
      if (response.data?.results?.isNotEmpty ?? false){
        return StatusNetwork(Status.ready, data: response.data!.results!);
      }else{
        //Handle when result is empty
        return StatusNetwork(Status.errorBack);
      }

    }on DioException catch (dioException){
      //Handle dio exception
      if (isErrorNetwork(dioException)){
        return StatusNetwork(Status.errorInternet);

      }else{
        return StatusNetwork(Status.errorBack);
        //Handle exception when is error back

      }
    }on CustomException catch (customException){
      //Handle custom exception
      return StatusNetwork(Status.errorBack);
    }
  }


  dispose(){}
}