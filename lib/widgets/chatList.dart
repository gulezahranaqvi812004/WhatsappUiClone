import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/utils/info.dart';
import 'package:whatsapp_ui_clone/widgets/myMessageCard.dart';
import 'package:whatsapp_ui_clone/widgets/senderMessageCard.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (messages[index]['isMe'] == true) {
          // my message card
          return MyMessageCard(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
        } else {
          //sender message card
          return SenderMessageCard(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
        }
      },
      itemCount: messages.length,
    );
  }
}
