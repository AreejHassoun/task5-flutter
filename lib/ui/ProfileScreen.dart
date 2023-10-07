import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreen();

}

class _ProfileScreen extends State<ProfileScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFCA9CE0),
          title: Lottie.asset('assets/images/logo.json'),
          centerTitle: true,
          leading: null,
          automaticallyImplyLeading:false
      ),
      body: Center(
          child: Text('this is Profil Page')
      ),
    );
  }
}