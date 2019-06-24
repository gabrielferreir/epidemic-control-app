import 'package:epidemic_control_app/models/epidemic_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState extends Equatable {
  final bool loading;
  final List<Epidemic> list;

  HomeState({this.loading = false, this.list = const []})
      : super([loading, list]);

  factory HomeState.initial() {
    return HomeState();
  }

  HomeState copyWith({bool loading, List<Epidemic> list}) {
    return HomeState(
        list: list ?? this.list,
        loading: loading == null ? this.loading : loading);
  }
}
