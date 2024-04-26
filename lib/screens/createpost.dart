import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State
{
  String _postText = ''; // Initialize _postText variable

  // Rest of the code remains unchanged


  // Function to handle uploading post to Firestore
  Future<void> _uploadPost() async {
    try {
      // Access Firestore instance
      final firestore = FirebaseFirestore.instance;

      // Add post data to Firestore
      await firestore.collection('posts').add({
        'text': _postText,
        'timestamp': DateTime.now(),
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Post uploaded successfully'),
          duration: Duration(seconds: 2),
        ),
      );

      // Reset post text field
      setState(() {
        _postText = '';
      });
    } catch (e) {
      // Show error message if upload fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to upload post'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _postText = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter your post',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _postText.trim().isEmpty ? null : _uploadPost,
              child: Text('Upload Post'),
            ),
          ],
        ),
      ),
    );
  }
}
