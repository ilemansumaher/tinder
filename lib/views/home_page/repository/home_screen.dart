import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<String> images = [
    "assets/images/Picture.png",
    "assets/images/Card3.png",
    "assets/images/Card4.png",
    "assets/images/Card5.png",
  ];

  List<String> imagesBtn = [
    "assets/logo/Back.png",
    "assets/logo/X.png",
    "assets/logo/Starbtn.png",
    "assets/logo/Like.png",
    "assets/logo/Boost.png",
  ];

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          currentImageIndex = (currentImageIndex + 1) % images.length;
          _slideAnimation = Tween<Offset>(
            begin: Offset.zero,
            end: Offset.zero,
          ).animate(_controller);
        });

        _controller.reset();
      }
    });
  }

  void animateCard(String direction) {
    Offset endOffset;

    if (direction == "left") {
      endOffset = Offset(-1.5, 1.0);
    } else {
      endOffset = Offset(1.5, 1.0);
    }

    setState(() {
      _slideAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: endOffset,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(images[(currentImageIndex + 1) % images.length]),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0),
                  image: DecorationImage(
                    image: AssetImage(images[currentImageIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(imagesBtn[0]),
                    ),
                    IconButton(
                      onPressed: () {
                        animateCard("left");
                      },
                      icon: Image.asset(imagesBtn[1]),
                    ),
                    IconButton(
                      onPressed: () {
                        animateCard("right");
                      },
                      icon: Image.asset(imagesBtn[2]),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(imagesBtn[3]),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(imagesBtn[4]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
