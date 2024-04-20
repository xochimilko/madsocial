import "package:flutter/material.dart";

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Profile')),
        body: Center(child: Text('Your profile')));
  }
}
