import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soumare/police/user_detail.dart';

import 'package:soumare/utils/Colors.dart';
import 'package:soumare/widget/card.dart';

import 'package:vibration/vibration.dart';

import 'bottomNavigationBar.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:no_screenshot/no_screenshot.dart';

import 'package:flutter/services.dart' show rootBundle;

import '../component/inscription.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


enum CarnetState { empty, nonEmpty }
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isLoading = false;
  var t=0;
  bool showIDCard = false;




  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController check = TextEditingController();




  String decodeString(String encoded) {
    return Utf8Decoder().convert(encoded.codeUnits);
  }






  Future<void> scanQR() async {

    try {
      // Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String qrResult = (await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Retour', true, ScanMode.QR)) ;

        if(qrResult.startsWith('-'))
          setState(() {
            t=0;
          });
        if(qrResult.startsWith('1')||qrResult.startsWith('0'))
          setState(() {
            t=1;
          });

      print("/////////////////////////////////////////////////////////////${t}");
      // t.isNotEmpty?AwesomeDialog(
      //     body: IDCardWidget(
      //       name: 'SYlla',
      //       profession: '',
      //       dob: '',
      //       nationality: '',
      //       placeOfBirth: '',
      //       profileImagePath: 'assets/images/profile.png',
      //       lastname: 'Mamadou', nina: '101MC4544554',),
      //     context: context,
      //     dialogType: DialogType.noHeader,
      //     animType: AnimType.scale,
      //     width: double.maxFinite,
      //     btnOkOnPress: () {
      //
      //     },
      //     btnCancelOnPress: () {
      //
      //     },
      //     btnOkText: 'Entrée',
      //     btnCancelText: 'Sortie'
      // ).show():Container();

    } catch (e) {
      print('++++++++++++++++++++++++++++++++++Erreur de scan: $e');
    }
  }

  final _noScreenshot = NoScreenshot.instance;
  List<Map<String, String>> idCardInfoList = [
    {
      "nina": "101CM942002003E",
      "name": "Mamadou",
      "lastname": "Sylla",
      "profession": "Etudiant et élève",
      "dob": "15/03/2001",
      "sex": "M",
      "nationality": "Malienne",
      "placeOfBirth": "Douala",
      "dod": "06/04/2023", // Date of delivery
      "doe": "06/04/2028", // Date of expiration
      "profileImagePath": "path/to/profile_image.jpg",
      "status": "sortie", // You can modify this field as needed
    },
    {
      "nina": "201CM123456789A",
      "name": "Amina",
      "lastname": "Keita",
      "profession": "Ingénieur",
      "dob": "10/10/1995",
      "sex": "F",
      "nationality": "Malienne",
      "placeOfBirth": "Bamako",
      "dod": "01/01/2021",
      "doe": "01/01/2026",
      "profileImagePath": "path/to/amina_image.jpg",
      "status": "entree",
    },
    {
      "nina": "201CM123456789A",
      "name": "Amina",
      "lastname": "Keita",
      "profession": "Ingénieur",
      "dob": "10/10/1995",
      "sex": "F",
      "nationality": "Malienne",
      "placeOfBirth": "Bamako",
      "dod": "01/01/2021",
      "doe": "01/01/2026",
      "profileImagePath": "path/to/amina_image.jpg",
      "status": "entree",
    },
    {
      "nina": "201CM123456789A",
      "name": "Amina",
      "lastname": "Keita",
      "profession": "Ingénieur",
      "dob": "10/10/1995",
      "sex": "F",
      "nationality": "Malienne",
      "placeOfBirth": "Bamako",
      "dod": "01/01/2021",
      "doe": "01/01/2026",
      "profileImagePath": "path/to/amina_image.jpg",
      "status": "sotie",
    },
    // Add more ID card information maps as needed
  ];


  @override
  void initState() {
    super.initState();
   }

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
              children: [
              SafeArea(
              top: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Identifications',
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
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0, 0),
                            child: Container(
                              height: 0.1.sh/1.5,
                              // color: Colors.red,
                              child: Builder(
                                  builder: (context) {
                                    final TabController tabController = DefaultTabController.of(context);
                                    tabController.addListener(() {
                                      setState(() {});
                                    });
                                    return TabBar(
                                      labelColor: C.mainColor,
                                      unselectedLabelColor: Color(0xFF606A85),
                                      labelStyle: C.headLineStyle3.copyWith(fontWeight: FontWeight.bold),
                                      unselectedLabelStyle:  C.headLineStyle3,
                                      indicatorColor: C.mainColor,
                                      // indicator:BoxDecoration(
                                      //     color: C.textColor2,
                                      //     borderRadius: BorderRadius.circular(20)
                                      // ),
                                      indicatorSize: TabBarIndicatorSize.label,
                                      // padding: EdgeInsets.all(4),
                                      tabs: [
        
                                        Tab(
                                          text: 'Vérification',
                                          icon: Icon(Icons.search),
                                          // icon: Image.asset(
                                          //   tabController.index == 0
                                          //       ? 'assets/images/loupe-col.png'
                                          //       : 'assets/images/loupe-gris.png',
                                          //   height: 24.h,
                                          // ),
                                          iconMargin: REdgeInsets.all(2).r,
                                        ),
                                        Tab(
                                          text: 'Entree/Sortie',
                                          icon: Icon(Icons.input),
                                          // Image.asset(
                                          //   tabController.index == 1
                                          //       ? 'assets/images/sering-col.png'
                                          //       : 'assets/images/seringuei-gris.png',
                                          //   height: 25.h,
                                          // ),
                                          iconMargin: REdgeInsets.all(2).r,
                                        ),
                                        // Tab(
                                        //   text: 'Inscriptions',
                                        //   icon: Image.asset(
                                        //     tabController.index == 2
                                        //         ? 'assets/images/formulaire-col.png'
                                        //         : 'assets/images/formulaire-gris.png',
                                        //     height: 24.h,
                                        //   ),
                                        //   iconMargin: REdgeInsets.all(2).r,
                                        // ),
                                      ],
                                    );
                                  }
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              // controller: _model.tabBarController,
                              children: [
                                // isLoading?Center(
                                //     child: LoadingAnimationWidget
                                //         .discreteCircle(
                                //       color: const Color(0xFF1A1A3F),
                                //       secondRingColor: const Color(0xFFEA3799),
                                //       thirdRingColor: C.mainColor,
                                //       size: 50.sp,
                                //     )):
                                Stack(children: [
                                  t==0?_widget():Center(
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 295.h,
                                          width: double.maxFinite,
                                          child: IDCardWidget(
                                            name: 'SYLLA',
                                            profession: 'DevOps',
                                            dob: '15/03/2001',
                                            nationality: 'Malien',
                                            placeOfBirth: 'DOUALA',
                                            profileImagePath: 'assets/images/profile.png',
                                            lastname: 'Mamadou', nina: '101MC4544554', sex: 'M', dod: '25/05/2024', doe: '25/05/2029', status: 'entree',),
                                        ),
                                        20.verticalSpace,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  // foregroundColor: Colors.black54,
                                                  backgroundColor: C.red,
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(20)).r
                                                  ),
                                                  // padding: EdgeInsets.symmetric(horizontal: 20.w),
                                                ),
                                                onPressed: () {
                                                  // Vibration.vibrate(
                                                  //     amplitude: 5);
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetail(),));
                                                },
                                                child:  Text('Sortie du\nTerritoire', style: C.headLineStyle4.copyWith(color: C.textColor2),),
                                              
                                              ),
                                            ),
                                            20.horizontalSpace,
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  // foregroundColor: Colors.black54,
                                                  backgroundColor: C.green,
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(20)).r
                                                  ),
                                                  // padding: EdgeInsets.symmetric(horizontal: 20.w),
                                                ),
                                                onPressed: () {
                                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationCard(myList[index])));
                                                  // setState(() {
                                                  //   check.text =
                                                  //   myList[index];
                                                  //   _initData2();
                                                  //   check.clear();
                                                  // });
                                              
                                              
                                                },
                                                child: Text('Entrée sur\nle territoire', style: C.headLineStyle4.copyWith(color: C.textColor2),),
                                              
                                              ),
                                            ),

                                          ],
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            // foregroundColor: Colors.black54,
                                            backgroundColor: C.mainColor,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20)).r
                                            ),
                                            // padding: EdgeInsets.symmetric(horizontal: 20.w),
                                          ),
                                          onPressed: () {
                                           setState(() {
                                             t=1;
                                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PoliceNavigation(),));
                                           });


                                          },
                                          child:Icon(Icons.restart_alt,color: C.textColor2),

                                        ),
                                        Spacer()
                                      ],
                                    ),
                                  ),
                                ],
                                ),
                                // myList.isEmpty ? Center(
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
                                //         Text('Les certificats enregistrés dans l\'onglet vérifier apparaîtront ici',
                                //           style: C.headLineStyle3,
                                //           textAlign: TextAlign.center,
                                //         ),
                                //         Spacer()
                                //       ],
                                //     )) :
                                ListView(
                                  // mainAxisSize: MainAxisSize.max,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [

                                    ListView.builder(
                                      physics:
                                      NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: idCardInfoList.length, // Adjust itemCount as needed
                                      itemBuilder: (context, index) {
                                        final cardInfo = idCardInfoList[index];
                                        final status = cardInfo['status'];
                                        // Conditionally set the icon based on the status
                                        IconData statusIcon = status == 'entree'
                                            ? Icons.arrow_forward // If status is "in", show check icon
                                            : Icons.arrow_back; // If status is "out", show cancel icon

                                        Color iconColor = status == 'entree' ? Colors.green : Colors.red;
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
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'NINA',
                                                        style: C
                                                            .headLineStyle2,
                                                      ),
                                                      Container(
                                                        margin: REdgeInsets
                                                            .only(
                                                            top: 5),
                                                        child:
                                                        Text(
                                                          '${idCardInfoList[index]['nina']}',
                                                          style: C
                                                              .headLineStyle2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          // foregroundColor: Colors.black54,
                                                          backgroundColor:  iconColor,
                                                          elevation: 5,
                                                          shape: CircleBorder(),
                                                          // padding: EdgeInsets.symmetric(horizontal: 20.w),
                                                        ),
                                                        onPressed: () {
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationCard(myList[index])));
                                                          // setState(() {
                                                          //   check.text =
                                                          //   myList[index];
                                                          //   _initData2();
                                                          //   check.clear();
                                                          // });


                                                        },
                                                        child:  Icon(statusIcon, color: C.textColor2),

                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          // foregroundColor: Colors.black54,
                                                          backgroundColor: C.textColor2,
                                                          elevation: 5,
                                                          shape: CircleBorder(),
                                                          // padding: EdgeInsets.symmetric(horizontal: 20.w),
                                                        ),
                                                        onPressed: () {
                                                          // Vibration.vibrate(
                                                          //     amplitude: 5);
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetail(),));
                                                        },
                                                        child:  Icon(
                                                          Icons
                                                              .remove_red_eye_rounded,
                                                          color:
                                                          C.mainColor,
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
                                      },
                                    ),
                                  ],
                                ),

                                //
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
              ),
        ]),

    );
  }


  Widget _widget() {
    return Positioned(
      bottom: 10.h,
      right: 0.4.sw,
      child: Column(
        children: [
          Container(
            width: 0.2.sw,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: C.mainColor1,
                elevation: 5,
                shape: CircleBorder(),
              ),
              onPressed: () {
                scanQR();
              },
              child: Icon(
                Icons.document_scanner_outlined,
                color: C.textColor2,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }



  // Widget card(){
  //   return Padding(
  //     padding: EdgeInsets.all(0.0),
  //     child: Column(
  //       children: [
  //         // SizedBox(height: 10),
  //         Card(
  //           elevation: 4.0,
  //           color: Colors.yellowAccent.shade100,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Image(image: AssetImage('assets/images/logo2.png',), width: 40.w,),
  //                     Text('REPUBLIQUE DU MALI',style: C.headLineStyle2,),
  //                     Image(image: AssetImage('assets/images/mali.png',), width: 40.w,),
  //                   ],
  //                 ),
  //                 ListTile(
  //                   leading: CircleAvatar(
  //                     radius: 30,
  //                     backgroundImage: AssetImage('assets/profile_pic.jpg'), // Your image asset here
  //                   ),
  //                   title: Text('MAMADOU SYLLA', style: TextStyle(fontWeight: FontWeight.bold)),
  //                   subtitle: Text('Student'),
  //                 ),
  //                 Divider(),
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Text('DOB: ', style: TextStyle(fontWeight: FontWeight.bold)),
  //                           Text('15/03/2001'),
  //                         ],
  //                       ),
  //                       SizedBox(height: 10),
  //                       Row(
  //                         children: [
  //                           Text('Nationality: ', style: TextStyle(fontWeight: FontWeight.bold)),
  //                           Text('Malian'),
  //                         ],
  //                       ),
  //                       SizedBox(height: 10),
  //                       Row(
  //                         children: [
  //                           Text('Place of Birth: ', style: TextStyle(fontWeight: FontWeight.bold)),
  //                           Text('Douala'),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //
  //   );
  // }

}
