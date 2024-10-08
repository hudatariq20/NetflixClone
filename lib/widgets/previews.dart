import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/models.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  const Previews({super.key, required this.title, required this.contentList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text('Previews',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ),
        //pciture
        Container(
          height: 165,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: ((BuildContext context, int index) {
                final content = contentList[index];
                return GestureDetector(
                  onTap: () =>  print(content.name),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                       Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: content.color!, width: 4.0)
                        ),
                       ),

                      Container(
                       // margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        height: 130,
                        width: 130,
                           decoration: BoxDecoration(
                          gradient:const LinearGradient(
                            colors: [Colors.black87,Colors.black54, Colors.transparent],
                            stops: [0, 0.25, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter
                            ),
                          shape: BoxShape.circle,
                          border: Border.all(color: content.color!, width: 4.0)

                        )
                         
                       ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SizedBox(height: 60,
                        child: Image.asset(content.titleImageUrl!),
                        )),
                     
                    ],
                  ),
                );
              })),
        )
      ],
    );
  }
}
