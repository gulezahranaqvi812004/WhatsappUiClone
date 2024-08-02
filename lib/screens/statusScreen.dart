import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/info.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sort the list so that users with recent status come first
    final sortedInfo = List<Map<String, String>>.from(info)
      ..sort((a, b) {
        final aStatus = a['recentStatus'] ?? 'false'; // Default to 'false' if null
        final bStatus = b['recentStatus'] ?? 'false'; // Default to 'false' if null
        return bStatus.compareTo(aStatus); // 'true' will come before 'false'
      });

    return Scaffold(
      backgroundColor: backgroundColor, // Background color to match text color
      body: ListView(
        children: [
          // Add 'My Status' tile at the top with a '+' sign on the border
          ListTile(
            leading: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60, // Adjust size as needed
                  height: 60, // Adjust size as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Set the URL as the profile picture
                    image: DecorationImage(
                      image: NetworkImage('https://media.istockphoto.com/id/1388637739/photo/mercedez-benz-glc-300-coupe-4matic-2022-matte-grey-closeup-car.jpg?s=612x612&w=0&k=20&c=8Bn62wf33y3wUg2ivDBR1YYkKv9VFPo4ZZqqzvqOuio='),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -5, // Adjust position as needed
                  right: -5, // Adjust position as needed
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green, // Black background color for the plus sign
                      border: Border.all(
                        color: Colors.green, // Green border color
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.black, // Green color for the plus sign
                      size: 20,
                      weight: 13,
                    ),
                  ),
                ),
              ],
            ),
            title: Text(
              'My Status',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text color
              ),
            ),
            subtitle: SizedBox.shrink(), // Remove subtitle text
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            onTap: () {
              // Navigate to the status creation screen or show a dialog
              // Example: Navigator.pushNamed(context, '/addStatus');
            },
          ),
          // Add a grey separator below 'My Status'
          Container(
            color: Colors.grey[800], // Grey color for the separator
            height: 1, // Height of the separator
          ),
          // List of other users' statuses
          ...sortedInfo.map((item) {
            return ListTile(
              leading: Container(
                width: 60, // Adjust size as needed
                height: 60, // Adjust size as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: item['recentStatus'] == 'true' ? Colors.green : Colors.grey, // Green for active, grey for inactive
                    width: 3, // Adjust border width as needed
                  ),
                  image: DecorationImage(
                    image: NetworkImage(item['profilePic']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                item['name']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['time']!,
                    style: TextStyle(
                      color: Colors.white70, // Slightly lighter white for time
                    ),
                  ),
                ],
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            );
          }).toList(),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 10, // Position the camera button above the pencil button
            right: 10, // Position the camera button on the right side
            child: FloatingActionButton(
              onPressed: () {
                // Handle camera button action
              },

              backgroundColor: tabColor,
              child: const Icon(Icons.camera_alt, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 80, // Position the pencil button slightly above the bottom
            right: 10, // Position the pencil button on the right side
            child: FloatingActionButton(
              onPressed: () {
                // Handle pencil button action
              },
              mini: true,
              backgroundColor: appBarColor,
              child: const Icon(Icons.edit, color: Colors.white),
            ),
          ),

        ],
      ),
    );
  }
}
