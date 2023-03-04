import 'package:esdm_rsui_klaten/controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../controller/logincontroller.dart';
class LoginPage extends StatelessWidget {
  final loginC = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Halo"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 70, 20, 70),
                  child: Image.asset(
                    "assets/image/logo rs baru.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: loginC.username,
                    decoration: InputDecoration(
                      labelText: "username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Obx(() => TextFormField(
                        obscureText: loginC.see.value,
                        controller: loginC.password,
                        decoration: InputDecoration(
                          labelText: "password",
                          suffix: InkWell(
                            child: loginC.see.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onTap: () {
                              loginC.seeOnchange();
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                        ),
                      )),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      primary: Colors.green,
                    ),
                    child: const Text('Log In'),
                    onPressed: () {
                      if (loginC.loginloading) {
                        CircularProgressIndicator();
                      }
                      loginC.login();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
