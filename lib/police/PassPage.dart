import 'dart:async';
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:expandable/expandable.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:http/http.dart' as http;
import 'package:soumare/component/passform.dart';
import 'package:soumare/utils/Colors.dart';
import 'package:vibration/vibration.dart';


class PassPage extends StatefulWidget {
  const PassPage({super.key});

  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController check = TextEditingController();
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );
    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }
  var now = DateTime.now();
  var formatter = DateFormat('yyyy');
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        // inscriptions.isEmpty? Center(
        //     child: Column(
        //       children: [
        //         Spacer(),
        //         LoadingAnimationWidget.discreteCircle(
        //           color: const Color(0xFF1A1A3F),
        //           secondRingColor:
        //           const Color(0xFFEA3799),
        //           thirdRingColor: C.mainColor,
        //           size: 50.sp,
        //         ),
        //         Text('Les inscriptions effectués apparaîtront ici',
        //           style: C.headLineStyle3,
        //           textAlign: TextAlign.center,
        //         ),
        //         Spacer()
        //       ],
        //     )) :
        ListView.builder(
          itemCount:5,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16).r
              ),
              margin:
              EdgeInsets.symmetric(
                  vertical: 8.w,
                  horizontal: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16).r,
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                  EdgeInsets
                      .all(8.0),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .center,
                    children: [
                      Row(
                        children: [
                          Text(
                            '101CM942002003E',
                            style: C
                                .headLineStyle2,
                          ),
                          // 2.horizontalSpace,
                          // Container(
                          //   child:
                          //   Text(
                          //     ' (${inscriptions[index].idProspect.toString()})',
                          //     style: C
                          //         .headLineStyle2,
                          //   ),
                          // ),
                        ],
                      ),

                      Row(
                        children: [
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     // foregroundColor: Colors.black54,
                          //     backgroundColor: C.textColor2,
                          //     elevation: 5,
                          //     shape: CircleBorder(),
                          //     // padding: EdgeInsets.symmetric(horizontal: 20.w),
                          //   ),
                          //   onPressed: () {
                          //     Vibration.vibrate(
                          //         amplitude: 12);
                          //     AwesomeDialog(
                          //         context: context,
                          //         dialogType:
                          //         DialogType.warning,
                          //         animType:
                          //         AnimType.scale,
                          //         // headerAnimationLoop: tr,
                          //         title: 'Suppression',
                          //         titleTextStyle: C
                          //             .headLineStyle1
                          //             .copyWith(
                          //             color:
                          //             Colors.red),
                          //         desc:
                          //         'Voulez vous supprimé cet inscription ?',
                          //         // body: Image.asset('assets/images/no.png'),
                          //         descTextStyle:
                          //         C.headLineStyle5,
                          //         btnOkOnPress: () {
                          //           // _deleteInscription(inscriptions[index].id!.toInt());
                          //         },
                          //         // btnOkIcon: Icons.cancel,
                          //         // btnOkColor: Colors.green,
                          //         btnCancelOnPress: () {},
                          //         btnCancelText: 'Non',
                          //         btnOkText: 'Oui')
                          //       ..show();
                          //   },
                          //   child:  Icon(
                          //     Icons
                          //         .delete_rounded,
                          //     color:
                          //     C.mainColor,
                          //     size:
                          //     20,
                          //   ),
                          //
                          // ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // foregroundColor: Colors.black54,
                              backgroundColor: C.textColor2,
                              elevation: 5,
                              shape: CircleBorder(),
                              // padding: EdgeInsets.symmetric(horizontal: 20.w),
                            ),
                            onPressed: () {
                              var formattedDate = formatter.format(now);
                              AwesomeDialog(
                                context: context,
                                dialogType:
                                DialogType.noHeader,
                                animType:
                                AnimType.scale,
                                // headerAnimationLoop: tr,
                                // title: 'Suppression',
                                // titleTextStyle: C
                                //     .headLineStyle1
                                //     ?.copyWith(
                                //     color:
                                //     Colors.red),
                                // desc:
                                // 'Voulez vous supprimé ce certificat ?',
                                // body: Image.asset('assets/images/no.png'),
                                descTextStyle:
                                C.headLineStyle5,
                                // btnOkOnPress: () {
                                //   _deleteInscription(inscriptions[index].id!.toInt());
                                // },
                                // btnOkIcon: Icons.cancel,
                                // btnOkColor: Colors.green,
                                body: Container(
                                    width: double.maxFinite,
                                    // height: 0.68.sh,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Image.asset('assets/images/test.png',height: 100.h,),
                                        ),
                                        20.verticalSpace,
                                        Center(
                                          child: Text("Pass", style: C.headLineStyle1.copyWith(color: Colors.blue.shade900),),
                                        ),
                                        10.verticalSpace,
                                        Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // Text('inscriptions[index].idProspect.toString()', style: C.headLineStyle1.copyWith(color: Colors.blue.shade900),),
                                              Text('Mamadou Sylla', style: C.headLineStyle2),
                                            ],
                                          ),
                                        ),
                                        Center(child: Text('NINA : 101CM942002003E', style: C.headLineStyle2.copyWith(fontSize: 18.sp))),
                                        // if(inscriptions[index].numPasseportProspect != null)
                                        Center(child: Text('Sexe : M', style: C.headLineStyle2.copyWith(fontSize: 18.sp))),
                                        Center(child: Text('Nationalite : Malienne', style: C.headLineStyle2.copyWith(fontSize: 18.sp))),
                                        Center(child: Text('Date : 15/01/2001', style: C.headLineStyle2.copyWith(fontSize: 18.sp))),
                                        Center(child: Text('Lieu de naissance : Cameroun', style: C.headLineStyle2.copyWith(fontSize: 18.sp))),
                                        Center(child: Text('Numero de telephone : 83856503', style: C.headLineStyle2.copyWith(fontSize: 18.sp))),
                                        // Divider(thickness: 1,color: C.textColor.withOpacity(0.5),),
                                        // Center(child: Padding(
                                        //   padding:  EdgeInsets.all(10.0).w,
                                        //   child: Text('@ Maurivax ${formattedDate}', style: C.headLineStyle4.copyWith(color: C.textColor.withOpacity(0.8))),
                                        // )),
                                        10.verticalSpace,


                                      ],
                                    )
                                ),

                              )
                                ..show();
                            },
                            child:  Icon(
                              Icons
                                  .remove_red_eye_rounded,
                              color:
                              C.textColor,
                              size:
                              20,
                            ),

                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },),
        Positioned(
          // top: 0,
          bottom: 15.h,
          right: 15.w,
          child: Container(
            width: 250.w,
            child: FloatingActionBubble(// Menu items
              items: <Bubble>[
              ],
              // animation controller
              animation: _animation,

              // // On pressed change animation state
              // onPress: () => _animationController.isCompleted
              //     ? _animationController.reverse()
              //     : _animationController.forward(),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PassForm();
                },));
              },
              // Floating Action button Icon color
              iconColor: C.mainColor,
              // Flaoting Action button Icon
              iconData: Icons.add,
              backGroundColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
