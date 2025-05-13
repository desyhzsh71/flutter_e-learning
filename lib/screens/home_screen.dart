import 'package:flutter/material.dart';
import 'package:percobaan/screens/classes_screen.dart'; // Import ClassesScreen
import 'package:percobaan/screens/quiz_screen.dart'; // Import QuizScreen
import 'package:percobaan/screens/exams_screen.dart'; // Import ExamsScreen
import 'package:percobaan/screens/course_screen.dart'; // Import CourseScreen
import 'package:percobaan/screens/category_screen.dart'; // Import CategoryScreen
import 'package:percobaan/screens/live_course_screen.dart'; // Import LiveCourseScreen
import 'package:percobaan/screens/leaderboard_screen.dart'; // Import LeaderboardScreen
import 'package:percobaan/screens/account_screen.dart'; // Import AccountScreen

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  // List kategori
  List catName = [
    "Category",
    'Classes',
    'Quiz',
    'Exams',
    'Live Course',
    'LeaderBoard',
  ];

  // Warna untuk setiap kategori
  List<Color> catColors = [
    Colors.grey,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
  ];

  // List nama kursus
  List imgList = [
    'Matemathics',
    'Chemistry',
    'Biology',
    'Physics',
    'Language',
    'History',
  ];

  // Ikon untuk setiap kategori
  List<Icon> catIcons = [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.quiz, color: Colors.white, size: 30),
    Icon(Icons.file_copy, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView(
        children: [
          // Bagian Header
          Container(
            padding: EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    "Find Your Courses",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                // TextField untuk mencari kursus
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here...",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Menampilkan kategori
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catName.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Tindakan saat kategori diklik
                        if (catName[index] == 'Classes') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassesScreen(),
                            ),
                          );
                        } else if (catName[index] == 'Quiz') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizScreen(),
                            ),
                          );
                        } else if (catName[index] == 'Exams') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExamsScreen(),
                            ),
                          );
                        } else if (catName[index] == 'Live Course') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LiveCourseScreen(),
                            ),
                          );
                        } else if (catName[index] == 'LeaderBoard') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LeaderboardScreen(),
                            ),
                          );
                        } else if (catName[index] == 'Category') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(),
                            ),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: catIcons[index],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            catName[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                // Menampilkan kursus
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                  itemCount: imgList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10, // Jarak horizontal antar kotak
                    mainAxisSpacing: 10, // Jarak vertikal antar kotak
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseScreen(imgList[index]),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  "images/${imgList[index]}.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              imgList[index],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "20 Videos",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 32,
        selectedItemColor: Colors.grey,
        selectedFontSize: 18,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account'), // Menambahkan item Account
        ],
        onTap: (index) {
          // Navigasi berdasarkan index item yang dipilih
          if (index == 2) {
            // Navigasi ke halaman AccountPage
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AccountPage(), // Arahkan ke AccountPage
              ),
            );
          }
        },
      ),
    );
  }
}
