import 'Conference.dart';

class Team {
  int id;
  String abbreviation;
  String city;
  Conference conference;
  String division;
  String fullName;
  String name;

  Team({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    abbreviation: json["abbreviation"],
    city: json["city"],
    conference: conferenceValues.map[json["conference"]]!,
    division: json["division"],
    fullName: json["full_name"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "abbreviation": abbreviation,
    "city": city,
    "conference": conferenceValues.reverse[conference],
    "division": division,
    "full_name": fullName,
    "name": name,
  };
}