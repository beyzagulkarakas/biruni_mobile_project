import 'package:flutter/material.dart';
import 'student_dashboard.dart';
import 'teacher_dashboard.dart';

class LoginScreen extends StatefulWidget {
  final String role;

  LoginScreen({required this.role});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      if (widget.role == 'Öğrenci') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDashboard(
              studentName: "Ali Veli",
              department: "Bilgisayar Mühendisliği",
            ),
          ),
        );
      } else if (widget.role == 'Öğretmen') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherDashboard(
              teacherName: "Prof. Dr. Ahmet Yılmaz",
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen tüm alanları doldurun')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 75, 124),
        title: Text('${widget.role} Girişi'),
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-posta',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Parola',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              onPressed: _login,
              child: Text('Giriş Yap', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
