import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madsocialproj2/model/message.dart';

class ChatService extends ChangeNotifier{
  
  //get insynace of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //SEND Message 
  Future<void> sendMessage(String recieverId, String message) async{
    //get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create new message
    Message newMessage = Message(
      senderId: currentUserId, 
      senderEmail: currentUserEmail,
       recieverId: recieverId, 
       timestamp: timestamp, 
       message: message,
       );

    //construct chat room id from current user id and receiver id 
    List<String> ids = [currentUserId, recieverId];
    ids.sort();//sort the ids ensures chat id is always the same 
    String chatRoomId = ids.join(
      "_");//combine id into single string ofr chat id 

    //add new message 
    await _fireStore
    .collection('chat_rooms')
    .doc(chatRoomId)
    .collection('messages')
    .add(newMessage.toMap());

  }

  //GET MESSAGE 
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId){
    //construct chat room id from users 
    List<String> ids = [userId, otherUserId ];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
    .collection('chat_rooms')
    .doc(chatRoomId)
    .collection('messages')
    .orderBy('timestamp', descending: false)
    .snapshots();
  }
}