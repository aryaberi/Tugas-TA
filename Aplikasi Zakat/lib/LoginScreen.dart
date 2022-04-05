import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dashboard.dart';
import 'package:flutter_application_2/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = "/Login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 40,
                ),
                hintText: "masukan password anda",
                labelText: "password"),
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
                      Navigator.pushNamed(context, DashboardScreen.route);
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
