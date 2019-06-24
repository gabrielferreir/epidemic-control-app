import 'package:epidemic_control_app/repository/epidemic_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  EpidemicRepository epidemicRepository;

  HomeBloc({@required this.epidemicRepository});

  @override
  HomeState get initialState => HomeState.initial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Started) {
      yield currentState.copyWith(loading: true);
      try {
        final list = await epidemicRepository.readAll();
        yield currentState.copyWith(loading: false, list: list);
      } catch (e) {
        yield currentState.copyWith(loading: false);
      }
    }
  }
}
