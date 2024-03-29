import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/firebase_options.dart';
import 'package:grocery/models/model_providers/admin_provider.dart';
import 'package:grocery/models/model_providers/home/cart_provider.dart';
import 'package:grocery/models/model_providers/home/oder_provider.dart';
import 'package:grocery/models/model_providers/home/product_provider.dart';
import 'package:grocery/models/model_providers/singin_provider.dart';
import 'package:grocery/models/model_providers/singup_provider.dart';
import 'package:grocery/models/model_providers/user_provider.dart';
import 'package:grocery/screens/main/favouritse/favouritse.dart';
import 'package:grocery/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Singup_Provider()),
      ChangeNotifierProvider(create: (_) => Singin_Provider()),
      ChangeNotifierProvider(create: (_) => User_Provider()),
      ChangeNotifierProvider(create: (_) => Admin_Provider()),
      ChangeNotifierProvider(create: (_) => Product_Provider()),
      ChangeNotifierProvider(create: (_) => Cart_Provider()),
      ChangeNotifierProvider(create: (_) => OderProvider()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      home: SplashScreen(),
    );
  }
}

