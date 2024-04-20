import "package:flutter/material.dart";
import "package:madsocialproj2/screens/chatscreen.dart";
import "package:madsocialproj2/screens/createpost.dart";
import "package:madsocialproj2/screens/newsscreen.dart";
import "package:madsocialproj2/screens/yourprofile.dart";

//contains naviaation tab
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Home')),
    );
  }
}
