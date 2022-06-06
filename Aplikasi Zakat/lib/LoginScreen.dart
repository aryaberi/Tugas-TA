import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dashboard.dart';
import 'package:flutter_application_2/RegisterScreen.dart';
import 'package:provider/provider.dart';

import 'Provider/User.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = "/Login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool _passwordVisible = false;
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  Widget build(BuildContext context) {
    final user = Provider.of<dataUser>(context);
    final _users = user.allItems;
    String Nama = "";
    String Pass = "";
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("ZOI"),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView(children: [
          Text(
            "Selamat Datang di ZOI, Aplikasi pemabayaran zakat online yang telah mendapat lisensi dari MUI",
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
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      _passwordVisible = true;
                    });
                  },
                  onLongPressUp: () {
                    setState(() {
                      _passwordVisible = false;
                    });
                  },
                  child: Icon(_passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
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
          SizedBox(
            height: 20,
          ),
          Card(
              color: Colors.lightGreen,
              child: Container(
                  height: 50,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      isTrue = user.check(Nama, Pass);

                      if (isTrue == true) {
                        userName = user.getUserName(Nama, Pass);
                        Navigator.pushNamed(context, DashboardScreen.route,
                            arguments: userName);
                      }
                      print(isTrue);
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
          const SizedBox(height: 50),
          Row(
            children: [
              const Text("Belum punya akun ? "),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.route);
                  },
                  child: Text("Daftar di sini"))
            ],
          )
        ]));
  }
}
