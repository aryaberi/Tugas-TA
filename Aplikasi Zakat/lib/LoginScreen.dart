import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dashboard.dart';
import 'package:flutter_application_2/ForgetPass.dart';
import 'package:flutter_application_2/RegisterScreen.dart';
import 'package:flutter_application_2/Transisi.dart';
import 'package:flutter_application_2/belajarZakat.dart';

import 'package:provider/provider.dart';
import 'Provider/itemLogin.dart';
import 'Provider/User.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = "/Login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool isWrong = false;
  bool _passwordVisible = false;
  String Nama = "";
  String Pass = "";
  // changePass(String Nama) {
  //   // setState(() {
  //   //   _passwordVisible = !_passwordVisible;
  //   // });
  //   print(Nama);
  // }

  Widget build(BuildContext context) {
    final user = Provider.of<dataUser>(context);
    final _users = user.allItems;
    final login = Provider.of<itemLogin>(context);
    final _login = login.allItems;
    String userName = "";
    bool isTrue = false;

    // void _toggle() {
    //   setState(() {
    //     print(_obscureText);
    //     _obscureText = !_obscureText;
    //     print(_obscureText);
    //   });
    // }

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("ZOI"),
          leading: Container(),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body:
            ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Silahkan Melakukan Login Untuk Menikmati Applikasi Secara Utuh",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                        size: 40,
                      ),
                      hintText: "masukan email anda",
                      labelText: "e-mail"),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      Nama = value;
                      print("isNotEmpty");
                    } else {
                      print("isEmpty");
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 40,
                      ),
                      hintText: "masukan password anda",
                      labelText: "password"),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      Pass = value;
                      print("isNotEmpty");
                    } else {
                      print("isEmpty");
                    }
                  },
                ),
                // const SizedBox(height: 5),
                // Checkbox(
                //     value: _passwordVisible,
                //     onChanged: (bool? value) {
                //       setState(() {
                //         _passwordVisible = !_passwordVisible;
                //       });
                //     }),
                const SizedBox(height: 5),
                isWrong
                    ? Text("email atau password yang anda masukan salah",
                        style: TextStyle(color: Colors.red))
                    : Text(""),
                SizedBox(
                  height: 15,
                ),
                Card(
                    color: Colors.lightGreen,
                    child: Container(
                        height: 50,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            print("Klik ini");
                            print(Nama);
                            print(Pass);
                            isTrue = user.check(Nama, Pass);

                            if (isTrue == true) {
                              userName = user.getUserName(Nama, Pass);
                              login.addData({"nama": Nama});
                              Navigator.pushNamed(
                                  context, DashboardScreen.route,
                                  arguments: userName);
                            } else {
                              setState(() {
                                isWrong = true;
                              });
                            }
                            print(isTrue);
                            print(isWrong);
                            print(_passwordVisible);
                          },
                          child: Center(
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))),
                const SizedBox(height: 20),
                Row(children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.route);
                      },
                      child: Text("Daftar akun")),
                  Text("|"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgetPassScreen.route);
                      },
                      child: Text("Lupa password")),
                ]),
                const SizedBox(height: 20),
                // Row(
                //   children: [

                //   ],
                // )
              ],
            ),
          )
        ]));
  }
}
