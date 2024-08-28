import 'package:flutter/material.dart';

import '../models/models.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginal;
  const ContentList(
      {super.key,
      required this.title,
      required this.contentList,
      this.isOriginal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
          //next add the image here
          Container(
              height: isOriginal ? 500 : 220.0,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: contentList.length,
                  itemBuilder: ((context, index) {
                    final content = contentList[index];                    return GestureDetector(
                      onTap: () => print(content.name),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: isOriginal? 500.0: 220.0,
                        width: isOriginal? 200.0 : 130.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(content.imageUrl),fit: BoxFit.cover),
                          ),
                        ) 
                    );
                  })))
        ],
      ),
    );
  }
}
