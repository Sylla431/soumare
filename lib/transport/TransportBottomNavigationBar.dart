import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:soumare/police/pass.dart';
import 'package:soumare/transport/billet_acheter.dart';
import 'package:soumare/transport/confirm_achat.dart';
import 'package:soumare/colis/colis_pages.dart';
import 'package:soumare/transport/transport_home_page.dart';
import 'package:soumare/utils/Colors.dart';




class TransportNavigation extends StatefulWidget {
  const TransportNavigation({super.key});

  @override
  State<TransportNavigation> createState() => _NavigationState();
}

class _NavigationState extends State<TransportNavigation> {
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
                              text: 'Acceuil',
                            ),
                            GButton(
                              icon: Icons.airplane_ticket,
                              text: 'Billet Acheter',
                            ),
                            GButton(
                              icon: Icons.shopping_bag,
                              text: 'Mes Colis',
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
        return TransportPage();
      case 1:
        return Billet();
      case 2:
        return ColisPages();
      default:
        return Container();
    }
  }
}