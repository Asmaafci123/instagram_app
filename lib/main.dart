import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/presentation_layer/home_screen.dart';
import 'package:intnstagram/presentation_layer/login_screen.dart';
import 'package:intnstagram/presentation_layer/splash_screen.dart';

import 'Business_logic/App_Cubit/cubit.dart';
import 'cache_helper.dart';
import 'constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  uId=await CacheHelper.getData(key: 'uId');
  Widget startWidget;
  if(uId!=null)
    {
      startWidget=HomeScreen();
    }
  else
    {
      startWidget=LoginScreen();
    }
  runApp(Instagram(startWidget: startWidget));
}

class Instagram extends StatelessWidget {
  late final Widget startWidget;
  Instagram({required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>AppCubit()..getUserData()..getPosts())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       routes: <String,WidgetBuilder>{
         '/': (context) => SplashScreen(),
         '/startWidget': (context) => startWidget,
         // '/signup': (context) => SignUpScreen(),
         // '/home': (context) => HomeScreen(),
       },
      ),
    );
  }
}
