import 'package:flutter/material.dart';

class AcademicCalendarScreen extends StatelessWidget {
  final List<Map<String, String>> academicCalendar = [
    {"date": "Eylül 2024", "event": "Derslerin Başlangıcı"},
    {"date": "Ocak 2025", "event": "Final Sınavları"},
    {"date": "Haziran 2025", "event": "Mezuniyet Töreni"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akademik Takvim'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2024-2025 Akademik Yılı Takvimi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: academicCalendar.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.event, color: Colors.blue),
                      title: Text(academicCalendar[index]["date"]!),
                      subtitle: Text(academicCalendar[index]["event"]!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
