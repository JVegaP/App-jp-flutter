import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/themes/app_theme.dart';
import 'package:jp_app_flutter/presentation/providers/cities/cities_provider.dart';
import 'package:jp_app_flutter/presentation/providers/games/games_provider.dart';
import 'package:jp_app_flutter/presentation/providers/login/login_provider.dart';
import 'package:jp_app_flutter/presentation/providers/splash/splash_provider.dart';
import 'package:jp_app_flutter/presentation/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class JpApp extends StatefulWidget {
  const JpApp({
    Key? key
  }) : super(key: key);

  @override
  JpAppState createState() => JpAppState();
}

class JpAppState extends State<JpApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kPrimary.withOpacity(.9))
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => CitiesProvider()),
        ChangeNotifierProvider(create: (_) => GamesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: AppTheme.getAppTheme(),
      ),
    );
  }
}