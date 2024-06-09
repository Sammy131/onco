//import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/bottom_navbar.dart';
import '/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'package:google_api_availability/google_api_availability.dart';

/*GooglePlayServicesAvailability availability = await GoogleApiAvailability
      .instance
      .checkGooglePlayServicesAvailability();
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseApp.initializeApp();
  await FirebaseAppCheck.instance.activate();
  FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.getInstance();
  firebaseAppCheck.installAppCheckProviderFactory(
      PlayIntegrityAppCheckProviderFactory.getInstance());*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  /*await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );*/
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(MyApp());

/*class FirebaseApp extends StatelessWidget {
  //const FirebaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCHOLAMETER',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: const InitializerWidget(),
    );
  }
}

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  @override
  State<InitializerWidget> createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  /*FirebaseAuthSettings authsettings = FirebaseAuth.instance.app.settings;
  authsettings.appVerificationDisabledForTesting = true;*/

  User? _user;
  dynamic _phoneNumber;
  bool isLoading = true;

  @override
  void initState() {
    //FirebaseAuth auth = FirebaseAuth.instance;
    /*mAuth.FirebaseAuthSettings.setAppVerificationDisabledForTesting(true);*/
    //FirebaseAuthSettings authSettings = auth.app.settings;

    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    _phoneNumber = FirebaseAuth.instance.currentUser?.phoneNumber;
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _setAppVerificationDisabledForTesting();

    return isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? const SignInScreen()
            : MyBottomNav();
  }

  /*void _setAppVerificationDisabledForTesting() {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseAuthSettings authSettings = auth.app.settings;
    authSettings.appVerificationDisabledForTesting = true;
    //FirebaseAuth.instance.appVerificationDisabledForTesting = true;
  }*/
}
