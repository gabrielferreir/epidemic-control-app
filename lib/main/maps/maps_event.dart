import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

abstract class MapsEvent extends Equatable {
  MapsEvent([List props = const []]) : super(props);
}

class Started extends MapsEvent {
  int idEpidemic;

  Started({@required this.idEpidemic});
}

class AddTarget extends MapsEvent {
  LatLng latLng;
  int idEpidemic;

  AddTarget({@required this.latLng, @required this.idEpidemic});
}
