import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:soumare/police/enrollement.dart';
import 'package:soumare/police/PassPage.dart';
import 'package:soumare/police/pass.dart';
import 'package:soumare/utils/Colors.dart';

import 'homePage.dart';


class PoliceNavigation extends StatefulWidget {
  const PoliceNavigation({super.key});

  @override
  State<PoliceNavigation> createState() => _PoliceNavigationState();
}

class _PoliceNavigationState extends State<PoliceNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildPage(_currentIndex),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Container(
            height: 0.1.sh,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: C.mainColor,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black.withOpacity(.1),
                        )
                      ],
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: GNav(
                          rippleColor: Colors.white,
                          hoverColor: C.mainColor1,
                          // gap: 8,
                          activeColor: C.textColor,
                          iconSize: 24,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          duration: Duration(milliseconds: 400),
                          tabBackgroundColor: Colors.white,
                          color: C.textColor2,
                          tabs: [
                            GButton(
                              icon: Icons.home,
                              text: 'Verification',
                            ),
                            GButton(
                              icon: Icons.help_outline_rounded,
                              text: 'Enrollements',
                            ),
                            GButton(
                              icon: Icons.view_timeline,
                              text: 'Pass',
                            ),
                          ],
                          selectedIndex: _currentIndex,
                          onTabChange: (index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      ),
                    )),

              ],
            ),
          ),
        ));
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return Enrollement();
      case 2:
        return Pass();
      default:
        return Container();
    }
  }
}