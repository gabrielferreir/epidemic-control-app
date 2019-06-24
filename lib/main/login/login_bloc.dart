import 'package:bloc/bloc.dart';
import 'package:epidemic_control_app/core/exceptions/exceptions.dart';
import 'package:epidemic_control_app/repository/auth_repository.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:io';

import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository;
  UserService userService;

  LoginBloc({@required this.authRepository, @required this.userService});

  @override
  LoginState get initialState => LoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ButtonPressed) {
      try {
        yield currentState.copyWith(loading: true);
        final user = await this
            .authRepository
            .login(login: event.username, password: event.password);
        await this.userService.save(
            prefs: event.prefs,
            id: user.id,
            token: user.token,
            name: user.name);
        userService.user = user;
        yield currentState.copyWith(
            loading: false, stateAuth: StateAuth.logged);
      } on BadRequestException {
        yield currentState.copyWith(
            loading: false, stateAuth: StateAuth.invalid);
      } on SocketException {
        yield currentState.copyWith(
            loading: false, stateAuth: StateAuth.network);
      } catch (e) {
        yield currentState.copyWith(
            loading: false, stateAuth: StateAuth.unknown);
      }
    }
  }
}
