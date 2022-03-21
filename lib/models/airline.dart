class AirlineModel {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String slogan;
  final String website;
  final String headQuaters;
  final String established;

  const AirlineModel({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.slogan,
    required this.website,
    required this.headQuaters,
    required this.established,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json) {
    return AirlineModel(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        slogan: json["slogan"],
        website: json["website"],
        headQuaters: json["head_quaters"],
        established: json["established"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "slogan": slogan,
        "website": website,
        "head_quaters": headQuaters,
        "established": established,
      };
}
