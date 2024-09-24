import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';



class IDCardWidget extends StatelessWidget {
  final String nina;
  final String name;
  final String lastname;
  final String profession;
  final String dob;
  final String sex;
  final String nationality;
  final String placeOfBirth;
  final String dod;
  final String doe;
  final String profileImagePath;
  final String status;
  // Path for the profile image

  IDCardWidget({
    required this.name,
    required this.profession,
    required this.dob,
    required this.nationality,
    required this.placeOfBirth,
    required this.profileImagePath, required this.lastname, required this.nina, required this.sex, required this.dod, required this.doe, required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.yellowAccent.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage('assets/images/mali.png',), width: 40.h,),
                Column(
                  children: [
                    Text('REPUBLIQUE DU MALI',style: C.headLineStyle5,),
                    Text('Carte d\'identite du MALI',style: C.headLineStyle5,),
                  ],
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 200.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(profileImagePath),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                Divider(),
                Padding(
                  padding:  EdgeInsets.only(left: 8.0).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Text('NINA: ', style: C.headLineStyle6),
                                Text(nina,style: C.headLineStyle5,),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0).r,
                              child: Column(
                                children: [
                                  Text('Numero de carte / Card number', style: C.headLineStyle6.copyWith(fontSize: 9.sp),),
                                  Text(nina,style: C.headLineStyle6.copyWith(fontSize: 9.sp),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Prenom / First name: ', style: C.headLineStyle6),
                          Text(name,style: C.headLineStyle3.copyWith(fontSize: 17.sp),),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nom / Surname: ', style: C.headLineStyle6),
                          Text(lastname,style: C.headLineStyle3.copyWith(fontSize: 17.sp),),
                        ],
                      ),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 48.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sexe / Sex ', style: C.headLineStyle6),
                                Text(sex,style: C.headLineStyle3.copyWith(fontSize: 17.sp),),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nationnalité / Nationnality ', style: C.headLineStyle6,overflow: TextOverflow.ellipsis,),
                                Text(nationality,style: C.headLineStyle3.copyWith(fontSize: 17.sp),),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date de naissance / Date of Birth', style: C.headLineStyle6,overflow: TextOverflow.ellipsis,),
                                Text(dob,style: C.headLineStyle3.copyWith(fontSize: 17.sp),),
                              ],
                            ),
                          ),

                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lieu de naissance / Place of Birth: ', style: C.headLineStyle6),
                          Text(placeOfBirth,style: C.headLineStyle3.copyWith(fontSize: 17.sp),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 120.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date de delivrance / Date of issue ', style: C.headLineStyle6,),
                                Text(dod,style: C.headLineStyle3.copyWith(fontSize: 17.sp),),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date d\'expiration / Date of expire', style: C.headLineStyle6),
                                Text(doe,style: C.headLineStyle3.copyWith(fontSize: 17.sp),),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Profession / Occupation', style: C.headLineStyle6),
                          Text(profession,style: C.headLineStyle3.copyWith(fontSize: 17.sp),),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}

// // Example usage of the reusable widget
// class IDCardExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: IDCardWidget(
//         name: 'Mamadou Sylla',
//         profession: 'Student',
//         dob: '15/03/2001',
//         nationality: 'Malian',
//         placeOfBirth: 'Douala',
//         profileImagePath: 'assets/profile_pic.jpg',
//         lastname: '', // Provide the path of your image
//       ),
//     );
//   }
// }
