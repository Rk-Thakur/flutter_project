import 'package:corona/providers/corona_provider.dart';
import 'package:corona/screens/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class countries_list extends StatelessWidget {
  final search = TextEditingController();
  late String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final coronas = ref.watch(coronaProvider);

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: search,
                              onFieldSubmitted: (val) {
                                ref
                                    .read(coronaProvider.notifier)
                                    .serchCountry(val);
                                search.clear();
                              },
                              style: TextStyle(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Search Country',
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              value = search.text;
                              ref
                                  .watch(coronaProvider.notifier)
                                  .serchCountry(value);
                            },
                            icon: Icon(
                              Icons.search,
                              size: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: coronas.length,
                      itemBuilder: (context, index) {
                        final dat = coronas[index];
                        final name = dat.countryname;
                        return SafeArea(
                            child: search.text.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Card(
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return detail_screen(
                                                        countryname:
                                                            dat.countryname,
                                                        image: dat
                                                            .countryinfo.flag,
                                                        cases: dat.cases,
                                                        todayCases:
                                                            dat.todayCases,
                                                        deaths: dat.deaths,
                                                        todayDeaths:
                                                            dat.todayDeaths,
                                                        recovered:
                                                            dat.recovered,
                                                        todayRecovered:
                                                            dat.todayRecovered,
                                                        active: dat.active,
                                                        critical: dat.critical,
                                                        population:
                                                            dat.population,
                                                        tests: dat.tests);
                                                  }));
                                                },
                                                child: ListTile(
                                                  title: Text(
                                                    dat.countryname,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  leading: CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage:
                                                        NetworkImage(dat
                                                            .countryinfo.flag),
                                                  ),
                                                  subtitle: Text(
                                                    dat.cases.toString(),
                                                    style: TextStyle(height: 2),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : search.text == dat.countryname
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return detail_screen(
                                                countryname: dat.countryname,
                                                image: dat.countryinfo.flag,
                                                cases: dat.cases,
                                                todayCases: dat.todayCases,
                                                deaths: dat.deaths,
                                                todayDeaths: dat.todayDeaths,
                                                recovered: dat.recovered,
                                                todayRecovered:
                                                    dat.todayRecovered,
                                                active: dat.active,
                                                critical: dat.critical,
                                                population: dat.population,
                                                tests: dat.tests);
                                          }));
                                        },
                                        child: ListTile(
                                          title: Text(
                                            dat.countryname,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          leading: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                dat.countryinfo.flag),
                                          ),
                                          subtitle: Text(
                                            dat.cases.toString(),
                                            style: TextStyle(height: 2),
                                          ),
                                        ),
                                      )
                                    : Container());
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
