import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:korana/providers/corona_provider.dart';
import 'package:korana/screens/detailscreen.dart';

class countries_list extends StatelessWidget {
  final searchCountry = TextEditingController();
  late String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final coronas = ref.watch(coronaProvider);

            return Column(
              children: [
                // Container(
                //   height: 50,
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                //     child: TextFormField(
                //       controller: searchCountry,
                //       onFieldSubmitted: (val) {
                //         value = val;
                //         print(value);
                //         searchCountry.clear();
                //       },
                //       decoration: InputDecoration(
                //           contentPadding:
                //               EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                //           hintText: 'Search Country',
                //           suffixIcon: Icon(Icons.search),
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(50.0))),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: coronas.length,
                      itemBuilder: (context, index) {
                        final dat = coronas[index];
                        final name = dat.countryname;
                        if (searchCountry.text.isEmpty) {
                          return SafeArea(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ));
                        } else if (value == dat.countryname) {
                          return ListTile(
                            title: Text(
                              dat.countryname,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(dat.countryinfo.flag),
                            ),
                            subtitle: Text(
                              dat.cases.toString(),
                              style: TextStyle(height: 2),
                            ),
                          );
                        } else {
                          return Container();
                        }
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
