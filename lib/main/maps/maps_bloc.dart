import 'package:epidemic_control_app/models/case_model.dart';
import 'package:epidemic_control_app/repository/cases_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'maps.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  CasesRepository casesRepository;

  MapsBloc({@required this.casesRepository});

  @override
  MapsState get initialState => MapsState.initial();

  @override
  Stream<MapsState> mapEventToState(MapsEvent event) async* {
    if (event is Started) {
      yield currentState.copyWith(
          loading: true, markerState: MarkerState.normal);
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final _center = LatLng(position.latitude, position.longitude);

      List<Case> cases =
          await casesRepository.readAll(idEpidemic: event.idEpidemic);

      Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

      cases.forEach((item) {
        final idMarker = MarkerId('${item.id}');
        final mark = Marker(
            markerId: idMarker,
            position: LatLng(item.latitude, item.longitude),
            consumeTapEvents: false);

        markers[idMarker] = mark;
      });

      print(markers);

      yield currentState.copyWith(
          loading: false, center: _center, markers: markers);
    }

    if (event is AddTarget) {
      yield currentState.copyWith(markerState: MarkerState.loading);
      try {
        await casesRepository.create(
            epidemicCase: Case(
                date: DateTime.now().toString(),
                latitude: event.latLng.latitude,
                longitude: event.latLng.longitude,
                idEpidemic: event.idEpidemic));
        yield currentState.copyWith(markerState: MarkerState.created);
      } catch (e) {
        yield currentState.copyWith(markerState: MarkerState.unknown);
      }
    }
  }
}
