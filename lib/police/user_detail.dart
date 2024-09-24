import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/card.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 295.h,
            width: double.maxFinite,
            child: IDCardWidget(
              name: 'SYLLA',
              profession: 'DevOps',
              dob: '15/03/2001',
              nationality: 'Malien',
              placeOfBirth: 'DOUALA',
              profileImagePath: 'assets/images/profile.png',
              lastname: 'Mamadou', nina: '101MC4544554', sex: 'M', dod: '25/05/2024', doe: '25/05/2029', status: 'sortie',),
          ),
        ),
      ),
    );
  }
}
