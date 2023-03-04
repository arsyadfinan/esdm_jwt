import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  var see = true.obs;
  var loginloading = true;

  void seeOnchange() {
    if (see.value) {
      see.value = false;
    } else {
      see.value = true;
    }
  }

  void login() {}
}
