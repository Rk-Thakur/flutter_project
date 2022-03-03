class world {
  late int updated, cases, todayCases, deaths;
  world(
      {required this.updated,
      required this.cases,
      required this.todayCases,
      required this.deaths});

  factory world.fromJson(Map<String, dynamic> json) {
    return world(
        updated: json['updated'],
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths']);
  }
}
