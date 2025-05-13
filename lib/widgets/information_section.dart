import 'package:flutter/material.dart';

class InformationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.7),
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Course Length : ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.timer,
                color: Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                "24 Hours",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Rating : ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.grey,
              ),
              SizedBox(width: 10),
              Text(
                "4.5",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ],
      ),
      );
  }
}