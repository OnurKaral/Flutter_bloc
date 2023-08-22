import 'Player.dart';

class AllPlayersResponse {
  List<Player> data;

  AllPlayersResponse({
    required this.data,
  });

  factory AllPlayersResponse.fromJson(Map<String, dynamic> json) =>
      AllPlayersResponse(
        data: List<Player>.from(json["data"].map((x) => Player.fromJson(x))),
      );

}
