// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerResponse _$PlayerResponseFromJson(Map<String, dynamic> json) =>
    PlayerResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerResponseToJson(PlayerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
