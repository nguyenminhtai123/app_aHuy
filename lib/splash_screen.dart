import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:game/enter_name_screen.dart';
import 'package:game/home.dart';
import 'package:game/main.dart';

bool isFake = true;
String tokenFirebase = '';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFake();
    getInfo();
  }

  getInfo() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    tokenFirebase = await messaging.getToken() ?? '';
    print('tokenFirebase: $tokenFirebase');
  }

  getFake() async {
    final dio = Dio();
    final response = await dio.get(
        'https://raw.githubusercontent.com/theanh0998/isfake/main/is_fakeg1');
    print(response.data.toString().trim());
    if (response.data.toString().trim() == '1') {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EnterNameScreen(),
              // fullscreenDialog: true,
            ));
      });
    } else {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EnterNameScreen(),
              // fullscreenDialog: true,
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/images/game/background.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
