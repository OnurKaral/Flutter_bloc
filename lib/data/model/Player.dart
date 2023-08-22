import 'Team.dart';

class Player {
  int id;
  String firstName;
  int? heightFeet;
  int? heightInches;
  String lastName;
  String position;
  Team team;
  int? weightPounds;

  Player({
    required this.id,
    required this.firstName,
    required this.heightFeet,
    required this.heightInches,
    required this.lastName,
    required this.position,
    required this.team,
    required this.weightPounds,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstName: json["first_name"],
        heightFeet: json["height_feet"],
        heightInches: json["height_inches"],
        lastName: json["last_name"],
        position: json["position"],
        team: Team.fromJson(json["team"]),
        weightPounds: json["weight_pounds"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "height_feet": heightFeet,
        "height_inches": heightInches,
        "last_name": lastName,
        "position": position,
        "team": team.toJson(),
        "weight_pounds": weightPounds,
      };
}
