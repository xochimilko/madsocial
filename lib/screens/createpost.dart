import "package:flutter/material.dart";

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create')),
        body: Center(child: Text('Create')));
  }
}
