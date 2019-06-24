import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEpidemicEvent extends Equatable {
  RegisterEpidemicEvent([List props = const []]) : super(props);
}

class Register extends RegisterEpidemicEvent {
  String name;
  String scientificName;
  String description;
  String origin;

  Register(
      {@required this.name,
      @required this.scientificName,
      @required this.description,
      @required this.origin});
}
