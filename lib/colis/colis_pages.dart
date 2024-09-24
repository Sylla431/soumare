import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soumare/colis/send_colis_form.dart';
import 'package:soumare/utils/Colors.dart';

import '../component/inscription.dart';
import 'colis_home_page.dart';

class ColisPages extends StatefulWidget {
  const ColisPages({super.key});

  @override
  State<ColisPages> createState() => _ColisPagesState();
}

class _ColisPagesState extends State<ColisPages> {
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
                    'Colis',
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
          Expanded(child: ShipmentHistoryPage())
        ],
      ),
    );
  }
}
