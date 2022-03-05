import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quotify/screens/main_screen.dart';

class intro_screen extends StatefulWidget {
  const intro_screen({Key? key}) : super(key: key);

  @override
  State<intro_screen> createState() => _intro_screenState();
}

class _intro_screenState extends State<intro_screen> {
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return main_screen();
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
                Lottie.asset('assets/images/quotes.json',
                    height: 400, width: MediaQuery.of(context).size.width),
                Text(
                  'QUOTIFY',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
