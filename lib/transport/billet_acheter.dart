import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';
import 'billet_page.dart';

class Billet extends StatefulWidget {
  const Billet({super.key});

  @override
  State<Billet> createState() => _BilletState();
}

class _BilletState extends State<Billet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            // height: 0.11.sh,
            // color: Colors.red,
            child: Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Billet Acheter',
                    style: C.headLineStyle1,
                  ),
                  Container(
                    width: 90.w,
                    height: 90.w,
                    alignment: AlignmentDirectional(0, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          Image.asset("assets/images/transport.png")
                              .image),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: BilletAcheter())
        ],
      ),
    );
  }
}
