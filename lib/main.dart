import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizzo_app/res/custom_colors.dart';
import 'package:quizzo_app/screens/sign_in_screen.dart';
import 'package:quizzo_app/student_login.dart';
import 'Login.dart';
import 'screens/Adminhome.dart';
import 'student_home.dart';
import '/screens/sign_in_screen.dart';

void main() {
  runApp(Quizzo());
}

class Quizzo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QUIZZO',
      theme: ThemeData(primaryColor: Colors.yellow[800]),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: Image.asset('images/quizzo.png'));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up / Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 0,
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Expanded(
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 70,
                          ),
                          Text('Admin')
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Expanded(
                      child: Column(
                        children: [
                          Icon(
                            Icons.accessibility,
                            size: 70,
                          ),
                          Text('Student')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/quizzo.png',
                      height: 100,
                      width: 200,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
