// import 'package:flutter/material.dart';
// import 'package:maurivax/auth_pages/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../TransportBottomNavigationBar.dart';
//
// class CheckAuthStatus extends StatefulWidget {
//   CheckAuthStatus({Key? key}) : super(key: key);
//
//   @override
//   _CheckAuthStatusState createState() => _CheckAuthStatusState();
// }
//
// class _CheckAuthStatusState extends State<CheckAuthStatus> {
//   bool isAuthenticated = false;
//
//   _checkAuth() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     var token = localStorage.getString('token');
//     setState(() {
//       isAuthenticated = token != null && token.isNotEmpty;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _checkAuth();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isAuthenticated ? Navigation() : Login();
//   }
// }
