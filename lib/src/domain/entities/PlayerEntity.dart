import 'package:studio_flutter/src/domain/entities/TeamEntity.dart';

class PlayerEntity {
  int? id;
  String? firstName;
  dynamic heightFeet;
  dynamic heightInches;
  String? lastName;
  String? position;
  TeamEntity? team;
  dynamic weightPounds;

  PlayerEntity({
    this.id,
    this.firstName,
    this.heightFeet,
    this.heightInches,
    this.lastName,
    this.position,
    this.team,
    this.weightPounds,
  });
}
