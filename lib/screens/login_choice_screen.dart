import 'package:flutter/material.dart';
import 'student_dashboard.dart';
import 'teacher_dashboard.dart';

class LoginChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Tipi Seçimi'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 21, 70, 127),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 47, 110, 146),
              const Color.fromARGB(255, 197, 216, 228)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: const Color.fromARGB(255, 51, 86, 134),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png', width: 100),
                  SizedBox(height: 10),
                  Text(
                    'BİRUNİ ÜNİVERSİTESİ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Kullanıcı Tipi',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
              indent: 40,
              endIndent: 40,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentDashboard(
                      studentName: "Ali Veli", // Varsayılan örnek veri
                      department:
                          "Bilgisayar Mühendisliği", // Varsayılan örnek veri
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(0, 92, 150, 1),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18, color: Colors.white),
              ),
              child: Text(
                'Öğrenci',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeacherDashboard(
                      teacherName:
                          "Prof. Dr. Ahmet Yılmaz", // Varsayılan örnek veri
                    ),
                  ),
                );
              },
              child: Text('Personel'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(0, 92, 150, 1),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
