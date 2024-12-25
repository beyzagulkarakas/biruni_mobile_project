import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  final String studentName;
  final String department;

  StudentDashboard({required this.studentName, required this.department});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Paneli"),
        backgroundColor: Colors.blue[800],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[800],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    studentName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    department,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
              onTap: () {
                Navigator.pop(context);
                // Profil ekranına yönlendirme eklenebilir
              },
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text("Duyurular"),
              onTap: () {
                Navigator.pop(context);
                // Duyurular ekranına yönlendirme eklenebilir
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("Akademik Takvim"),
              onTap: () {
                Navigator.pop(context);
                // Akademik takvim ekranına yönlendirme eklenebilir
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Çıkış Yap"),
              onTap: () {
                Navigator.pop(context);
                // Çıkış işlemi yapılabilir
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard(context, "Notlar", Icons.grade, Colors.green, () {
              // Notlar ekranına yönlendirme
            }),
            _buildCard(context, "Duyurular", Icons.announcement, Colors.orange,
                () {
              // Duyurular ekranına yönlendirme
            }),
            _buildCard(
                context, "Akademik Takvim", Icons.calendar_today, Colors.blue,
                () {
              // Akademik Takvim ekranına yönlendirme
            }),
            _buildCard(context, "Çıkış Yap", Icons.logout, Colors.red, () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
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
