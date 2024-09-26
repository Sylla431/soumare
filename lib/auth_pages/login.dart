import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:soumare/auth_pages/register.dart';
import 'package:soumare/transport/TransportBottomNavigationBar.dart';
import 'package:soumare/transport/transport_home_page.dart';

import '../police/bottomNavigationBar.dart';
import '../component/remember_me.dart';
import '../utils/Colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController telephone = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isPasswordVisible = true;
  final List<String> languages = ['Francais', 'Anglais'];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  late TapGestureRecognizer _onTapRecognizer;
  var remember=false;
  // _login() async {
  //   var data = {'telephone': telephone.text, 'password': password.text};
  //
  //   print(telephone.text);
  //   print(password.text);
  //
  //   var response = await Api().postData(data, '/login');
  //   try {
  //     var body = json.decode(response.body);
  //     if (body['status'] == true) {
  //       SharedPreferences localStorge = await SharedPreferences.getInstance();
  //
  //       // var remember=localStorge.getString('remember');
  //
  //       if(remember==true){
  //       localStorge.setString('token', body['token']);
  //       }else{
  //         localStorge.setString('token', '');
  //       }
  //       print(body['message']);
  //       Api().showMsg(body['message'], context);
  //       Navigator.pushReplacement(context, MaterialPageRoute(
  //         builder: (context) {
  //           return Navigation();
  //         },
  //       ));
  //     } else {
  //       print(body['message']);
  //       Api().showMsg(body['message'].toString(), context);
  //     }
  //   } catch (e) {
  //     print('++++++++++++++++${e}');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _onTapRecognizer = TapGestureRecognizer()..onTap = _handlePress;
  }

  @override
  void dispose() {
    _onTapRecognizer.dispose();
    super.dispose();
  }

  _handlePress() {
    HapticFeedback.vibrate();
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Register();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(color: Color(0xffFBFCFA)),
          alignment: AlignmentDirectional(0, -1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                50.verticalSpace,
                Container(
                  width: 150.w,
                  height: 60.h,
                  margin: EdgeInsets.only(right: 220.w),
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                      // the menu padding when button's width is not specified.
                      contentPadding: EdgeInsets.symmetric(vertical: 8.w),
                      border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      // Add more decoration..
                    ),
                    hint: Text('Langues',style: C.headLineStyle4,),
                    items: languages
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: C.headLineStyle5),
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
                    buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.only(right: 8).w,
                    ),
                    iconStyleData: IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24.sp),
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

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40.w, 0, 32.w),
                  child: Container(
                    width: 250.w,
                    height: 200.w,
                    alignment: AlignmentDirectional(0, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset("assets/images/test.png")
                              .image),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.w),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25).r,
                            child: Text(
                              'Connexion',
                              style: C.headLineStyle0,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          30.verticalSpace,
                          Padding(
                            padding: EdgeInsets.only(right: 32, left: 32).r,
                            child: TextFormField(
                                controller: telephone,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  label: Text('Numero de téléphone'),
                                  labelStyle: C.headLineStyle4,
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: C.mainColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: C.textColor,
                                        width: 1,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.w)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.transparent),
                                      borderRadius:
                                          BorderRadius.circular(20.w)),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Champ obligatoire';
                                  }
                                  return null;
                                }),
                          ),
                          30.verticalSpace,
                          Padding(
                            padding: EdgeInsets.only(right: 32, left: 32).r,
                            child: TextFormField(
                              controller: password,
                              obscureText: isPasswordVisible,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  label: Text('Code pin'),
                                  labelStyle: C.headLineStyle4,
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.transparent)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: C.textColor,
                                        width: 1,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.w)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.transparent),
                                      borderRadius:
                                          BorderRadius.circular(20.w)),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    child: Icon(isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off_rounded),
                                  )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Champ obligatoire';
                                  }
                                  return null;
                                }
                            ),
                          ),
                          10.verticalSpace,
                          RememberMeCheckbox(
                            onChanged: (value) async {
                              // Faites quelque chose avec la valeur du checkbox
                              SharedPreferences localStorge = await SharedPreferences.getInstance();
                              if(value==true){
                              setState(() {
                                remember=true;
                                print('++++++++++$remember');
                              });
                              }
                              print('Se souvenir de moi: $value');
                            },
                          ),
                          50.verticalSpace,
                          ElevatedButton(
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
                                // if (_formKey.currentState!.validate()) {
                                //   _login();
                                // }
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                            builder: (context) {
                                              return PoliceNavigation();
                                            },
                                          ));
                              },
                              child: Text('Se connecter',
                                  style: C.headLineStyle2
                                      .copyWith(color: C.textColor2))),
                          20.verticalSpace,
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Vous n\'avez pas de compte? ',
                                style: C.headLineStyle4),
                            TextSpan(
                                text: 'Inscrivez Vous',
                                style: C.headLineStyle4
                                    .copyWith(color: C.mainColor),
                                recognizer: _onTapRecognizer)
                          ])),
                          20.verticalSpace,
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
