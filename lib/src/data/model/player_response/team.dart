import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:studio_flutter/src/domain/entities/TeamEntity.dart';

part 'team.g.dart';

@JsonSerializable()
class Team {
  int? id;
  String? abbreviation;
  String? city;
  String? conference;
  String? division;
  @JsonKey(name: 'full_name')
  String? fullName;
  String? name;

  Team({
    this.id,
    this.abbreviation,
    this.city,
    this.conference,
    this.division,
    this.fullName,
    this.name,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);

  TeamEntity toEntity() {
    return TeamEntity(
        id: id,
        abbreviation: abbreviation,
        city: city,
        conference: conference,
        division: division,
        fullName: fullName,
        name: name);
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Team) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      abbreviation.hashCode ^
      city.hashCode ^
      conference.hashCode ^
      division.hashCode ^
      fullName.hashCode ^
      name.hashCode;
}
