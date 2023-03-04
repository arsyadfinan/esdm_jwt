import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

CheckLogin() async {
  final secureStorage = const FlutterSecureStorage();

  String? logedin = await secureStorage.read(key: 'logedin');

  return logedin;
}

class _SplashScreenState extends State<SplashScreen> {
  late String login;
  @override
  void initState() {
    super.initState();

    CheckLogin().then((value) {
      if (value == "true") {
        Future.delayed(Duration(seconds: 1), () {
          Get.offAllNamed('/homepage');
        });
      } else {
        Future.delayed(Duration(seconds: 1), () {
          Get.offAllNamed('/home');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
