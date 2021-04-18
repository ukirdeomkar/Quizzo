import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _selectedTabIndex = 0;

  List _pages = [
    Text("Home"),
    Text("My Quiz"),
    Text("Create"),
    Text("Rank"),
    Text("Student")
  ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
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
                  onPressed: () => Navigator.pushNamed(context, '/student'),
                  icon: Icon(
                    Icons.logout_rounded,
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
                      CircleAvatar(
                        minRadius: 20,
                        maxRadius: 50,
                        backgroundImage: NetworkImage(
                            'https://4.bp.blogspot.com/-Se8rjtn0Ym8/V00hPbdsLxI/AAAAAAAAABw/io5DAzfi_NQeNJDPZzOp4rLtMAB9JFK-QCLcB/s400/luffy-One-Piece.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Luffy')
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
          child: Container(
            child: Image.asset('images/quizzo.png'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTabIndex,
          onTap: _changeIndex,
          selectedItemColor: Colors.orange,
          backgroundColor: Colors.yellow[200],
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "My Quiz"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline), label: "Create Quiz"),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_numbered), label: "Rank"),
            BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Student"),
          ],
        ),
      ),
    );
  }
}
