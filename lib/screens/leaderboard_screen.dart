import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<String> users = ['Alice', 'Bob', 'Charlie', 'Dave', 'Eve'];
  final List<int> scores = [1200, 1100, 950, 850, 750];
  final List<String> userImages = ['user1.png', 'user2.png', 'user3.png', 'user4.png', 'user5.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/${userImages[index]}'),
              radius: 25,
            ),
            title: Text(users[index], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text('Score: ${scores[index]}', style: TextStyle(fontSize: 14, color: Colors.grey)),
            trailing: Icon(Icons.arrow_forward, color: Colors.grey),
            onTap: () {
              // Navigasi ke detail pengguna jika diperlukan
            },
          );
        },
      ),
    );
  }
}
