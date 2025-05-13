import 'package:flutter/material.dart';
import 'package:percobaan/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView( // Menambahkan scroll view untuk menghindari overflow
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Memungkinkan ukuran kolom menyesuaikan dengan konten
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50), // Mengatur posisi gambar
                child: Image.asset(
                  "images/book.png",
                  scale: 2.0,
                ),
              ),
              SizedBox(height: 20), // Jarak antara gambar dan form
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login to Your Account",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Material(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          // Logika untuk melakukan login
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 80,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        // Logika untuk navigasi ke halaman registrasi jika ada
                      },
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
