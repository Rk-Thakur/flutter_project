import 'package:flutter/foundation.dart';

class CountryInfo {
  late String flag;

  CountryInfo({required this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
  }
}

class Countries {
  late String countryname;
  late CountryInfo countryinfo;
  late int cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      active,
      critical,
      population,
      tests;

  Countries(
      {required this.countryname,
      required this.countryinfo,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.todayRecovered,
      required this.active,
      required this.critical,
      required this.population,
      required this.tests});

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
        countryname: json['country'],
        countryinfo: CountryInfo.fromJson(json['countryInfo']),
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        recovered: json['recovered'],
        todayRecovered: json['todayRecovered'],
        active: json['active'],
        critical: json['critical'],
        population: json['population'],
        tests: json['tests']);
  }
}
