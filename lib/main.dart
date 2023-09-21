import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ps_barber/features/app/splash_screen/splash_screen.dart';
import 'package:ps_barber/features/user_auth/presentation/pages/agendar_page.dart';
import 'package:ps_barber/features/user_auth/presentation/pages/citas_page.dart';
import 'package:ps_barber/features/user_auth/presentation/pages/editar_page.dart';
import 'package:ps_barber/features/user_auth/presentation/pages/login_page.dart';
import 'package:ps_barber/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:ps_barber/features/user_auth/presentation/widgets/nav.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCYS7dRZwMPudYX4p1hjKiNtGgdaTHRtRs",
        appId: "1:3995044910:web:b5d0f0d23117cb42f123bf",
        messagingSenderId: "3995044910",
        projectId: "flutter-firebase-bb872",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PS Barber',
      routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => NavWidget(),
        '/agendar':(context) => AgendarPage(),
        '/citas':(context) => CitasPage(),
        '/editar':(context) => EditarPage(),
      },
    );
  }
}

