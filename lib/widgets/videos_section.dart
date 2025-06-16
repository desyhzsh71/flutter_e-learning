import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VideosSection extends StatelessWidget {

  List videoList = [
    'Understanding the Fundamentals',
    'A Beginner’s Guide',
    'Introduction',
    'Learning the Basics',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0 ? Colors.grey : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.play_arrow_rounded,
            color: Colors.white, 
            size: 30,
            ),
          ),
          title: Text(videoList[index]),
          subtitle: Text("15 min 10 sec"),
        );
      },
    );
  }
}