import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class MapsContent extends StatefulWidget {
  final MapsBloc mapsBloc;
  final int idEpidemic;

  MapsContent({@required this.mapsBloc, @required this.idEpidemic});

  @override
  _MapsContentState createState() => _MapsContentState();
}

class _MapsContentState extends State<MapsContent> {
  void initState() {
    print('_MapsContentState ${widget.idEpidemic}');
    super.initState();
    widget.mapsBloc.dispatch(Started(idEpidemic: widget.idEpidemic));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget.mapsBloc,
      listener: (BuildContext context, MapsState state) {
        if (state.markerState == MarkerState.created) {
          Navigator.pop(context);
          widget.mapsBloc.dispatch(Started(idEpidemic: widget.idEpidemic));
        }
      },
      child: BlocBuilder(
          bloc: widget.mapsBloc,
          builder: (BuildContext context, MapsState state) {
            return state.center != null
                ? maps(state)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget maps(MapsState state) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: state.center, zoom: 16.0),
      myLocationEnabled: true,
      markers: Set<Marker>.of(state.markers.values),
      onTap: (LatLng latLng) {
        print(latLng);
        _settingModalBottomSheet(context: context, latLng: latLng);
      },
    );
  }

  void addTarget(LatLng latLng) {
    final markerId = MarkerId('${new Random().nextInt(200)}');
    final Marker marker =
        Marker(markerId: markerId, position: latLng, consumeTapEvents: false);
  }

  void _settingModalBottomSheet(
      {@required BuildContext context, @required LatLng latLng}) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0))),
        builder: (BuildContext bc) {
          return Container(
              child: new Wrap(children: <Widget>[
            ListTile(
                title: Text(
              'Adicionar caso',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
            ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Latitude'),
                subtitle: Text('${latLng.latitude}')),
            ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Longitude'),
                subtitle: Text('${latLng.longitude}')),
            SizedBox(
                width: double.infinity,
                height: 48.0,
                child: RaisedButton(
                    color: Colors.green,
                    child: Text('ADICIONAR',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () => _addTarget(latLng: latLng)))
          ]));
        });
  }

  _addTarget({@required LatLng latLng}) {
    widget.mapsBloc
        .dispatch(AddTarget(latLng: latLng, idEpidemic: widget.idEpidemic));
  }

  _sucessAddTarget() {}
}
