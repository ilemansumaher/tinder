import 'package:flutter/material.dart';
import 'package:tinder/views/home_page/repository/home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List pages = [HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo/logo.png"),
        centerTitle: true,
      ),
      body: IndexedStack(children: [pages[0]]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "", 
            icon: Image.asset("assets/logo/tinder.png"),
          ),
          BottomNavigationBarItem(
            label: "", 
            icon: Image.asset("assets/logo/Star.png"),
          ),
          BottomNavigationBarItem(
            label: "", 
            icon: Image.asset("assets/logo/Search.png"),
          ),
          BottomNavigationBarItem(
            label: "", 
            icon: Image.asset("assets/logo/chat.png"),
          ),
          BottomNavigationBarItem(
            label: "", 
            icon: Image.asset("assets/logo/person.png"),
          ),
          
        ],
       currentIndex: 0,
       selectedItemColor: Colors.amber, 
       onTap: null,
      ),
    );
  }
}
