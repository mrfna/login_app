import 'package:flutter/material.dart';
import 'package:login_app/pageLogin.dart';

class PageLoginRegister extends StatefulWidget {
  const PageLoginRegister({Key? key}) : super(key: key);

  @override
  _PageLoginRegisterState createState() => _PageLoginRegisterState();
}

class _PageLoginRegisterState extends State<PageLoginRegister> with TickerProviderStateMixin {
  TabController? tabcontroll;

  @override
  void initState() {
    tabcontroll = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Container(
              height: 60,
              color: Colors.white,
              child: TabBar(
                  indicatorColor: Colors.grey,
                  controller: tabcontroll,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.login_rounded,
                        color: Colors.grey,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.app_registration_rounded,
                        color: Colors.grey,
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    )
                  ])),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: tabcontroll,
                children: [
                  PageLogin(tabcontroll),
                  PageLogin(tabcontroll)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
