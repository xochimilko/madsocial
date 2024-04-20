import "package:flutter/material.dart";

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Chat')), body: Center(child: Text('Chat')));
  }
}
