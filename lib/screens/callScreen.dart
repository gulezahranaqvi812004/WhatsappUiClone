import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/info.dart';


class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index) {
          final call = calls[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(call['profilePic'] ?? ''),
            ),
            title: Text(
              call['name'] ?? 'Unknown',
              style: TextStyle(
                color: call['callType'] == 'missed' ? Colors.red : Colors.white, // Set name color to red if missed call
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  call['callType'] == 'incoming'
                      ? Icons.call_received
                      : call['callType'] == 'outgoing'
                      ? Icons.call_made
                      : call['callType'] == 'missed'
                      ? Icons.call_missed
                      : Icons.phone,
                  color: call['callType'] == 'incoming'
                      ? Colors.green
                      : call['callType'] == 'outgoing'
                      ? Colors.green
                      : call['callType'] == 'missed'
                      ? Colors.red
                      : Colors.grey,
                ),
                SizedBox(width: 8), // Space between icon and status
                Expanded(
                  child: Text(
                    '${call['status'] ?? 'Unknown'}, ${call['time'] ?? 'Unknown'}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white70, // Keep other text color as white70
                    ),
                  ),
                ),
              ],
            ),
            trailing: Icon(
              // Choose the appropriate icon based on call type
              call['callType'] == 'incoming'
                  ? Icons.video_call // Video call icon for incoming calls
                  : Icons.phone, // Phone icon for outgoing or missed calls
              color: Colors.white, // Set the color of the icon to white
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: tabColor,
        child: const Icon(Icons.call, color: Colors.white,),
      ),
    );
  }
}
