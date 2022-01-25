import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intnstagram/presentation_layer/home_screen.dart';
import 'package:intnstagram/presentation_layer/login_screen.dart';
import 'package:intnstagram/presentation_layer/register_screen.dart';
import 'package:intnstagram/presentation_layer/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Instagram());
}

class Instagram extends StatelessWidget {
  const Instagram({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: <String,WidgetBuilder>{
     //  '/': (context) => SplashScreen(),
       '/': (context) => LoginScreen(),
       // '/signup': (context) => SignUpScreen(),
       // '/home': (context) => HomeScreen(),
     },
    );
  }
}
