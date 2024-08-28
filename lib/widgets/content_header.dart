import 'package:flutter/material.dart';
import 'package:netflix_clone/models/models.dart';
import 'widgets.dart';


class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                   fit: BoxFit.cover)

          ),
        ),

        Container(
          height: 500,
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
              )
          )

        ),
        //title Image
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl!),
            
          ),
        ),

        //PUT THE VERTICAL ICONS AND FLAT BUTTON
        Positioned(
          left: 0, right: 0, bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () => print('add')
              ),
              PlayButton(),
              VerticalIconButton(
                icon: Icons.info,
                title: 'Info',
                onTap: () => print('Info')
              )
            ],
          )
        )
      ],
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      
      onPressed: () => print('Play'),
      icon: const Icon(Icons.play_arrow, size: 30,color: Colors.black,),
      //style: Colors.white,
      style: TextButton.styleFrom(backgroundColor: Colors.white, padding: const EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),),
      label: const Text('Play', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
    );
  }
}
