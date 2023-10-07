import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'logInScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LogInScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFCA9CE0),
              Colors.white,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          )
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/logo.json')
        ],
      ),
    );
  }

}