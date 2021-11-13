import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'package:flutter/material.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final username = new TextEditingController();
  final password = new TextEditingController();

  // Ketika Button Login Di Tekan Akan Menjalankan Action Ini
  void prosesLogin() async {
    if (username.text == '' || password.text == '') {
      // Keluar Alert Data Tidak Boleh Kosong
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Warning !!!"),
            content: new Text("Username / Password Cannot Be Empty... "),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new TextButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Proses Login
      var datalogin = await http.post(
          Uri.parse("https://freehost.my.id/Api/Login"),
          body: {"username": username.text, "password": password.text});
      var login = await json.decode(
        datalogin.body,
      );

      // Validasi Data
      if (login['response_status'] == 'OK') {
        print('Berhasil Login');
        // Dia Diijinkan Masuk Ke halaman Dashboard

      } else {
        // Kalau Gagal Kasih Dialog Gagal
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Warning !!!"),
              content: new Text("Username / Password Wrong ... "),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new TextButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Silahkan login terlebih dahulu untuk menggunakan aplikasi',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: username,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Username",
                  labelText: "Masukkan Username",
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Masukkan Password",
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    prosesLogin();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
