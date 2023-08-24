import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:studio_flutter/src/domain/entities/PlayerResponseEntity.dart';

import 'player.dart';

part 'player_response.g.dart';

@JsonSerializable()
class PlayerResponse {
  List<Player>? data;

  PlayerResponse({this.data});

  factory PlayerResponse.fromJson(Map<String, dynamic> json) {
    return _$PlayerResponseFromJson(json);
  }

  PlayerResponseEntity toEntity() {
    return PlayerResponseEntity(data: data?.map((e) => e.toEntity()).toList());
  }

  Map<String, dynamic> toJson() => _$PlayerResponseToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PlayerResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => data.hashCode;
}
