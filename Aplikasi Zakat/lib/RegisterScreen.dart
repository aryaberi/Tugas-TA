import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/LoginScreen.dart';
import 'package:provider/provider.dart';

import 'Provider/User.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const route = "/Register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<dataUser>(context);
    final _users = user.allItems;
    String Nama = "";
    String Email = "";
    String Pass1 = "";
    String Pass2 = "";
    String NoIdentity = "";
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        body: ListView(
          children: [
            Text(
              "Silahkan Daftrakan Diri Anda",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 40,
                  ),
                  hintText: "masukan nama pengguna anda",
                  labelText: "Nama Pengguna"),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  Nama = value;
                  print("isNotEmpty");
                } else {
                  print("isEmpty");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email,
                    size: 40,
                  ),
                  hintText: "masukan email anda",
                  labelText: "Email"),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  Email = value;
                  print("isNotEmpty");
                } else {
                  print("isEmpty");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 40,
                  ),
                  hintText: "masukan password anda",
                  labelText: "Password"),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  Pass1 = value;
                  print("isNotEmpty");
                } else {
                  print("isEmpty");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 40,
                  ),
                  hintText: "konfirmasi password anda",
                  labelText: "Konfirmasi Password"),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  Pass2 = value;
                  print("isNotEmpty");
                } else {
                  print("isEmpty");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.card_giftcard,
                  size: 40,
                ),
                hintText: "masukan no identitas anda",
                labelText: "No KTP/KK",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (value!.isEmpty || value.length < 16) {
                  return "Isi dengan angka";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  NoIdentity = value;
                  print("isNotEmpty");
                } else {
                  print("isEmpty");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
                color: Colors.lightGreen,
                child: Container(
                    height: 50,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        if (Pass1 == Pass2) {
                          var no = _users.length + 1;
                          user.addData({
                            "Id": no.toString(),
                            "Nama": Nama,
                            "Email": Email,
                            "Password": Pass1,
                            "NoIdentity": NoIdentity
                          });
                          Navigator.pushNamed(context, LoginScreen.route);
                        }
                      },
                      child: const Center(
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ))),
          ],
        ));
  }
}
