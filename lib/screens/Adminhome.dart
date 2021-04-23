import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/res/custom_colors.dart';

import '/utils/authentication.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  late User _user;
  bool _isSigningOut = false;
  int _selectedTabIndex = 0;
  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Quizzo(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            // leading: IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.menu),
            // ),
            actions: [
              IconButton(
                  onPressed: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await Authentication.signOut(context: context);
                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context)
                        .pushReplacement(_routeToSignInScreen());
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ))
            ],
            centerTitle: true,
            title: Text("QUIZZO",
                style: GoogleFonts.oswald(
                  fontSize: 30,
                )),
            backgroundColor: Colors.yellow[800]),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.yellow[800],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _user.photoURL != null
                          ? ClipOval(
                              child: Material(
                                color:
                                    CustomColors.firebaseGrey.withOpacity(0.3),
                                child: Image.network(
                                  _user.photoURL!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            )
                          : ClipOval(
                              child: Material(
                                color:
                                    CustomColors.firebaseGrey.withOpacity(0.3),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.person,
                                    size: 60,
                                    color: CustomColors.firebaseGrey,
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _user.displayName!,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  )),
              ListTile(
                title: Text('Edit Profile'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Help'),
                onTap: () {},
              ),
              ListTile(
                title: Text('About US'),
                onTap: () {},
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              _user.photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: CustomColors.firebaseGrey.withOpacity(0.3),
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Material(
                        color: CustomColors.firebaseGrey.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: CustomColors.firebaseGrey,
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 16.0),
              Text(
                'Hello',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                _user.displayName!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '( ${_user.email!} )',
                style: TextStyle(
                  color: CustomColors.firebaseOrange,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'You are now signed in using your Google account',
                style: TextStyle(
                    color: Colors.redAccent, fontSize: 14, letterSpacing: 0.2),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTabIndex,
          onTap: _changeIndex,
          selectedItemColor: Colors.orange,
          backgroundColor: Colors.yellow[200],
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.live_help), label: "My Quiz"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline), label: "Create Quiz"),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_numbered), label: "Rank"),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "Student"),
          ],
        ),
      ),
    );
  }
}
