import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  // Sample quiz data with sub-topics for each subject
  final List<Map<String, dynamic>> quizzes = [
    {
      'title': 'Mathematics Quiz',
      'date': '2024-12-16',
      'description': 'This quiz covers algebra, calculus, and geometry.',
      'image': 'images/Matemathics.png',
      'subTopics': [
        'Algebra - Linear Equations',
        'Calculus - Derivatives',
        'Geometry - Shapes and Areas',
        'Trigonometry - Sin, Cos, Tan',
      ],
    },
    {
      'title': 'Chemistry Quiz',
      'date': '2024-12-17',
      'description': 'This quiz covers organic and inorganic chemistry.',
      'image': 'images/Chemistry.png',
      'subTopics': [
        'Organic Chemistry - Hydrocarbons',
        'Inorganic Chemistry - Acids and Bases',
        'Periodic Table Trends',
        'Chemical Reactions',
      ],
    },
    {
      'title': 'Biology Quiz',
      'date': '2024-12-18',
      'description': 'This quiz tests your knowledge of biology and ecosystems.',
      'image': 'images/Biology.png',
      'subTopics': [
        'Cell Biology - Structure and Function',
        'Genetics - DNA and Heredity',
        'Ecology - Ecosystems and Habitats',
        'Human Anatomy - Digestive System',
      ],
    },
    {
      'title': 'Physics Quiz',
      'date': '2024-12-19',
      'description': 'This quiz covers topics in motion and energy.',
      'image': 'images/Physics.png',
      'subTopics': [
        'Kinematics - Motion in 1D and 2D',
        'Newton’s Laws',
        'Work, Energy, and Power',
        'Thermodynamics - Laws and Applications',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(12.0),
                title: Text(
                  quizzes[index]['title']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: ${quizzes[index]['date']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      quizzes[index]['description']!,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                leading: Image.asset(
                  quizzes[index]['image']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                isThreeLine: true,
                onTap: () {
                  // Navigate to detailed quiz view with sub-topics
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizDetailScreen(
                        quiz: quizzes[index],
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

class QuizDetailScreen extends StatelessWidget {
  final Map<String, dynamic> quiz;

  QuizDetailScreen({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quiz['title']!,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${quiz['date']}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              quiz['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Sub-topics to complete:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: quiz['subTopics'].length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    quiz['subTopics'][index],
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    // You can replace this with functionality to mark a sub-topic as completed
                  },
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can add functionality here to start the quiz or mark as completed
              },
              child: Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
