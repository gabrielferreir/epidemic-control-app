import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Epidemic extends Equatable implements Object {
  int id;
  String description;
  String name;
  String origen;
  String scientificName;
  String idUser;

  Epidemic.fromJSON(Map<String, dynamic> json)
      : this.id = json['id'],
        this.description = json['description'],
        this.name = json['name'],
        this.origen = json['origen'],
        this.scientificName = json['scientificName'];

  Epidemic(
      {this.id,
      this.description,
      this.name,
      this.origen,
      this.scientificName,
      this.idUser});

  @override
  String toString() {
    return 'Epidemic $id $name';
  }
}
