import 'package:flutter/material.dart';
import 'package:workspace_ieee/presentation/views/home_view.dart';
import 'package:workspace_ieee/presentation/views/profile_view.dart';
import 'package:workspace_ieee/presentation/views/search_view.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int index = 0;
  List<Widget> screens = [
    HomeView(),
    SearchView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
