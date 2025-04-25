import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List images = ["assets/images/Picture.png"];
  List imagesBtn = [
    "assets/logo/Back.png",
    "assets/logo/X.png",
    "assets/logo/Starbtn.png",
    "assets/logo/Like.png",
    "assets/logo/Boost.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11.0),
            image: DecorationImage(image: AssetImage(images[0],),fit: BoxFit.cover ),
          ),
          
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          IconButton(onPressed: (){}, icon: Image.asset(imagesBtn[0])),
          IconButton(onPressed: (){}, icon: Image.asset(imagesBtn[1])),
          IconButton(onPressed: (){}, icon: Image.asset(imagesBtn[2])),
          IconButton(onPressed: (){}, icon: Image.asset(imagesBtn[3])),
          IconButton(onPressed: (){}, icon: Image.asset(imagesBtn[4])),
        ],))
      ],
    );
  }
}
