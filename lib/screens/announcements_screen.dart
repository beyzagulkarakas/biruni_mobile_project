import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class AnnouncementsScreen extends StatefulWidget {
  @override
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  List<Map<String, dynamic>> _announcements = [];

  @override
  void initState() {
    super.initState();
    _loadAnnouncements();
  }

  Future<void> _loadAnnouncements() async {
    final data = await DatabaseHelper().getAnnouncements();
    setState(() {
      _announcements = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duyurular'),
        backgroundColor: Colors.blue[800],
      ),
      body: _announcements.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _announcements.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_announcements[index]['title']),
                  subtitle: Text(_announcements[index]['content']),
                );
              },
            ),
    );
  }
}
