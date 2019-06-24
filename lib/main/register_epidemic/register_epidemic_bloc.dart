import 'package:epidemic_control_app/models/epidemic_model.dart';
import 'package:epidemic_control_app/repository/epidemic_repository.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'register_epidemic.dart';
import 'package:epidemic_control_app/core/exceptions/exceptions.dart';

class RegisterEpidemicBloc
    extends Bloc<RegisterEpidemicEvent, RegisterEpidemicState> {
  EpidemicRepository epidemicRepository;
  UserService userService;

  RegisterEpidemicBloc(
      {@required this.epidemicRepository, @required this.userService});

  @override
  RegisterEpidemicState get initialState => RegisterEpidemicState.initial();

  @override
  Stream<RegisterEpidemicState> mapEventToState(
      RegisterEpidemicEvent event) async* {
    if (event is Register) {
      yield currentState.copyWith(loading: true);
      try {
        final epidemic = Epidemic(
            name: event.name,
            description: event.description,
            scientificName: event.scientificName,
            origen: event.origin,
            idUser: userService.user.id);
        print(userService.user.id);
        print(epidemic);
        await epidemicRepository.create(epidemic: epidemic);
        yield currentState.copyWith(
            loading: false, stateRegister: StateRegister.created);
      } on BadRequestException {
        yield currentState.copyWith(
            loading: false, stateRegister: StateRegister.invalid);
      } catch (e) {
        yield currentState.copyWith(
            loading: false, stateRegister: StateRegister.unknown);
      }
    }
  }
}
