import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:hibye/utils/generate_material_color.dart';
import 'package:hibye/services/authentication_service.dart';
import 'package:hibye/screens/landing.dart';
import 'package:hibye/screens/select_organization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return const Center(
        child: Text('Oops! Something went wrong!'),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
          title: 'HiBye',
          theme: ThemeData(
              primarySwatch: generateMaterialColor(const Color(0xFF1F3C88)),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Spartan',
              textTheme: const TextTheme(
                  headline1: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 104,
                      fontWeight: FontWeight.w300),
                  headline2: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 65,
                      fontWeight: FontWeight.w300),
                  headline3: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 52,
                      fontWeight: FontWeight.w400),
                  headline4: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 37,
                      fontWeight: FontWeight.w600),
                  headline5: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 26,
                      fontWeight: FontWeight.w400),
                  headline6: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                  subtitle1: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                  subtitle2: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  bodyText1:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  bodyText2:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  button: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  overline:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.w400))),
          home: const AuthenticationWrapper()),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const SelectOrganization();
    }
    return const Landing();
  }
}
