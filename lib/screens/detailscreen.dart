import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class detail_screen extends StatefulWidget {
  late String countryname;
  late String image;
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
  detail_screen(
      {required this.countryname,
      required this.image,
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
  @override
  _detail_screenState createState() => _detail_screenState();
}

class _detail_screenState extends State<detail_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryname),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        reuserow(title: 'Active', value: widget.active),
                        reuserow(title: 'Cases', value: widget.cases),
                        reuserow(title: 'Critical', value: widget.critical),
                        reuserow(title: 'Deaths', value: widget.deaths),
                        reuserow(title: 'Population', value: widget.population),
                        reuserow(title: 'Recovered', value: widget.recovered),
                        reuserow(title: 'Tests', value: widget.tests),
                        reuserow(
                            title: 'Today Cases', value: widget.todayCases),
                        reuserow(
                            title: 'Today Death', value: widget.todayDeaths),
                        reuserow(
                            title: 'Today Recovered',
                            value: widget.todayRecovered),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class reuserow extends StatelessWidget {
  String title;
  int value;
  reuserow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value.toString()),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
