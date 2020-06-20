import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:hellohuts_app/states/app_state.dart';

import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({Key key, this.pageController}) : super(key: key);
  final PageController pageController;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  PageController _pageController;
  int _selectedIndex = 0;
  @override
  void initState() {
    _pageController = widget.pageController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    return Container(
      height: 56,
     
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        
        child: GNav(
            backgroundColor: Colors.transparent,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
          
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 3.0),
            duration: Duration(milliseconds: 400),
            tabs: [
              GButton(
                icon: Icons.home,
                gap: 4.0,
                text: 'Home',
                backgroundColor: Colors.blue.withOpacity(0.5),
              ),
              GButton(
                icon: Icons.map,
                text: 'Explore',
                backgroundColor: Colors.blue.withOpacity(0.5),
              ),
              GButton(
                icon: Icons.place,
                text: 'HelloSpace',
                backgroundColor: Colors.blue.withOpacity(0.5),
              ),
              GButton(
                icon: Icons.person,
                text: 'User',
                backgroundColor: Colors.red.withOpacity(0.5),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                state.setPageIndex = index;
              });
            }),
      ),
    );
  }
}
