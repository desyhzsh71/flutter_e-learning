import 'package:flutter/material.dart';
import 'course_screen.dart'; // Import the CourseScreen to navigate

class ClassesScreen extends StatefulWidget {
  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  // Map of class names to their image paths
  final Map<String, String> classImages = {
    'Mathematics': 'images/Matemathics.png',
    'Chemistry': 'images/Chemistry.png',
    'Biology': 'images/Biology.png',
    'Physics': 'images/Physics.png',
    'Language': 'images/Language.png',
    'History': 'images/History.png',
  };

  // Daftar kelas dengan gambar di folder images
  List<Map<String, dynamic>> classes = [
    {"name": "Mathematics", "image": "images/Matemathics.png"},
    {"name": "Physics", "image": "images/Physics.png"},
    {"name": "Biology", "image": "images/Biology.png"},
  ];

  TextEditingController _controller = TextEditingController();

  void _addClass() {
    if (_controller.text.isNotEmpty) {
      String className = _controller.text;

      // Check if class name exists in the predefined classes
      if (classImages.containsKey(className)) {
        setState(() {
          classes.add({
            "name": className,
            "image": classImages[className], // Add the corresponding image
          });
          _controller.clear();
        });
      } else {
        // Optionally, show a dialog for an invalid class name
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Class name not valid.')),
        );
      }
    }
  }

  void _deleteClass(int index) {
    setState(() {
      classes.removeAt(index);
    });
  }

  void _editClass(int index) {
    _controller.text = classes[index]["name"];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Class"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "Class Name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String className = _controller.text;
                if (className.isNotEmpty && classImages.containsKey(className)) {
                  setState(() {
                    classes[index]["name"] = className;
                    classes[index]["image"] = classImages[className];
                    _controller.clear();
                  });
                  Navigator.of(context).pop();
                } else {
                  // Optionally, show a message if the class name is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Class name is invalid or missing image.')),
                  );
                }
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _viewClassDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseScreen(classes[index]["name"]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Classes"),
      ),
      body: Column(
        children: [
          // Form untuk menambah kelas
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Add Class",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _addClass,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // List kelas
          Expanded(
            child: ListView.builder(
              itemCount: classes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: Container(
                      width: 60, // Menentukan lebar gambar
                      height: 60, // Menentukan tinggi gambar agar berbentuk persegi
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), // Menambahkan sudut melengkung jika diperlukan
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8), // Sudut gambar jika diperlukan
                        child: Image.asset(
                          classes[index]["image"], // Menampilkan gambar kelas
                          fit: BoxFit.cover, // Mengatur gambar agar mengisi ruang dengan baik
                        ),
                      ),
                    ),
                    title: Text(
                      classes[index]["name"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      "Tap to view details",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _editClass(index), // Edit kelas
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteClass(index), // Hapus kelas
                        ),
                      ],
                    ),
                    onTap: () => _viewClassDetails(index), // Tampilkan detail kelas
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}