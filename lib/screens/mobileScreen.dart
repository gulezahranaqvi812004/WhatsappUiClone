import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/screens/callScreen.dart';
import 'package:whatsapp_ui_clone/screens/statusScreen.dart';
import 'package:whatsapp_ui_clone/utils/colors.dart';

import '../widgets/contactList.dart'; // Ensure this path is correct

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Update the UI when the tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Whatsapp",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Chats"),
            Tab(text: "Status"),
            Tab(text: "Calls"),
          ],
          indicatorColor: tabColor,
          indicatorWeight: 4,
          labelColor: tabColor,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ContactList(), // Your Chats screen
          StatusScreen(), // Your Status screen
          CallScreen(), // Your Calls screen
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
        onPressed: () {},
        backgroundColor: tabColor,
        child: const Icon(Icons.comment, color: Colors.white),
      )
          : _tabController.index == 2
          ? FloatingActionButton(
        onPressed: () {},
        backgroundColor: tabColor,
        child: const Icon(Icons.add_call, color: Colors.white),
      )
          : null, // No FloatingActionButton for Status tab
    );
  }
}
