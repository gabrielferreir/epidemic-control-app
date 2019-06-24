import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class User extends Equatable implements Object {
  final String id;
  final String name;
  final String token;

  User.fromJSON(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.token = json['token'];

  User({this.id, this.name, this.token});

  @override
  String toString() {
    return 'User $id $name $token';
  }
}
