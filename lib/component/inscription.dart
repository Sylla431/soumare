import 'dart:convert';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

import '../utils/Colors.dart';
import 'add_form.dart';

class CompleteForm extends StatefulWidget {
   CompleteForm( {Key? key, }) : super(key: key);

  @override
  State<CompleteForm> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends State<CompleteForm> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  // List<Inscription> inscriptions = [];

  // Future<List<Inscription>> getInscriptions() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? inscriptionsJsonString = prefs.getString('inscriptions');
  //   if (inscriptionsJsonString != null) {
  //     List<dynamic> jsonList = json.decode(inscriptionsJsonString);
  //     return jsonList.map((json) => Inscription.fromJson(json)).toList();
  //   } else {
  //     return [];
  //   }
  // }
  // Future<void> _loadInscriptions() async {
  //   List<Inscription> loadedInscriptions = await getInscriptions();
  //   setState(() {
  //     inscriptions = loadedInscriptions.reversed.toList();
  //   });
  // }
  var now = DateTime.now();
  var formatter = DateFormat('yyyy');

  String decodingString(String encodedString) {
    // Decode the UTF-8 encoded string with error handling
    List<int> utf8EncodedBytes = encodedString.codeUnits;
    String decodedString = '';

    try {
      decodedString = Utf8Decoder(allowMalformed: true).convert(utf8EncodedBytes);
    } catch (e) {
      print('Error decoding string: $e');
      // Handle the error (e.g., log it, provide a default value, etc.)
    }

    return decodedString;
  }

  // Suppression d'une inscription par id
  // Future<void> deleteInscription(int id) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   // Récupérer la liste existante d'inscriptions
  //   String? inscriptionsJsonString = prefs.getString('inscriptions');
  //   List<Inscription> inscriptions = [];
  //
  //   if (inscriptionsJsonString != null) {
  //     List<dynamic> jsonList = json.decode(inscriptionsJsonString);
  //     inscriptions = jsonList.map((json) => Inscription.fromJson(json)).toList();
  //   }
  //
  //   // Supprimer l'inscription avec l'id donné
  //   inscriptions.removeWhere((inscription) => inscription.id == id);
  //
  //   // Convertir la liste d'inscriptions mise à jour en JSON et stocker
  //   String updatedInscriptionsJsonString = json.encode(inscriptions.map((inscription) => inscription.toJson()).toList());
  //   await prefs.setString('inscriptions', updatedInscriptionsJsonString);
  // }
  // Future<void> _deleteInscription(int id) async {
  //   await deleteInscription(id);
  //   await _loadInscriptions();
  // }

  @override
  void initState() {
    super.initState();
    // _loadInscriptions();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

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
                                          child: Text("Enrollement", style: C.headLineStyle1.copyWith(color: Colors.blue.shade900),),
                                        ),
                                        20.verticalSpace,
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

                // Floating action menu item

                // Bubble(
                //   title:"Inscription en ligne",
                //   iconColor :C.textColor2,
                //   bubbleColor : C.mainColor,
                //   icon:Icons.web_asset_outlined,
                //   titleStyle:C.headLineStyle4.copyWith(color: C.textColor2),
                //   onPress: () async {
                //     final Uri _url = Uri.parse('https://inscription.demo-tna.com');
                //     if (!await launchUrl(_url,mode: LaunchMode.externalApplication)) {
                //     throw Exception(Api().showMsg('Could not launch $_url', context));
                //     }
                //     _animationController.reverse();
                //   },
                // ),
                // Bubble(
                //   title:"Inscription mobile",
                //   iconColor :C.textColor2,
                //   bubbleColor : C.mainColor,
                //   icon:Icons.smartphone_rounded,
                //   titleStyle:C.headLineStyle4.copyWith(color: C.textColor2),
                //   onPress: () {
                //     // _navigateToDetailsScreen();
                //     _animationController.reverse();
                //   },
                // ),
              ],
              // animation controller
              animation: _animation,

              // // On pressed change animation state
              // onPress: () => _animationController.isCompleted
              //     ? _animationController.reverse()
              //     : _animationController.forward(),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddForm();
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
  // _navigateToDetailsScreen() async {
  //   bool shouldNavigateToHomeTab = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => AddForm()),
  //   );
  //   if (shouldNavigateToHomeTab) {
  //     _loadInscriptions();
  //   Future.delayed(const Duration(milliseconds: 500), () {
  //   DefaultTabController.of(context).animateTo(2);
  //   });
  //   }
  // }




}