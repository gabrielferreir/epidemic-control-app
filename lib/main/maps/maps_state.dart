import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
class MapsState extends Equatable {
  bool loading;
  LatLng center;
  Map<MarkerId, Marker> markers;
  MarkerState markerState;

  MapsState(
      {this.loading = false,
      this.center,
      this.markers = const <MarkerId, Marker>{},
      this.markerState})
      : super([loading, center, markers, markerState]);

  factory MapsState.initial() {
    return MapsState();
  }

  MapsState copyWith(
      {bool loading,
      LatLng center,
      Map<MarkerId, Marker> markers,
      MarkerState markerState}) {
    return MapsState(
        loading: loading == null ? this.loading : loading,
        center: center ?? this.center,
        markers: markers ?? this.markers,
        markerState: markerState ?? this.markerState);
  }
}

enum MarkerState { created, loading, normal, unknown }
