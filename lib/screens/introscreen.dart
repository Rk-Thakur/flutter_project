import 'package:corona/screens/countrieslist.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class intro_screen extends StatefulWidget {
  const intro_screen({Key? key}) : super(key: key);

  @override
  _intro_screenState createState() => _intro_screenState();
}

class _intro_screenState extends State<intro_screen> {
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return countries_list();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            // child: Lottie.asset('assets/images/corona.json'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets5.lottiefiles.com/packages/lf20_YSY3nP.json'),
                Text(
                  'Karona',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
