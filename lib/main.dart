import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = true;
  static LatLng _center = LatLng(0, 0);
  Map<CircleId, Circle> circles = <CircleId, Circle>{};
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initState() {
    super.initState();
    _currentPosition();
  }

  void _currentPosition() async {
    setState(() {
      loading = true;
    });
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _center = LatLng(position.latitude, position.longitude);
    setState(() {
      loading = false;
    });
    print(position);
  }

  void addCircle(LatLng latLng) {
    final circleId = CircleId('${new Random().nextInt(200)}');
    final Circle circle = Circle(
      circleId: circleId,
      consumeTapEvents: true,
      strokeColor: Colors.redAccent,
      fillColor: Colors.red,
      strokeWidth: 1,
      center: latLng,
      radius: 12,
    );

    setState(() {
      circles[circleId] = circle;
    });
  }

  void addTarget(LatLng latLng) {
    final markerId = MarkerId('${new Random().nextInt(200)}');
    final Marker marker = Marker(markerId: markerId, position: latLng, consumeTapEvents: false);

    setState(() {
      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Maps(),
    );
  }

  Widget Maps() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: _center, zoom: 16.0),
      myLocationEnabled: true,
      circles: Set<Circle>.of(circles.values),
      markers: Set<Marker>.of(markers.values),
      onTap: (LatLng latLng) {
        print(latLng);
        addTarget(latLng);
      },
    );
  }
}
