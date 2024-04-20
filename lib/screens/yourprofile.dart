import "package:flutter/material.dart";

class YourProfileScreen extends StatefulWidget {
  const YourProfileScreen({Key? key}) : super(key: key);
  _YourProfileScreenState createState() => _YourProfileScreenState();
}

class _YourProfileScreenState extends State<YourProfileScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Profile')),
        body: Center(child: Text('Your profile')));
  }
}
