import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatefulWidget {
  @override
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  late Future<List<Map<String, dynamic>>> announcements;

  @override
  void initState() {
    super.initState();
    announcements = Future.value([
      {
        'title': 'Duyuru 1',
        'content': 'Bu bir örnek duyurudur.',
        'date': '2024-12-25'
      },
      {
        'title': 'Duyuru 2',
        'content': 'Dersler yarın iptal edilmiştir.',
        'date': '2024-12-26'
      },
      {
        'title': 'Duyuru 3',
        'content': 'Yeni dönem kayıtları başlamıştır.',
        'date': '2024-12-27'
      },
      {
        'title': 'Duyuru 4',
        'content': 'Lütfen eksik belgelerinizi tamamlayınız.',
        'date': '2024-12-28'
      },
      {
        'title': 'Duyuru 5',
        'content': 'Etkinlik için kayıt yaptırmayı unutmayın.',
        'date': '2024-12-29'
      },
      {
        'title': 'Duyuru 6',
        'content': 'Yemekhane menüsü güncellenmiştir.',
        'date': '2024-12-30'
      },
      {
        'title': 'Duyuru 7',
        'content': 'Final sınavı programı açıklanmıştır.',
        'date': '2024-12-31'
      },
      {
        'title': 'Duyuru 8',
        'content': 'Kütüphane yeni kitaplarla güncellenmiştir.',
        'date': '2025-01-01'
      },
      {
        'title': 'Duyuru 9',
        'content': 'Spor salonu bakım nedeniyle kapalıdır.',
        'date': '2025-01-02'
      },
      {
        'title': 'Duyuru 10',
        'content': 'Yeni dönem için indirim fırsatları.',
        'date': '2025-01-03'
      },
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duyurular'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: announcements,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Hiç duyuru bulunmamaktadır.'));
          } else {
            var announcementsData = snapshot.data!;
            return ListView.builder(
              itemCount: announcementsData.length,
              itemBuilder: (context, index) {
                var announcement = announcementsData[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(
                      announcement['title'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${announcement['content']} \n${announcement['date']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
