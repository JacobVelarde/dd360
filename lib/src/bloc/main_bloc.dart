

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_dd360/src/bloc/base_bloc.dart';
import 'package:test_dd360/src/data/utils/custom_exception.dart';
import 'package:test_dd360/src/data/utils/status_network.dart';
import 'package:test_dd360/src/model/characters_response.dart';

import '../repositories/character_repository.dart';

class MainBloc extends BaseBloc{

  final BuildContext _routeContext;
  final CharacterRepository _characterRepository;

  final _behaviorStatusNetwork = BehaviorSubject<StatusNetwork>();
  Stream<StatusNetwork> get observerStatusNetwork => _behaviorStatusNetwork.stream;

  MainBloc(
      this._routeContext,
      this._characterRepository
  ){
    loadCharacters();
  }

  loadCharacters() async{
    StatusNetwork statusNetwork = StatusNetwork(Status.loading);
    _behaviorStatusNetwork.sink.add(statusNetwork);

    bool hasInternet = await hastInternetConnection();
    if (hasInternet){
      _getCharacters(statusNetwork);
    }else{
      statusNetwork.status = Status.errorInternet;
      _behaviorStatusNetwork.sink.add(statusNetwork);
    }

  }

  _getCharacters(StatusNetwork statusNetwork) async{

    try{
      CharactersResponse response = await _characterRepository.getCharacters();
      if (response.data?.results?.isNotEmpty ?? false){
        statusNetwork.data = response.data!.results!;
        statusNetwork.status = Status.ready;
        _behaviorStatusNetwork.sink.add(statusNetwork);
      }else{
        //Handle when result is empty
      }
    }on DioException catch (dioException){
      //Handle dio exception

      if (isErrorNetwork(dioException)){
        statusNetwork.status = Status.errorInternet;
        _behaviorStatusNetwork.sink.add(statusNetwork);
      }else{
        statusNetwork.status = Status.errorBack;
        _behaviorStatusNetwork.sink.add(statusNetwork);
        //Handle exception when is error back

      }

    }on CustomException catch (customException){
      //Handle custom exception

      statusNetwork.status = Status.errorBack;
      _behaviorStatusNetwork.sink.add(statusNetwork);
    }

  }

  dispose(){
    _behaviorStatusNetwork.close();
  }
}