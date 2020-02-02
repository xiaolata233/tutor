import 'package:flutter/material.dart';
import 'package:i_am_rich/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'page.dart';

final user = 'yifan@gmail.com';

final _firestore = Firestore.instance;

class ChatScreen extends Page {
  ChatScreen() : super(const Icon(Icons.image), 'Chat');
  @override
//  _ChatScreenState createState() => _ChatScreenState();
  @override
  Widget build(BuildContext context) {
    return ChatScreenBody();
  }
}

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody();

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreenBody> {
  String message;
  final messageTextController = TextEditingController();

//  void getMessages() async {
//    final messages = await _firestore.collection('messages').getDocuments();
//    for(var message in messages.documents){
//      print(message.data);
//    }
//  }
//
//  void messagesStream() async {
//    await for( var snapshot in _firestore.collection('messages').snapshots()){
//      for(var message in snapshot.documents){
//        print(message.data);
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {

              }),
        ],
        title: Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': message,
                        'sender': user,
                        'timestamp': new DateTime.now().millisecondsSinceEpoch,
                      });
                      messageTextController.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      // ignore: missing_return
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
          final messages = snapshot.data.documents.reversed;
          List<MessageBubble> messageWidgets = [];
          for(var message in messages){
            final messageText = message.data['text'];
            final messageSender = message.data['sender'];

            final messageWidget =
            MessageBubble(messageSender: messageSender, messageText: messageText, isMe: user == messageSender,);
            messageWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageWidgets,
            ),
          );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {

  MessageBubble({this.messageSender, this.messageText, this.isMe});

  final String messageSender;
  final String messageText;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(messageSender, style: TextStyle(
            fontSize: 12.0,
            color: Colors.black54,
          ),),
          Material(
            borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)) : BorderRadius.only(bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0), topRight: Radius.circular(30.0)),
            color: isMe? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text('$messageText',
                style: TextStyle(
                  color: isMe? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),),
            ),
          ),
        ],
      ),
    );
  }
}