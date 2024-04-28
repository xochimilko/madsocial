 import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:madsocialproj2/components/my_text_field.dart';
import 'package:madsocialproj2/services/chat/chat_service.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;

  const ChatScreen({
    Key? key,
    required this.receiverUserEmail,
    required this.receiverUserID,
  }) : super(key: key);

  @override
  State createState() => _ChatScreenState(receiverUserEmail, receiverUserID);
}


class _ChatScreenState extends State
  with TickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late final String receiverUserEmail;
  late final String receiverUserID;
  
  _ChatScreenState(this.receiverUserEmail, this.receiverUserID);

  // Function to send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
        receiverUserID, // Accessing receiverUserID from _ChatScreenState
        _messageController.text,
      );
      // Clear the text controller after sent
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverUserEmail)),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                _buildUserList(), // Added user list here
                //Divider(),
                Expanded(
                  child: _buildMessageList(),
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  // Build user list
  Widget _buildUserList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final DocumentSnapshot document = snapshot.data!.docs[index];
            final Map<String, dynamic> data =
                document.data() as Map<String, dynamic>;

            // Display all users but current
            if (_firebaseAuth.currentUser!.email != data['email']) {
              return ListTile(
                title: Text(data['email']),
                onTap: () {
                  // Navigate to ChatPage with clicked user's info
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        receiverUserEmail: data['email'],
                        receiverUserID: data['uid'],
                      ),
                    ),
                  );
                },
              );
            } else {
              // Return empty container for current user
              return Container();
            }
          },
        );
      },
    );
  }

  // Build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final DocumentSnapshot document = snapshot.data!.docs[index];
            final Map<String, dynamic> data =
                document.data() as Map<String, dynamic>;

            // Align message based on sender
            var alignment = (data['senderId'] ==
                    _firebaseAuth.currentUser!.uid)
                ? Alignment.centerRight
                : Alignment.centerLeft;

            return Container(
              alignment: alignment,
              child: Column(
                children: [
                  Text(data['senderEmail']),
                  Text(data['message']),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Build message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: 'Enter Message',
            obscureText: false,
          ),
        ),
        // Send button
        IconButton(
          onPressed: sendMessage,
          icon: Icon(
            Icons.arrow_upward,
            size: 40,
          ),
        ),
      ],
    );
  }
}
