import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'register_case.dart';

class RegisterCaseBloc extends Bloc<RegisterCaseEvent, RegisterCaseState> {
  RegisterCaseBloc();

  @override
  RegisterCaseState get initialState => RegisterCaseState.initial();

  @override
  Stream<RegisterCaseState> mapEventToState(
      RegisterCaseEvent event) async* {}
}
