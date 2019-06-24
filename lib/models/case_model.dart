import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Case extends Equatable implements Object {
  final int id;
  final int idEpidemic;
  final String date;
  final double latitude;
  final double longitude;

  Case.fromJSON(Map<String, dynamic> json)
      : this.id = json['id'],
        this.date = json['dateReg'],
        this.latitude = json['latitude'],
        this.longitude = json['longitude'],
        this.idEpidemic = json['epidemic']['id'];

  Case({this.id, this.date, this.latitude, this.longitude, this.idEpidemic});

  @override
  String toString() {
    return 'Case $id $date $latitude $longitude';
  }
}
