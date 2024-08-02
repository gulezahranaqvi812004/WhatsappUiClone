import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/screens/chatScreen.dart';
import 'package:whatsapp_ui_clone/utils/colors.dart';
import 'package:whatsapp_ui_clone/utils/info.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final contact = info[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MobileChatScreen(
                            name: contact['name'].toString(),
                            profilePic: contact['profilePic'].toString(),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        contact['name'].toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          contact['message'].toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                        NetworkImage(contact['profilePic'].toString()),
                      ),
                      trailing: Text(
                        contact['time'].toString(),
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ),
                );
              },
              itemCount: info.length,
            ),
          ),
          const Divider(
            color: dividerColor,
            indent: 85,
          ),
        ],
      ),
    );
  }
}
