import 'package:flutter/material.dart';
import 'Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QUIZZO',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
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
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login(userType: 'Admin')),
                    );                  },
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login(userType: 'Student')),
                    );
                  },
                  child:Expanded(
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
          ],
        ),
      ),
    );
  }
}
