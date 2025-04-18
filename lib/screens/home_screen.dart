import 'package:biruni_mobile_project/screens/academic_calendar_screen.dart';
import 'package:biruni_mobile_project/screens/campuses_screen.dart';
import 'package:biruni_mobile_project/screens/login_choice_screen.dart';
import 'package:biruni_mobile_project/screens/announcements_screen.dart'; // Duyurular ekranını import et
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BİRUNİ ÜNİVERSİTESİ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard(context, 'Giriş Yap', Icons.login, Colors.green, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginChoiceScreen()),
              );
            }),

            // Duyurular Kartı
            _buildCard(context, 'Duyurular', Icons.announcement, Colors.orange,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnnouncementsScreen()),
              );
            }),

            _buildCard(
                context, 'Akademik Takvim', Icons.calendar_today, Colors.blue,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AcademicCalendarScreen()),
              );
            }),

            _buildCard(
                context, 'Yerleşkelerimiz', Icons.location_on, Colors.red, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CampusesScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
