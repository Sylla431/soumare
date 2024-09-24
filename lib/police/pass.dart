import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soumare/police/PassPage.dart';
import 'package:soumare/component/passform.dart';
import 'package:soumare/utils/Colors.dart';

import '../component/inscription.dart';

class Pass extends StatefulWidget {
  const Pass({super.key});

  @override
  State<Pass> createState() => _PassState();
}

class _PassState extends State<Pass> {
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
                    'Pass',
                    style: C.headLineStyle1,
                  ),
                  Container(
                    width: 90.w,
                    height: 90.w,
                    alignment: AlignmentDirectional(0, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          Image.asset("assets/images/test.png")
                              .image),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: PassPage())
        ],
      ),
    );
  }
}
