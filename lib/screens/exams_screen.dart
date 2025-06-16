import 'package:flutter/material.dart';

class ExamsScreen extends StatelessWidget {
  // Sample exam data
  final List<Map<String, String>> exams = [
    {
      'subject': 'Mathematics',
      'date': '2024-12-15',
      'description': 'Final exam on calculus and algebra.',
    },
    {
      'subject': 'Physics',
      'date': '2024-12-18',
      'description': 'Physics exam covering thermodynamics and mechanics.',
    },
    {
      'subject': 'Chemistry',
      'date': '2024-12-20',
      'description': 'Chemistry exam on organic and inorganic chemistry.',
    },
    {
      'subject': 'History',
      'date': '2024-12-22',
      'description': 'History exam on World War II and its consequences.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exams"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: exams.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(
                  exams[index]['subject']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: ${exams[index]['date']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      exams[index]['description']!,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                isThreeLine: true,
                trailing: Icon(
                  Icons.assignment_turned_in,
                  color: Colors.green,
                ),
                onTap: () {
                  // Navigate to the detailed exam screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExamDetailScreen(
                        exam: exams[index],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExamDetailScreen extends StatelessWidget {
  final Map<String, String> exam;

  ExamDetailScreen({required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam['subject']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subject: ${exam['subject']}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${exam['date']}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              exam['description']!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
