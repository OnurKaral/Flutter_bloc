import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:studio_flutter/src/domain/entities/PlayerEntity.dart';

import 'team.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  int? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'height_feet')
  dynamic heightFeet;
  @JsonKey(name: 'height_inches')
  dynamic heightInches;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? position;
  Team? team;
  @JsonKey(name: 'weight_pounds')
  dynamic weightPounds;

  Player({
    this.id,
    this.firstName,
    this.heightFeet,
    this.heightInches,
    this.lastName,
    this.position,
    this.team,
    this.weightPounds,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  PlayerEntity toEntity() {
    return PlayerEntity(
        id: id,
        firstName: firstName,
        heightFeet: heightFeet,
        heightInches: heightInches,
        lastName: lastName,
        position: position,
        team: team?.toEntity(),
        weightPounds: weightPounds);
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Player) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      firstName.hashCode ^
      heightFeet.hashCode ^
      heightInches.hashCode ^
      lastName.hashCode ^
      position.hashCode ^
      team.hashCode ^
      weightPounds.hashCode;
}
