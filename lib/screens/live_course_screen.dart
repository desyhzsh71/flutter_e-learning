import 'package:flutter/material.dart';

class LiveCourseScreen extends StatelessWidget {
  // Daftar kursus mata pelajaran
  final List<String> liveCourses = [
    'Mathematics: Algebra Basics',
    'Biology: Cell Division',
    'Chemistry: Organic Chemistry',
    'Physics: Newton\'s Laws of Motion'
  ];

  // Daftar gambar untuk setiap mata pelajaran
  final List<String> courseImages = [
    'matemathics.png', 
    'biology.png', 
    'chemistry.png', 
    'physics.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Courses"),
      ),
      body: ListView.builder(
        itemCount: liveCourses.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            leading: Image.asset('images/${courseImages[index]}', width: 50, height: 50),
            title: Text(
              liveCourses[index], 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            ),
            subtitle: Text(
              'Instructor: John Doe | Duration: 1h 30m', 
              style: TextStyle(fontSize: 14, color: Colors.grey)
            ),
            onTap: () {
              // Navigasi ke halaman detail kursus
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(courseName: liveCourses[index], imageName: courseImages[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  final String courseName;
  final String imageName;

  // Constructor untuk menerima nama kursus dan gambar
  CourseDetailScreen({required this.courseName, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/$imageName', width: 100, height: 100),
            SizedBox(height: 20),
            Text(
              courseName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Instructor: John Doe',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Duration: 1 hour 30 minutes',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Course Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              'This course covers the fundamentals of ${courseName.split(':')[0]}. You will learn the basics and core principles that will help you succeed in the subject.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
