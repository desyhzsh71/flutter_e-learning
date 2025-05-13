import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = ['Mathematics', 'Chemistry', 'Biology', 'Physics', 'Language', 'History'];
  final List<String> categoryImages = [
    'Matemathics.png', 
    'Chemistry.png', 
    'Biology.png', 
    'Physics.png', 
    'Language.png', 
    'History.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            leading: Image.asset('images/${categoryImages[index]}', width: 50, height: 50),
            title: Text(categories[index], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              // Navigasi ke halaman detail kategori jika diperlukan
            },
          );
        },
      ),
    );
  }
}
