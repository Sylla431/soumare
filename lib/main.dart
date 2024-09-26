import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soumare/auth_pages/login.dart';
import 'package:soumare/transport/TransportBottomNavigationBar.dart';
import 'package:soumare/transport/transport_home_page.dart';
import 'package:upgrader/upgrader.dart';


import 'police/bottomNavigationBar.dart';
import 'utils/Colors.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    // await _configureAmplify();
    runApp(const MyApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

// Future<void> _configureAmplify() async {
//   try {
//     await Amplify.addPlugin(AmplifyAuthCognito());
//     await Amplify.configure(amplifyConfig);
//     safePrint('Successfully configured');
//   } on Exception catch (e) {
//     safePrint('Error configuring Amplify: $e');
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return ScreenUtilInit(
  //       designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
  //       ensureScreenSize: true,
  //       minTextAdapt: true,
  //       splitScreenMode: true,
  //       builder:(_, child) {
  //         return Authenticator(
  //           dialCodeOptions: const DialCodeOptions(defaultDialCode: DialCode.ml),
  //           child: MaterialApp(
  //             builder: Authenticator.builder(),
  //           title: 'Flutter Demo',
  //           debugShowCheckedModeBanner: false,
  //           theme: ThemeData(
  //             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //             useMaterial3: true,
  //
  //           ),
  //           home:UpgradeAlert(
  //             child: FlutterSplashScreen.fadeIn(
  //               backgroundColor: Colors.white,
  //               childWidget: SizedBox(
  //                 child: Center(child: Image.asset('assets/images/test.png',height: 0.24.sh,)),
  //               ),
  //               onAnimationEnd: () => debugPrint('est'),
  //               nextScreen: Login(),
  //               animationDuration: Duration(milliseconds: 5000),
  //               duration: Duration(milliseconds: 5000),
  //             ),
  //           ),
  //                   ),
  //         );}
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      // `authenticatorBuilder` is used to customize the UI for one or more steps
      authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return CustomScaffold(
              state: state,
              // A prebuilt Sign In form from amplify_authenticator
              body: SignInForm(),
              // A custom footer with a button to take the user to sign up
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('Vous n\'avez pas de compte?', style: C.headLineStyle4,),
                  TextButton(
                    onPressed: () => state.changeStep(
                      AuthenticatorStep.signUp,
                    ),
                    child:Text('S\'inscrire', style: C.headLineStyle4.copyWith(color: C.secondColor),),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.signUp:
            return CustomScaffold(
              state: state,
              // A prebuilt Sign Up form from amplify_authenticator
              body: SignUpForm(),
              // A custom footer with a button to take the user to sign in
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Vous avez déja un compte?', style: C.headLineStyle4,),
                  TextButton(
                    onPressed: () => state.changeStep(
                      AuthenticatorStep.signIn,
                    ),
                    child: Text('Se connecter', style: C.headLineStyle4.copyWith(color: C.secondColor),),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.confirmSignUp:
            return CustomScaffold(
              state: state,
              // A prebuilt Confirm Sign Up form from amplify_authenticator
              body: ConfirmSignUpForm(),
            );
          case AuthenticatorStep.resetPassword:
            return CustomScaffold(
              state: state,
              // A prebuilt Reset Password form from amplify_authenticator
              body: ResetPasswordForm(),
            );
          case AuthenticatorStep.confirmResetPassword:
            return CustomScaffold(
              state: state,
              // A prebuilt Confirm Reset Password form from amplify_authenticator
              body: const ConfirmResetPasswordForm(),
            );
          default:
          // Returning null defaults to the prebuilt authenticator for all other steps
            return null;
        }
      },
      child: ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
        ensureScreenSize: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            builder: Authenticator.builder(),
            debugShowCheckedModeBanner: false,
            home: UpgradeAlert(
              child: FlutterSplashScreen.fadeIn(
                        backgroundColor: Colors.white,
                        childWidget: SizedBox(
                          child: Center(child: Image.asset('assets/images/test.png',height: 0.24.sh,)),
                        ),
                        onAnimationEnd: () => debugPrint('est'),
                        nextScreen: Login(),
                        animationDuration: Duration(milliseconds: 5000),
                        duration: Duration(milliseconds: 5000),
                      ),
            ),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                // primarySwatch: Colors.mainColor,
                backgroundColor: C.mainColor,
              ),
              elevatedButtonTheme:ElevatedButtonThemeData(
                style:ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(C.mainColor),
                  foregroundColor: WidgetStatePropertyAll(Colors.red)
                 
                )
              ),


            ),


          );
        },

      )
    );
  }
}




/// A widget that displays a logo, a body, and an optional footer.
class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.state,
    required this.body,
    this.footer,
  });

  final AuthenticatorState state;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Spacer(),
              // App logo
               Padding(
                padding: EdgeInsets.only(top: 32),
                child: Center(child: Image.asset('assets/images/test.png',)),
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: body,
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
      persistentFooterButtons: footer != null ? [footer!] : null,
    );
  }
}
