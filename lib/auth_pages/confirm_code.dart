
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:soumare/auth_pages/login.dart';

import '../police/bottomNavigationBar.dart';
import '../utils/Colors.dart';



class SmsveriWidget extends StatefulWidget {
  const SmsveriWidget({super.key});

  @override
  State<SmsveriWidget> createState() => _SmsveriWidgetState();
}

class _SmsveriWidgetState extends State<SmsveriWidget> {

  TextEditingController pinCodeController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> languages = [
    'Francais',
    'Anglais',
    'Arabe'
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
}

    // On page load action.


  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: C.textColor2,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xffFBFCFA)
          ),
          alignment: AlignmentDirectional(0,-1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                50.verticalSpace,
                Container(
                  width: 150.w,
                  height: 50.w,
                  margin: EdgeInsets.only(right: 220.w),
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                      // the menu padding when button's width is not specified.
                      contentPadding: EdgeInsets.symmetric(vertical: 16.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      // Add more decoration..
                    ),
                    hint:  Text(
                      'Langues',
                      style: C.headLineStyle5,
                    ),
                    items: languages
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                          item,
                          style: C.headLineStyle5
                      ),
                    ))
                        .toList(),
                    // validator: (value) {
                    //   if (value == null) {
                    //     return 'Please select gender.';
                    //   }
                    //   return null;
                    // },
                    onChanged: (value) {
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                    buttonStyleData:  ButtonStyleData(
                      padding: EdgeInsets.only(right: 8).w,
                    ),
                    iconStyleData:  IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24.sp
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                  ),
                ),
                // 10.verticalSpace,
                Padding(
                  padding:  EdgeInsetsDirectional.fromSTEB(0, 20.w, 0, 20.w),
                  child: Container(
                    width: 250.w,
                    height: 200.w,
                    alignment: AlignmentDirectional(0,0),
                    decoration: BoxDecoration(
                      image:DecorationImage(image: Image.asset("assets/images/test.png").image

                      ) ,
                    ),

                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 20.w,left: 20.w),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.w),
                          color: Colors.white
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                    'Confirmez votre code',
                                    style: C.headLineStyle3
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(44.w, 8.w, 44.w, 0),
                                  child: Text(
                                      'Ce code permet de garder votre compte sûr et sécurisé.',
                                      textAlign: TextAlign.center,
                                      style: C.headLineStyle5
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 32.w, 0, 0),
                                  child: PinCodeTextField(
                                    autoDisposeControllers: false,
                                    appContext: context,
                                    keyboardType: TextInputType.number,
                                    length: 6,
                                    textStyle:
                                    C.headLineStyle5,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    enableActiveFill: false,
                                    autoFocus: true,
                                    enablePinAutofill: true,
                                    errorTextSpace: 16,
                                    showCursor: true,
                                    cursorColor: C.mainColor,
                                    obscureText: false,
                                    hintCharacter: '-',
                                    pinTheme: PinTheme(
                                        fieldHeight: 50.h,
                                        fieldWidth: 50.w,
                                        borderWidth: 2,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ).w,
                                        shape: PinCodeFieldShape.box,
                                        activeColor: C.mainColor,
                                        inactiveColor:
                                        C.textColor,
                                        selectedColor:
                                        C.mainColor,
                                        activeFillColor: C.mainColor1,
                                        inactiveFillColor:
                                        C.mainColor1,
                                        selectedFillColor:
                                        C.textColor2
                                    ),
                                    controller: pinCodeController,
                                    onChanged: (_) {},
                                    autovalidateMode: AutovalidateMode.onUserInteraction,

                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24.w, 0, 0.w),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // foregroundColor: Colors.black54,
                                  backgroundColor: C.mainColor1,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                ),

                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return Login();
                                  },));
                                },
                                child: Text('Confirmer et continuer',style:C.headLineStyle2.copyWith(color: C.textColor2))),
                          ),

                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24.w, 0, 0.w),
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  // foregroundColor: Colors.black54,
                                  backgroundColor: C.mainColor1,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                ),

                                onPressed: () {

                                },
                                label: Text('Resend code',style:C.headLineStyle2.copyWith(color: C.textColor2)),
                              icon: Icon(Icons.sms_rounded,size: 25.sp,color: C.textColor2,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24.w, 0, 20.w),
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  // foregroundColor: Colors.black54,
                                  backgroundColor: C.mainColor,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                icon: Icon(Icons.refresh_sharp,size: 25.sp,color: C.textColor2,),
                                label:
                                    Text('Retour',style:C.headLineStyle2.copyWith(color: C.textColor2)),

                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

