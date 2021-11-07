import 'dart:ui';

import 'package:flutter/material.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(
              height: 16,
            ),
            Text('Silahkan login terlebih dahulu untuk menggunakan aplikasi', style: TextStyle(fontSize: 16, color: Colors.grey[600]),),
            SizedBox(
              height: 16,
            ),
            Text('Username', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                labelText: 'Masukkan Username'
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text('Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(
              height: 16,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                labelText: 'Masukkan Password', 
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {}, 
                child: Text('Login', style: TextStyle(fontSize: 16),) 
              ),
            )
          ],
        ),
        ),
    );
  }
}
