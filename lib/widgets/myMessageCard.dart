import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/utils/colors.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  const MyMessageCard({super.key, required this.message, required this.date});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: messageColor,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 30, bottom: 20, top: 5),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                child: Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(fontSize: 13, color: Colors.white60),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                      color: Colors.blue,
                    )
                  ],
                ),
                bottom: 4,
                right: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
