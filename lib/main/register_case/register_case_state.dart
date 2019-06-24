import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class RegisterCaseState extends Equatable {

  RegisterCaseState() : super([]);

  factory RegisterCaseState.initial() {
    return RegisterCaseState();
  }

  RegisterCaseState copyWith() {
    return RegisterCaseState();
  }

}
